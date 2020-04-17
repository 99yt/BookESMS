package cn.blb.service;

import cn.blb.dao.BookCategoryDao;
import cn.blb.dao.bean.BookCategory;
import cn.blb.dao.factory.BookCategoryFactory;

import java.sql.SQLException;
import java.util.List;

//处理图书分类相关业务
public class BookCategoryService {

    private BookCategoryDao dao;

    public BookCategoryService( ) {
        this.dao = BookCategoryFactory.getInstance();
    }

    public List<BookCategory>  queryCategories(int parent_id) throws SQLException {
        return dao.queryCategories(parent_id);
    }
}
