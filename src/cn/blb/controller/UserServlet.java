package cn.blb.controller;

import cn.blb.controller.base.BaseServlet;
import cn.blb.dao.bean.BlbUser;
import cn.blb.service.CartService;
import cn.blb.service.UserService;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/user")
public class UserServlet extends BaseServlet {
    private UserService service = new UserService();//处理用户相关的业务实现（登录，注册，修改密码，完善信息）
    private CartService cartService = new CartService();//存储购物车的id


    /**
     * 实现用户登录功能： ajax请求
     * 	接收用户登录信息
     * 	验证用户登录信息
     *  返回登录结果
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void checkLoginAjax(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("checkLoginAjax... ...");
        //1. 获取用户登录信息
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("loginInfo:"+username+","+password);
        BlbUser user=new BlbUser();
        //2. 验证用户登录信息
        try {
            BlbUser loginResult =  service.login(username,password);
            //将用户信息存储到session中
            HttpSession session=request.getSession();
            System.out.println(loginResult.getLast_login_time());
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("userId",user.getUser_id());
            Integer cartId = cartService.getCartId(user.getUser_id());
            session.setAttribute("cartId", cartId);
            Integer quantity = (Integer) cartService.getTotalData(cartId).get("totalQuantity");
            session.setAttribute("cartQuantity", quantity);

            //3. 返回登录结果
            response.getWriter().print(loginResult==null?-1:1);

        } catch (Exception e) {
            //登录失败
            response.getWriter().print(-1);
        }
    }

    /**
     * 实现用户注册功能： ajax请求
     * 	接收用户注册信息
     * 	验证用户注册信息
     *  返回注册结果
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void checkRegisterAjax(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("checkRegisterAjax... ...");
        //1. 获取用户注册信息
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String recommender = request.getParameter("recommender");

        BlbUser registerUser = new BlbUser(username, password, email, recommender);
        System.out.println("registerUser:"+registerUser);

        //2. 验证用户注册信息
        try {
            int registerResult =  service.register(registerUser);
            //3. 返回注册结果
            System.out.println();
            response.getWriter().print(registerResult);
        } catch (SQLException e) {
            //注册失败
            response.getWriter().print(-1);
        }
    }

    /**
     * 实现用户注册功能： 非ajax请求
     * 	接收用户注册信息
     * 	验证用户注册信息
     *  返回注册结果
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void checkRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        System.out.println("checkRegister... ...");
        //1. 获取用户注册信息
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String recommender = request.getParameter("recommender");

        BlbUser registerUser = new BlbUser(username, password, email, recommender);
        System.out.println("registerUser:"+registerUser);

        //2. 验证用户注册信息
        try {
            int registerResult =  service.register(registerUser);
            //3. 返回注册结果
            if(registerResult>0){
                //注册成功
                response.sendRedirect("registerOk.jsp");
            }else{
                //注册失败
                request.setAttribute("registerResult", "注册失败");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            //注册失败
            request.setAttribute("registerResult", "注册失败");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    public void getOneInfoByName(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username") != null) {
            String username = (String) session.getAttribute("username");
            System.out.println(username);
            BlbUser user = service.getOneInfoByName(username);
            response.getWriter().print(JSONArray.fromObject(user).getJSONObject(0));
        }
    }

    public void updateNickName(HttpServletRequest request,HttpServletResponse response) throws Exception {
        HttpSession session=request.getSession();
        String userName=(String) session.getAttribute("username");
        if (request.getParameter("nickName") !=null){
            String nickName = new String(request.getParameter("nickName").getBytes("ISO-8859-1"), "UTF-8");
            service.updateNickName(userName, nickName, 0);

        }else {
            String realName=request.getParameter("realName");
            service.updateNickName(userName,realName,1);
        }
    }

    private void updateUserInfo(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        BlbUser user = new BlbUser();
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String sex = request.getParameter("sex");
        Integer birth = Integer.parseInt( request.getParameter("birth"));
        String address = request.getParameter("address");
        String school = request.getParameter("school");
        String company = request.getParameter("company");
        String card = request.getParameter("card");

        user.setLogin_name(username);
        user.setSex(sex);
        user.setBirth(birth);
        user.setProvince(address);
        user.setSchool(school);
        user.setCompany(company);
        user.setCard_number(card);

        service.updateUserInfo(user);
    }

    private void updateConnectionInfo(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        BlbUser user = new BlbUser();
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String phone = request.getParameter("phone");
        String msn = request.getParameter("msn");
        String qq = request.getParameter("qq");
        String website = request.getParameter("website");
        String sendAddress = request.getParameter("sendAddress");
        String zipcode = request.getParameter("zipcode");

        user.setLogin_name(username);
        user.setEmail(email);
        user.setMobile(mobile);
        user.setPhone(phone);
        user.setMsn(msn);
        user.setQq(qq);
        user.setWebsite(website);
        user.setSend_address(sendAddress);
        user.setZipcode(zipcode);

        service.updateConnectionInfo(user);
    }

    private void selectPassword(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String password = request.getParameter("password");

        BlbUser blbUser = service.selectPassword(password, username);
        response.getWriter().print(JSONArray.fromObject(blbUser));

    }
    public void updatePassword(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String newpassword = request.getParameter("newpassword");

        Integer integer= service.updatePassword(newpassword, username);
        if (integer<0){
            response.getWriter().print(-1);

        }else {
            response.getWriter().print(1);
        }

    }



    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException{
        HttpSession session = request.getSession();
        session.setAttribute("username", null);
        session.setAttribute("nickName", null);
        response.sendRedirect("logout.jsp");
    }
    private void getOneInfoById(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        HttpSession session = request.getSession();
        if (session.getAttribute("userId") != null) {
            Integer id = (Integer) session.getAttribute("userId");
             BlbUser user = service.getOneInfoById(id);
            response.getWriter().print(JSONArray.fromObject(user).getJSONObject(0));
        }
    }
}
