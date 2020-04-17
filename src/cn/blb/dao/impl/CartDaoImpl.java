package cn.blb.dao.impl;

import cn.blb.dao.CartDao;
import cn.blb.dao.bean.BlbProduct;
import cn.blb.dao.bean.catProduct;
import cn.blb.dao.template.JDBCTemplate;
import cn.blb.dao.template.ResultSetHandler;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CartDaoImpl implements CartDao {
    private JDBCTemplate template = new JDBCTemplate();

    @Override
    public Integer addCart(Integer cartId, Integer productId, String mark, Integer quantity) {
        // 判断购物车中是否存在要加入的商品
        String getProductIdsql = "SELECT product_id FROM blb_cart_products WHERE cart_id = ? AND is_del = 0";
        List<Integer> productIds = (List<Integer>) template.query(getProductIdsql, new ResultSetHandler() {

            @Override
            public Object doHandler(ResultSet rs) throws Exception {
                List<Integer> list = new ArrayList<>();
                while (rs.next()) {
                    Integer productId = rs.getInt("product_id");
                    list.add(productId);
                }
                return list;
            }
        }, cartId);
        if (productIds != null && productIds.contains(productId)) {//集合不能为空并且包含了这个id
            // 存在，判断加减，判断数量
            String updateQuantitysql = "UPDATE blb_cart_products SET quantity = quantity ";
            if ("add".equals(mark)) {
                updateQuantitysql = updateQuantitysql + " + " + quantity;
            } else if ("cut".equals(mark)) {
                updateQuantitysql = updateQuantitysql + " -1 ";
            }
            updateQuantitysql = updateQuantitysql + " WHERE cart_id = ? AND product_id = ?";
            template.update(updateQuantitysql, cartId, productId);
        } else {
            // 不存在，新增
            // 获取商品单价
            String getPricesql = "SELECT lower_price FROM blb_product WHERE product_id = ?";
            Double price = (Double) template.query(getPricesql, new ResultSetHandler() {

                @Override
                public Object doHandler(ResultSet rs) throws Exception {
                    if (rs.next()) {
                        return rs.getBigDecimal("lower_price");
                    } else {
                        return null;
                    }
                }
            }, productId);
            String insertProductsql = "INSERT INTO blb_cart_products (cart_id, product_id, price, quantity) VALUES (?, ?, ?, ?)";
            template.update(insertProductsql, cartId, productId, price, quantity);
        }
        // 更新cart表中的商品总数与总价
        return updateTotalData(cartId);
    }

    @Override
    public Map<String, Object> queryCart(Integer cartId) {
        // 获取书籍总数与总价
        Map<String, Object> map = getTotalData(cartId);
        // 获取blb_cart_products表中商品数据
        List<catProduct> products = getCartProducts(cartId, 0);
        map.put("products", products);
        return map;
    }

    @Override
    public Integer clearCart(Integer cartId) {
        String clearsql = "DELETE FROM blb_cart_products WHERE cart_id = ? AND is_del = 0 ";
        template.update(clearsql, cartId);
        String updatesql = "UPDATE blb_cart SET total_price = 0, total_quantity = 0 WHERE cart_id = ?";
        return template.update(updatesql, cartId);
    }

    @Override
    public Integer delProduct(Integer cartId, Integer productId) {
        String updatesql = "UPDATE blb_cart_products SET is_del = 1 WHERE cart_id = ? AND product_id = ?";
        template.update(updatesql, cartId, productId);
        // 更新cart表中的商品总数与总价
        return updateTotalData(cartId);
    }
    public Integer updateTotalData(Integer cartId) {
        String getTotalsql = "SELECT product_id, price, quantity FROM blb_cart_products WHERE cart_id = ? AND is_del = 0";
        List<catProduct> carts = (List<catProduct>) template.query(getTotalsql, new ResultSetHandler() {

            @Override
            public Object doHandler(ResultSet rs) throws Exception {
                List<catProduct> list = new ArrayList<>();
                while (rs.next()) {
                    catProduct cat = new catProduct();
                    cat.setProduct_id(rs.getInt("product_id"));
                    cat.setPrice(rs.getDouble("price"));
                    cat.setQuantity(rs.getInt("quantity"));
                    list.add(cat);
                }
                return list;
            }
        }, cartId);
        Double totalPrice = 0.0;
        Integer totalQuantity = 0;
        for (catProduct cp : carts) {
            Double price1 = cp.getPrice();
            Double quantity1 = new Double(cp.getQuantity());
            price1 = (price1*quantity1);
            totalPrice = (totalPrice+price1);//总价
            totalQuantity += cp.getQuantity();//总数量
        }
        // 更新总数总价
        String updateTotalsql = "UPDATE blb_cart SET total_price = ?, total_quantity = ? WHERE cart_id = ?";
        return template.update(updateTotalsql, totalPrice, totalQuantity, cartId);
    }

    @Override
    public List<catProduct> getCartProducts(Integer cartId, Integer isDel) {
        String getCartProductssql = "SELECT cp.product_id, cp.price, cp.quantity, p.picture, p.name "
                + "FROM blb_cart_products cp LEFT JOIN blb_product p ON cp.product_id = p.product_id "
                + "WHERE cp.cart_id = ? AND cp.is_del = ?";
        return (List<catProduct>) template.query(getCartProductssql, new ResultSetHandler() {

            @Override
            public Object doHandler(ResultSet rs) throws Exception {
                List<catProduct> list = new ArrayList<>();
                while (rs.next()) {
                    catProduct cart = new catProduct();
                    cart.setProduct_id(rs.getInt("product_id"));
                    cart.setName(rs.getString("name"));
                    cart.setPicture(rs.getString("picture"));
                    cart.setPrice(rs.getDouble("price"));
                    cart.setQuantity(rs.getInt("quantity"));
                    list.add(cart);
                }
                return list;
            }
        }, cartId, isDel);
    }
    //获取购物车最新加入的书籍
    @Override
    public Map<String, Object> getNewProduct(Integer cartId) {
      // 获取书籍总数与总价
        Map<String, Object> map = getTotalData(cartId);
        // 获取最新的商品
        String getNewsql = "SELECT cp.price, p.picture, p.name "
                + "FROM blb_cart_products cp LEFT JOIN blb_product p ON cp.product_id = p.product_id "
                + "WHERE cp.id = (SELECT MAX(id) FROM blb_cart_products WHERE cart_id = ? AND is_del = 0)";
        BlbProduct product = (BlbProduct) template.query(getNewsql, new ResultSetHandler() {

            @Override
            public Object doHandler(ResultSet rs) throws Exception {
                BlbProduct product = new BlbProduct();
                if (rs.next()) {
                    product.setName(rs.getString("name"));
                    product.setLower_price(rs.getFloat("price"));
                    product.setPicture(rs.getString("picture"));
                }
                return product;
            }
        }, cartId);
        map.put("newProduct", product);
        return map;
    }


    //购物车id，登录的时候存入session
    @Override
    public Integer getCartId(Integer userId) {
        String getCartIdsql = "SELECT cart_id FROM blb_cart WHERE user_id = ?";
        return (Integer) template.query(getCartIdsql, new ResultSetHandler() {
            @Override
            public Object doHandler(ResultSet rs) throws Exception {
                if (rs.next()) {
                    return rs.getInt("cart_id");
                } else {
                    return null;
                }


            }
        }, userId);
    }

    //购物车的书籍总数和总价
    @Override
    public Map<String, Object> getTotalData(Integer cartId) {
        String getTotalsql = "SELECT total_price, total_quantity FROM blb_cart WHERE cart_id = ?";
        Object[] objs = (Object[]) template.query(getTotalsql, new ResultSetHandler() {

            @Override
            public Object doHandler(ResultSet rs) throws Exception {
                if (rs.next()) {
                    Object[] objs = new Object[2];
                    Double totalPrice = rs.getDouble("total_price");
                    objs[0] = totalPrice;
                    Integer totalQuantity = rs.getInt("total_quantity");
                    objs[1] = totalQuantity;
                    return objs;
                } else {
                    return null;
                }
            }
        }, cartId);
        if (objs == null) {
            return null;
        }
        Map<String, Object> map = new HashMap<>();
        map.put("cartId", cartId);
        map.put("totalPrice", objs[0]);
        map.put("totalQuantity", objs[1]);
        return map;
    }
}
