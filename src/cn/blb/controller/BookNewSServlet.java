package cn.blb.controller;

import cn.blb.controller.base.BaseServlet;
import cn.blb.dao.bean.BlbActive;
import cn.blb.dao.bean.BlbPublishing;
import cn.blb.dao.bean.BookCategory;
import cn.blb.dao.bean.BookNews;
import cn.blb.service.BookCategoryService;
import cn.blb.service.BookNewsService;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/book")
public class BookNewSServlet extends BaseServlet {
    private BookNewsService bookService = new BookNewsService();//处理图书咨询相关业务
    private BookCategoryService categoryService = new BookCategoryService();//处理图书咨询相关业务

    /*
    *  非ajax方法 查询主页面显示的数据
    * */
    public void queryDatas(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        try {
            // 1. 查询图书咨询 // 查询其他类型数据
            List<BookNews> bookNews = bookService.queryBookNews();
            for (BookNews bookNews2 : bookNews) {
                System.out.println(bookNews2);
            }
            // 2. 将查询到数据，转发给book.jsp在服务器拼写查询到图书数据，返回拼写完毕的页面
            request.setAttribute("bookNews", bookNews);
        request.getRequestDispatcher("book.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    /*
    *
    *  使用ajax获取图书咨询
    * */

      public void queryBookNews(HttpServletRequest request,HttpServletResponse response){
           //1、查询图书咨询//查询其他类型数据
          try {
              List<BookNews> bookNews=bookService.queryBookNews();
              for (BookNews bookNew2 : bookNews) {
                  System.out.println(bookNew2);
              }
              response.getWriter().print(JSONArray.fromObject(bookNews));
          } catch (Exception e) {
              e.printStackTrace();
          }

      }

      public void queryBookCategory(HttpServletRequest request,HttpServletResponse response){
          try {
            //查询菜单的父id:parent_id;
          int parent_id=Integer.parseInt(request.getParameter("parent_id"));
          System.out.println("id:"+parent_id);
          //查询图书类别//查询其他类型数据
          List<BookCategory> categories=categoryService.queryCategories(parent_id);
              for (BookCategory category : categories) {
                  System.out.println(category);
              }
              response.getWriter().print(JSONArray.fromObject(categories));



          } catch (Exception e) {
              e.printStackTrace();
          }


      }
      public void queryPublishing(HttpServletRequest request,HttpServletResponse response){
          try {
              List<BlbPublishing> blbPublishings=bookService.queryPublishing();

              response.getWriter().print(JSONArray.fromObject(blbPublishings));
          } catch (Exception e) {
              e.printStackTrace();
          }
      }
      public void queryActive(HttpServletRequest request,HttpServletResponse response){
          try {
              List<BlbActive> actives=bookService.queryActive();
              for (BlbActive active : actives) {
                  System.out.println(active);
              }

              response.getWriter().print(JSONArray.fromObject(actives));
          } catch (Exception e) {
              e.printStackTrace();
          }
      }

}
