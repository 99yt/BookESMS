package cn.blb.dao;

import cn.blb.dao.bean.BookCategory;

import java.sql.SQLException;
import java.util.List;

public interface BookCategoryDao {
    public static final String SQL_QUERY_BOOK_CATEGORY = "select * from blb_category where parent_id=?";

    List<BookCategory>queryCategories(int parent_id) throws SQLException;
}
