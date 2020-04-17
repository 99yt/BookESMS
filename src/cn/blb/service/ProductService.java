package cn.blb.service;

import cn.blb.dao.ProductDao;
import cn.blb.dao.bean.BlbProduct;
import cn.blb.dao.factory.ProductDaoFactory;

import java.sql.SQLException;
import java.util.List;

public class ProductService {
    private ProductDao productDao;


    public ProductService() {
        super();
        this.productDao = ProductDaoFactory.getInstance();
    }

    public  BlbProduct getbookDetail(Integer productId) throws SQLException {
        return productDao.getbookDetail(productId);
    }



    public  List<BlbProduct> getBookList(Integer categoryId, String key, String field, String order, Integer limit) throws SQLException {
                return productDao.getBookList(categoryId,key,field,order,limit);
    }

    /**
     *  查询商品
     * @param category_id 商品分类
     * @param pageNum 页码
     * @param pageSize 每页条数
     * @param orderFiled 排序字段
     * @param orderStyle 排序方式
     * @return 商品列表
     * @throws SQLException
     */
    public List<BlbProduct> queryAllProductOrderByFiledAndLimitN(int category_id, int pageNum, int pageSize,
                                                                 String orderFiled, String orderStyle) throws SQLException {

        return productDao.queryAllProductOrderByFiledAndLimitN(category_id, pageNum, pageSize,
                orderFiled, orderStyle) ;
    }

}
