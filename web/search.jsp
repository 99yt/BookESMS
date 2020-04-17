<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>搜索书籍</title>
	<link type="text/css" rel="stylesheet" href="css/search_style.css" />
	<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="js/vue.js"></script>
	<script type="text/javascript" src="js/axios.js"></script>
</head>
<body>

<!--头部导航开始-->
<%@include file="head.jsp"%>

<div id="bodyPart">

	<div class="crumb">
		全部结果&nbsp;&gt;&nbsp; <strong>${param.key}</strong>
	</div>

	<div class="left">
		<div id="commend" class="m rank">
			<div class="mt">
				<h2>热销商品</h2>
			</div>
			<div class="mc" id="SellWellProducts">
				<ul>
					<li class="fore" v-for="(p, index) of products"><span>{{index+1}}</span>
						<div class="p-img">
							<a :href="'bookDetail.jsp?productId='+p.productId"
							   target="_blank"><img width="50" height="50"
													:src="p.picture"></a>
						</div>
						<div class="p-name">
							<a :href="'bookDetail.jsp?productId='+p.productId"
							   target="_blank">{{p.name}}</a>
						</div>
						<div class="p-price" style="color: red;">京东价：￥{{p.lower_price}}</div></li>

				</ul>
			</div>
		</div>
	</div>
	<!-------left结束------->
	<div class="right-extra" id="keyBooks">
		<div id="select" class="m">
			<div class="mt">
				<strong>${param.key}</strong>&nbsp;&nbsp;<strong>的搜索结果:</strong>
			</div>
		</div>
		<div id="filter">

			<div class="fore item">排序：</div>
			<ul class="item tab">
				<li class="curr"><a href="#" v-on:click="orderBy('product_id')">相关性</a><span></span></li>
				<li><a href="#" v-on:click="orderBy('sale_count')">销量</a><span></span></li>
				<li><b></b><a href="#" v-on:click="orderBy('lower_price')">价格</a><span></span></li>
				<li><a href="#">好评度</a><span></span></li>
				<li><a href="#" v-on:click="orderBy('add_time')">上架时间</a><span></span></li>
			</ul>
			<!-- <div class="pagin pagin-m fr">
                <span class="text">1/1</span> <span class="prev-disabled">上一页<b></b></span>
                <span class="next-disabled">下一页<b></b></span>
            </div> -->
			<ul class="extra">
				<li class="total"><span>共<strong>{{keyProducts.length}}</strong>个商品
					</span></li>
			</ul>

		</div>
		<div id="plist" class="m">
			<ul class="list-h clearfix">
				<li v-for="p of keyProducts">
					<div class="p-img">
						<a :href="'bookDetail.jsp?productId='+p.productId"
						   target="_blank"><img width="160" height="160"
												:src="p.picture"></a>
					</div>
					<div class="p-name">
						<a :href="'bookDetail.jsp?productId='+p.productId"
						   target="_blank">{{p.name}}</a>
					</div>
					<div class="p-price">
						<del>￥{{p.fixed_price}}</del>
						<em></em><strong>￥{{p.lower_price}}</strong>
					</div>
					<div class="extra">
						<span class="evaluate"><a href="#" target="_blank">已有5人评论</a></span>
					</div>
					<div class="btns">
						<a class="btn-buy" target="_blank" href="#">购买</a> <input
							type="button" value="收藏" class="btn-coll">
					</div>
				</li>
			</ul>
		</div>


		<div class="pagin fr">
			<span class="prev-disabled">上一页<b></b></span> <a href="#"
															 class="current">1</a> <span class="next-disabled">下一页<b></b></span>
		</div>


	</div>
	<div class="m" id="re-search">
		<dl>
			<dt>重新搜索</dt>
			<dd>
				<input type="text" class="text" onfocus="this.value=''"
					   id="keyword2"> <input type="button" value="搜&nbsp;索"
											 class="button" onclick="searchBook2()">
			</dd>
		</dl>
	</div>

	<div style="clear: both;"></div>
	<!-- 页脚 -->
	<%@include file="footer.jsp"%>

</div>

<input type="hidden" id="key" value="${param.key}" />

</body>
<script type="text/javascript">
	var key = $("#key").val();
	var v2 = new Vue({
		el : "#keyBooks",
		data : {
			keyProducts : []
		},
		beforeMount : function() {
			axios.get("bookList", {
				params : {
					type : "getBookList",
					field : "sale_count",
					order : "DESC",
					key : key
				}
			}).then(function(result) {
				v2.keyProducts = result.data;
			});
		},
		methods : {
			orderBy : function(field) {
				axios.get("bookList", {
					params : {
						type : "getBookList",
						field : field,
						order : "DESC",
						key : key
					}
				}).then(function(result) {
					v2.keyProducts = result.data;
				});
			}
		}
	});

	//热销商品
	var v1 = new Vue({
		el : "#SellWellProducts",
		data : {
			products : []
		},
		beforeMount : function() {
			axios.get("bookList", {
				params : {
					type : "getBookList",
					field : "sale_count",
					order : "DESC",
					limit : 5
				}
			}).then(function(result) {
				v1.products = result.data;
			});
		}
	});

	function searchBook2() {
		var keyword2 = $("#keyword2").val();
		var pattern = /^[\u4e00-\u9fa5]{1,50}$/;
		if (pattern.test(keyword2)) {
			window.location.href = "search.jsp?key=" + keyword2;
		} else {
			alert("请输入有效关键字");
		}
	}
</script>
</html>
