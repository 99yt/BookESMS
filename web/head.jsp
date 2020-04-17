<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" type="text/css" href="css/head.css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<!--快捷访问栏开始-->
<div id="shortcut">
	<div class="page_width">
		<ul>
			<c:if test="${not empty username}">
			<li class="welcome">${username}，欢迎来到京东商城！
				<span><a href="user?type=logout">[注销]</a>，新用户？
					<a href="login.jsp" class="link_reg">[切换账号]
					</a>
				</span>
			</li>
			</c:if>
				<c:if test="${empty username}">
			<li class="welcome">您好！欢迎来到京东商城！
				<span><a href="login.jsp">[请登录]</a>，新用户？
					<a href="register.jsp" class="link_reg">[免费注册]
					</a>
				</span>
				</c:if>


			</li>
			<li class="my_order"><a href="orderList.jsp">我的订单</a></li>
			<li><a href="userHome.jsp">我的京东</a></li>
			<li><a href="myCart.jsp">我的购物车</a></li>
			<li class="sub">
                <a href="#" target="_blank">帮助中心</a>
            </li>
		</ul>
		<span class="clear"></span>
	</div>
</div>
<!--头部导航开始-->
<div id="header" class="page_width">

	<div id="logo">
    	<a href="#"><img src="images/logo.gif"width="251" height="46"/></a>
    </div>
    
    <div class="clear"></div>
    <div id="book_search">
    	<div id="allsort">
        	<div id="more_sort">
        		<strong>图书分类</strong>
            </div>
        </div>
		<div id="search">
			<!--<div id="sub_search">-->
			<input type="text" id="keyword" value="搜索..." onfocus="this.value=''" />
			<!--</div>-->
			<a href="#"><input type="submit" id="btn_search" value="搜 索"
							   onclick="searchBook()" /></a>
		</div>
        
        <ul id="mycart">
        	<li id="cart_info">购物车<b><font color="#066FC9">${cartQuantity}</font></b>件</li>
            <li><font color="#ffffff">去结算</font></li>
        </ul>
    </div>
</div>
<!--头部导航结束-->

<script type="text/javascript">
	function searchBook() {
		var keyword = $("#keyword").val();
		var pattern = /^[\u4e00-\u9fa5]{1,50}$/;
		if (pattern.test(keyword)) {
			window.location.href = "search.jsp?key="+keyword;
		}else{
			alert("请输入有效关键字");
		}
	}
</script>
