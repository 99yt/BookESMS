package cn.blb.dao;

import cn.blb.dao.bean.catProduct;

import java.util.List;
import java.util.Map;

public interface CartDao {
    Integer addCart(Integer cartId, Integer productId, String mark, Integer quantity);

    Map<String, Object> queryCart(Integer cartId);

    Integer clearCart(Integer cartId);

    Integer delProduct(Integer cartId, Integer productId);

    public List<catProduct> getCartProducts(Integer cartId, Integer isDel);

    Map<String, Object> getNewProduct(Integer cartId);

    Integer getCartId(Integer userId);

    Map<String, Object> getTotalData(Integer cartId);
}
