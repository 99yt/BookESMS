package cn.blb.service;

import cn.blb.dao.CartDao;
import cn.blb.dao.bean.catProduct;
import cn.blb.dao.factory.CartDaoFactory;

import java.util.List;
import java.util.Map;

public class CartService {
    private CartDao cartDao;


    public CartService() {
        super();
        this.cartDao = CartDaoFactory.getInstance();
    }

     public  Integer getCartId(Integer userId){
        return cartDao.getCartId(userId);
     }
    public Integer addCart(Integer cartId, Integer productId, String mark, Integer quantity) {
       return cartDao.addCart( cartId,  productId,  mark,  quantity);
    }

    public Map<String, Object> queryCart(Integer cartId) {
        return cartDao.queryCart(cartId);
    }

    public Integer clearCart(Integer cartId) {
        return cartDao.clearCart(cartId);
    }

    public Integer delProduct(Integer cartId, Integer productId) {
        return cartDao.delProduct(cartId,productId);
    }

    public List<catProduct> getCartProducts(Integer cartId, int i) {
        return cartDao.getCartProducts(cartId,i);
    }

    public  Map<String, Object> getNewProduct(Integer cartId) {
        return cartDao.getNewProduct(cartId);
    }public  Map<String, Object> getTotalData(Integer cartId) {
        return cartDao.getTotalData(cartId);
    }


}
