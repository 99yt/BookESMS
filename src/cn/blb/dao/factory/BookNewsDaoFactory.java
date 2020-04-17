package cn.blb.dao.factory;

import cn.blb.dao.BookNewsDao;
import cn.blb.dao.impl.BookNewsDaoImpl;

public class BookNewsDaoFactory {

    public static BookNewsDao getInstance(){
        return new BookNewsDaoImpl();
    }

}
