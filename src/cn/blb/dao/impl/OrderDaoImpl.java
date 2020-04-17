package cn.blb.dao.impl;

import cn.blb.dao.OrderDao;
import cn.blb.dao.bean.Order;
import cn.blb.dao.bean.catProduct;
import cn.blb.dao.template.JDBCTemplate;
import cn.blb.dao.template.ResultSetHandler;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDao {
    private JDBCTemplate template = new JDBCTemplate();
    @Override
    public Integer addOrder(Integer userId, String time, Double totalPrice, List<catProduct> list) {
        // 新增订单
        String insertOrdersql = "INSERT INTO blb_order "
                + "(user_id, status, order_time, total_price, payment_id, invoice_id, reveive_address_id, bak) "
                + "VALUES (?, 0, ?, ?, 0, 0, 0, null)";
        template.update(insertOrdersql, userId, time, totalPrice);
        // 获取订单号
        String getOrderIdsql = "SELECT order_id FROM blb_order WHERE order_time = ?";
        Integer orderId = (Integer) template.query(getOrderIdsql, new ResultSetHandler() {

            @Override
            public Object doHandler(ResultSet rs) throws Exception {
                if (rs.next()) {
                    return rs.getInt("order_id");
                }
                return null;
            }
        }, time);
        // 新增明细
        String insertItemsql = "INSERT INTO blb_order_item (order_id, product_id, product_quantity) VALUES (?, ?, ?);";
        for (catProduct cp : list) {
            template.update(insertItemsql, orderId, cp.getProduct_id(), cp.getQuantity());
        }
        return orderId;
    }

    @Override
    public List<Order> queryOrder(Integer userId) {
        // 获取订单id
        String getOrdersql = "SELECT order_id FROM blb_order WHERE user_id = ?";
        List<Integer> orderIds = (List<Integer>) template.query(getOrdersql, new ResultSetHandler() {

            @Override
            public Object doHandler(ResultSet rs) throws Exception {
                List<Integer> ids = new ArrayList<>();
                while (rs.next()) {
                    Integer id = rs.getInt("order_id");
                    ids.add(id);
                }
                return ids;
            }
        }, userId);
        if (orderIds == null) {
            return null;
        }

        List<Order> list = new ArrayList<>();
        // 遍历orderIds
        for (int i = 0; i < orderIds.size(); i++) {
            // 获取订单的唯一数据
            Order order = getOneData(orderIds.get(i));
            // 获取订单商品
            List<catProduct> products = getOrderProducts(orderIds.get(i));
            order.setOrderId(orderIds.get(i));
            order.setProducts(products);
            list.add(order);
        }
        return list;
    }

    @Override
    public Order getOneOrder(Integer orderId) {
        Order order = getOneData(orderId);
        order.setOrderId(orderId);
        order.setProducts(getOrderProducts(orderId));
        return order;
    }

    // 获取订单唯一数据
    public Order getOneData(Integer orderId) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String getOneData = "SELECT u.REAL_NAME, o.total_price, o.order_time, o.status "
                + "FROM blb_order o LEFT JOIN blb_user u ON o.user_id = u.ID " + "WHERE o.order_id = ?";
        Order order = (Order) template.query(getOneData, new ResultSetHandler() {

            @Override
            public Object doHandler(ResultSet rs) throws Exception {
                Order order = new Order();
                if (rs.next()) {
                    order.setRealName(rs.getString("REAL_NAME"));
                    order.setTotalPrice(rs.getDouble("total_price"));
                    order.setOrderTime(sdf.format(rs.getTimestamp("order_time")));
                    order.setStatus(rs.getString("status"));
                }
                return order;
            }
        }, orderId);
        return order;
    }

    // 获取订单的商品
    public List<catProduct> getOrderProducts(Integer orderId) {
        String getOrderProductssql = "SELECT p.product_id, p.lower_price, i.product_quantity, p.name, p.picture "
                + "FROM blb_order o LEFT JOIN blb_order_item i ON o.order_id = i.order_id "
                + "LEFT JOIN blb_product p ON i.product_id = p.product_id " + "WHERE o.order_id = ?";

        List<catProduct> products = (List<catProduct>) template.query(getOrderProductssql, new ResultSetHandler() {

            @Override
            public Object doHandler(ResultSet rs) throws Exception {
                List<catProduct> list = new ArrayList<>();
                while (rs.next()) {
                    catProduct product = new catProduct();
                    product.setProduct_id(rs.getInt("product_id"));
                    product.setPrice(rs.getDouble("lower_price"));
                    product.setQuantity(rs.getInt("product_quantity"));
                    product.setName(rs.getString("name"));
                    product.setPicture(rs.getString("picture"));
                    list.add(product);
                }
                return list;
            }
        }, orderId);
        return products;
    }
}
