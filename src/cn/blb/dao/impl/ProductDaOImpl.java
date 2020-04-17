package cn.blb.dao.impl;

import cn.blb.dao.ProductDao;
import cn.blb.dao.bean.BlbProduct;
import cn.blb.util.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductDaOImpl implements ProductDao {
    QueryRunner qr;
    @Override
    public List<BlbProduct> queryAllProductOrderByFiledAndLimitN(int category_id, int pageNum, int pageSize, String orderFiled, String orderStyle) throws SQLException {
        System.out.println("..............");
        String sql = "select p.* from blb_product p , blb_category_product cp where p.product_id=cp.product_id "+
                " and cp.category_id=? order by  "+orderFiled+" " + orderStyle +" limit ?,?";
        Connection conn = DBUtils.getConnection();
        PreparedStatement pst = conn.prepareStatement(sql);
        //补全占位符
        pst.setInt(1, category_id);
        pst.setInt(2, pageSize*(pageNum-1));
        pst.setInt(3, pageSize);
        ResultSet rs = pst.executeQuery();
        BlbProduct product =  null;
        List<BlbProduct> products = new ArrayList<>();
        while(rs.next()){
            product = new BlbProduct();
            product.setProduct_id(rs.getInt("product_id"));
            product.setName(rs.getString("name"));
            product.setFixed_price(rs.getFloat("fixed_price"));
            product.setPublish_time(new Date(rs.getDate("publish_time").getTime()));
            product.setPicture(rs.getString("picture"));
            products.add(product);
        }
        return products;
    }

    @Override
    public List<BlbProduct> getBookList(Integer categoryId, String key, String field, String order, Integer limit) throws SQLException {
            String sql="SELECT * FROM blb_product";
            if(categoryId==null){
                if (key !=null){
                    sql=sql+" where name like '%" +key+ "%'";
                }
            }else {
                sql=sql+" where product_id in(select product_id from blb_category_product where category_id= "+categoryId+")";

            }
            sql=sql+" ORDER BY "+field+" "+order;
            if (limit !=null){
                sql=sql+" limit "+limit;
            }
        qr=new QueryRunner();
        return qr.query(DBUtils.getConnection(),sql,new BeanListHandler<>(BlbProduct.class));
    }

    @Override
    public BlbProduct getbookDetail(Integer productId) throws SQLException {
        String sql = "SELECT * FROM blb_product WHERE product_id = ?";
        return qr.query(DBUtils.getConnection(),sql,new BeanHandler<>(BlbProduct.class),productId);
    }
}
