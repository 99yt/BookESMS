package cn.blb.controller;

import cn.blb.controller.base.BaseServlet;
import cn.blb.dao.bean.BlbProduct;
import cn.blb.service.ProductService;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * 查询主页book_list.jsp中的内容
 *
 *  商品信息
 */
@WebServlet("/bookList")
public class BookListServlet extends BaseServlet {
    private ProductService productService = new ProductService();//处理商品相关的业务

    public void queryProductAjax(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		/*var orderFiled="sale_count"; //排序字段
		var orderStyle = "desc"; //排序方式
		var pageNum = 1; //当前页面
		var pageSize = 5;// 每页的条数
		var category_id;//当前商品的二级分类中某一个菜单的id
*/
        try {
            System.out.println("进来");
            //查询菜单的父id:parent_id
            int category_id = Integer.parseInt(request.getParameter("category_id"));
            int pageNum = Integer.parseInt(request.getParameter("pageNum"));
            int pageSize = Integer.parseInt(request.getParameter("pageSize"));
            String orderStyle = request.getParameter("orderStyle");
            String orderFiled = request.getParameter("orderFiled");


            System.out.println("category_id:"+category_id);
            System.out.println("pageNum:"+pageNum);
            System.out.println("pageSize:"+pageSize);
            System.out.println("orderStyle:"+orderStyle);
            System.out.println("orderFiled:"+orderFiled);


            // 1. 查询图书咨询 // 查询其他类型数据
            List<BlbProduct> products = productService.queryAllProductOrderByFiledAndLimitN(
                    category_id,pageNum,pageSize,orderFiled,orderStyle);
            System.out.println("------------------");
            for (BlbProduct product : products) {
                System.out.println("商品信息："+product);
            }
            System.out.println("json："+ JSONArray.fromObject(products));
            // 2. 将查询到数据，转发给book.jsp在服务器拼写查询到图书数据，返回拼写完毕的页面
            response.getWriter().print(JSONArray.fromObject(products));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void getBookList(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        Integer categoryId = null;
        if (request.getParameter("categoryId") != null) {
            categoryId = Integer.parseInt(request.getParameter("categoryId"));
        }
        String field = request.getParameter("field");
        String order = request.getParameter("order");
        Integer limit = null;
        if (request.getParameter("limit") != null) {
            limit = Integer.parseInt(request.getParameter("limit"));
        }
        String key = null;
        if (request.getParameter("key") != null) {
            key = request.getParameter("key");
        }
        List<BlbProduct> products = productService.getBookList(categoryId, key, field, order, limit);
        if (products != null)
            for (BlbProduct product : products) {
                formatTime(product);
            }
        response.getWriter().print(JSONArray.fromObject(products));
    }

    public BlbProduct formatTime(BlbProduct product) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if (product.getAdd_time() != null) {
            product.setAddTimeStr(sdf.format(product.getAdd_time()));
            product.setAdd_time(null);
        }
        if (product.getPublish_time() != null) {
            product.setPublishTimeStr(sdf.format(product.getPublish_time()));
            product.setPublish_time(null);
        }
        return product;
    }


    public void getbookDetail(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        Integer productId = Integer.parseInt(request.getParameter("productId"));
        BlbProduct product = formatTime(productService.getbookDetail(productId));
        response.getWriter().print(JSONArray.fromObject(product).getJSONObject(0));
    }


}
