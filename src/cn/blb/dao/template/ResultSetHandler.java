package cn.blb.dao.template;

import java.sql.ResultSet;

public interface ResultSetHandler {

	public Object doHandler(ResultSet rs) throws Exception;

}
