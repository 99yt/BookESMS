package cn.blb.dao;

import cn.blb.dao.bean.BlbProduct;

import java.sql.SQLException;
import java.util.List;

public interface ProductDao {

    List<BlbProduct> queryAllProductOrderByFiledAndLimitN(int category_id, int pageNum, int pageSize,
                                                          String orderFiled, String orderStyle) throws SQLException;

    List<BlbProduct> getBookList(Integer categoryId, String key, String field, String order, Integer limit) throws SQLException;

    BlbProduct getbookDetail(Integer productId) throws SQLException;
}
