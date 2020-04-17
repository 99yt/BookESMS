package cn.blb.controller;

import cn.blb.controller.base.BaseServlet;
import cn.blb.dao.bean.Order;
import cn.blb.dao.bean.catProduct;
import cn.blb.service.CartService;
import cn.blb.service.OrderService;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@WebServlet("/orderServlet")
public class OrderServlet extends BaseServlet {
    private CartService cartService=new CartService();
    private OrderService orderService=new OrderService();
    private void addOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(new Date());
        Map<String, Object> map = cartService.queryCart((Integer) session.getAttribute("cartId"));
        List<catProduct> list = (List<catProduct>) map.get("products");
        if (list.size() == 0) {
            response.sendRedirect("myCart.jsp");
        }
        Integer orderId = orderService.addOrder(userId, time, (Double) map.get("totalPrice"), list);
        cartService.clearCart((Integer) session.getAttribute("cartId"));
        session.setAttribute("orderId", orderId);
        session.setAttribute("totalPrice", map.get("totalPrice"));
        response.sendRedirect("orderSuccess.jsp");
    }

    private void queryOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        List<Order> orders = orderService.queryOrder(userId);
        response.getWriter().print(JSONArray.fromObject(orders));
    }

    private void getOneOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer orderId = Integer.parseInt(request.getParameter("orderId"));
        response.getWriter().print(JSONArray.fromObject(orderService.getOneOrder(orderId)).getJSONObject(0));
    }
}
