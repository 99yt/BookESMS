package cn.blb.dao.factory;

import cn.blb.dao.BookCategoryDao;
import cn.blb.dao.impl.BookCategoryDaoImpl;

public class BookCategoryFactory {

    public static BookCategoryDao getInstance() {
        return new BookCategoryDaoImpl();
    }
}
