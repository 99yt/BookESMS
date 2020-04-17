<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link rel="stylesheet" type="text/css" href="css/book.css" />
<link rel="stylesheet" type="text/css" href="css/sign.css" />
<link type="text/css" rel="stylesheet" href="css/delete_order_style.css"/>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        function checkLogin(){
            alert("login");
            //1. 获取表单的注册信息
            var type = $("#type").val();
            var username = $("#username").val();
            var password = $("#password").val();
            //2. 验证数据格式RegExp.test()
            //略，非null验证
            console.log("username:"+username);
            console.log(password);
            if(username==null||username==''){
                alert('用户名不能为null')
                return;
            }
            if(password==null||password==""){
                alert('密码不能为null')
                return;
            }
            //验证用户名和密码格式：6位，不能使用特殊字符，不能使用数字开头
            //邮箱，邮箱的格式
            //3. 提交表单数据到服务器，请求UserServlet验证用户注册信息
            //数据已经提交至服务器
            $.ajax({
                url:"user",
                success:function(result){
                    alert("登录结果："+result)
                    if(result>0){
                        //跳转登录页面
                        //注册成功
                        //MainPageServlet,查询主页面的数据
                        //window.location="book?type=queryDatas"; 进入book页面，这是servlet方法
                        window.location="book.jsp";//进入book页面这是ajax方法进入获取图书咨询
                    }else{
                        $("#loginResult").html("登录失败！");
                    }
                },
                type:"post",
                data:{"type":type,"username":username,"password":password}
            });


        }
    </script>
</head>
<body>
<!--快捷访问栏开始-->
<%@include file="head1.jsp"%>
<!--登录-->
<div id="bodyPart">

	<div class="login_logo">
    	<img src="images/logo_login.gif" />
    </div>
    <div id="login">
    	<div class="login_tit">
        	<h2>用户登录</h2><span></span>
        </div>
        <div class="login_form">
        	<div class="form">
			<form id="login_form" action="user" method="post">
                <input type="hidden" id="type" name="type" value="checkLoginAjax" class="text" />
             	<div class="form_info">
                	<div class="label">用户名：</div><input type="text" name="username" id ="username" class="text"/>
                </div>
             	<div class="form_info">
                	<div class="label">密码：</div><input type="password" id="password" name="password" class="text"/>
                </div>
                <div class="form_info">
                	<div class="label">&nbsp;</div>
                	<input type="checkbox" checked="checked"/>记住用户名 
                </div>
                <div class="form_info">
                	<div class="label">&nbsp;</div>
                	<a href="javascript:checkLogin()"><img id="login_btn" src="images/login.jpeg" /></a><%--登录按钮--%>
                </div>
                <div class="cor_web">
                    使用合作网站账号登录京东：<br />
                    <img src="images/cor_web.jpeg" />
                </div>
			</form>
            </div>
            
            <div class="login_right">
            	<p>还不是京东商城用户？</p>
				<div class="guide_content">
                	现在免费注册成为京东商城用户，便能立刻享受便宜又放心的购物乐趣。
                </div>
                <div id="new_register"><a href="register.jsp"><img src="images/new_reg.jpeg" /></div>
                <!--<div id="other_register"><a href="#">企业用户注册</a>   <a href="#">校园用户注册</a></div>-->
				<!--<div id="other_register"><a href="#">企业用户注册</a>   <a href="#">校园用户注册</a></div>-->
            </div>
        </div>
    </div>
    
</div>

<div class="clear"></div>
<!--脚部开始-->
<%@include file="footer1.jsp"%>
</body>
</html>
