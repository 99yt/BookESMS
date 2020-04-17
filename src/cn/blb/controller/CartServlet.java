package cn.blb.controller;

import cn.blb.controller.base.BaseServlet;
import cn.blb.service.CartService;
import net.sf.json.JSONArray;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/cartServlet")
public class CartServlet extends BaseServlet {
    private CartService cartService=new CartService();
    private void addCart(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Integer cartId = (Integer) request.getSession().getAttribute("cartId");
        Integer productId = Integer.parseInt(request.getParameter("productId"));
        String mark = "add";
        if (request.getParameter("mark") != null) {
            mark = request.getParameter("mark");
        }
        Integer quantity = 1;
        if (request.getParameter("quantity") != null) {
            quantity = Integer.parseInt(request.getParameter("quantity"));
        }
        cartService.addCart(cartId, productId, mark, quantity);
        response.sendRedirect("initCart.jsp");
    }

    private void queryCart(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Integer cartId = (Integer) request.getSession().getAttribute("cartId");
        Map<String, Object> map = cartService.queryCart(cartId);
        response.getWriter().print(JSONArray.fromObject(map).getJSONObject(0));
    }

    private void clearCart(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Integer cartId = (Integer) request.getSession().getAttribute("cartId");
        cartService.clearCart(cartId);
        response.sendRedirect("myCart.jsp");
    }

    private void delProduct(HttpServletRequest request, HttpServletResponse response) throws  IOException {


        Integer cartId = (Integer) request.getSession().getAttribute("cartId");
        Integer productId = Integer.parseInt(request.getParameter("productId"));
        cartService.delProduct(cartId, productId);
        response.sendRedirect("myCart.jsp");
    }

    private void getDelProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Integer cartId = (Integer) request.getSession().getAttribute("cartId");
        response.getWriter().print(JSONArray.fromObject(cartService.getCartProducts(cartId, 1)));
    }

    private void getNewProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer cartId = (Integer) request.getSession().getAttribute("cartId");
        response.getWriter().print(JSONArray.fromObject(cartService.getNewProduct(cartId)).getJSONObject(0));
    }

}
