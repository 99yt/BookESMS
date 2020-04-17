<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html >
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/myCart_style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="js/vue.js"></script>
	<script type="text/javascript" src="js/axios.js"></script>
	<title>我的购物车</title>
</head>
<body>
<!------------头部------------->
<%@include file="head1.jsp"%>

<div id="bodyPart">
	<div id="top">
		<div id="logo"></div>
		<div id="Cart">
			<ul>
				<li id="myCart" class="white">1.我的购物车</li>
				<li id="writeInfo">2.填写核对订单信息</li>
				<li id="successSub">3.成功提交订单</li>
			</ul>
		</div>
	</div>
	<div id="top_myCart"></div>
	<div class="List_cart">
		<h2>
			<strong>我挑选的商品</strong>
		</h2>
		<div class="cart_table">
			<table id="CartTb" cellpadding="0" cellspacing="0" width="600">
				<tr class="align_Right">
					<td>商品编号</td>
					<td>商品名称</td>
					<td>京东价</td>
					<td>返现</td>
					<td>赠送积分</td>
					<td>商品数量</td>
					<td>删除商品</td>
				</tr>
				<tr v-for="p of products">
					<td>{{p.product_id}}</td>
					<td id="align_Left">
						<div id="c_img">
							<a :href="'bookDetail.jsp?productId='+p.product_id"><img
									:src="p.picture" style="width: 50px; height: 50px"></a>
						</div>
						<div id="c_info">
								<span><a :href="'bookDetail.jsp?productId='+p.productId">
										{{p.name}}</a></span>
						</div>
					</td>
					<td class="price">￥{{p.price}}</td>
					<td>￥0.00</td>
					<td>0</td>
					<td width="90px">
						<div id="eqNum">
							<ul>
								<li class="Img"><img src="img/bag_close.gif"
													 v-on:click="addCut('cut',p.product_id,p.price,p.quantity)" /></li>
								<li><input type="text" :value="p.quantity" id="num" /></li>
								<li class="Img"><img src="img/bag_open.gif"
													 v-on:click="addCut('add',p.product_id,p.price,p.quantity)" /></li>
							</ul>
						</div>
					</td>
					<td><a
							:href="'cartServlet?type=delProduct&productId='+p.product_id">删除</a></td>
				</tr>
				<tr>
					<td colspan="7" class="align_Right" height="40"><b>商品总金额(不含运费)：<span
							id="cartBottom_price" class="price">￥{{totalPrice}}</span>元
					</b></td>
				</tr>
			</table>
			<div id="cart_op">
				<ul>
					<li id="li1">寄存购物车</li>
					<li id="li2"><a href="cartServlet?type=clearCart">清空购物车</a></li>
					<li id="li3">凑单商品</li>
					<li id="li4"><a href="book_list.jsp"><img
							src="img/btn0603_1.jpg" /></a><a href="orderInfoSure.jsp"><img
							src="img/btn0603_2.jpg" /></a></li>
				</ul>
			</div>

			<div id="DeledSkuInfo">
				<div>已删除商品，您可以重新购买或加入收藏夹：</div>
				<div id="divDeledSku">
					<div class="delItem">
						<table class="delItem" id="delProducts">
							<tr v-for="p of delProducts">
								<td style="width: 70px;">{{p.product_id}}</td>
								<td style="text-align: left;"><a
										:href="'bookDetail.jsp?productId='+p.productId">{{p.name}}</a></td>
								<td style="width: 150px;"><span class="price">￥{{p.price}}</span></td>
								<td style="width: 125px;">{{p.quantity}}</td>
								<td style="width: 100px;"><a
										:href="'cartServlet?productId='+p.productId+'&type=addCart'">重新购买</a>
									| <a href="#">收藏</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>

		</div>
		<!---cart_table--->
	</div>

	<div id="sbox_3" class="Wrap_cart">
		<div class="c-top"></div>
		<div class="content_right">
			<h3>购买了同样商品的顾客还购买了</h3>
			<ul class="num">
				<li>1</li>
				<li>2</li>
				<li class="on">3</li>
			</ul>
			<div class="ad">
				<ul>
					<li class="Product_List_S3">
						<ul>
							<li>
								<dl>
									<dt>
										<a href="#"><img src="img/ms.jpg"></a>
									</dt>
									<dd>
										<div class="p_Name">
											<a href="#">微软（Microsoft）无线激光鼠标ARC 黑色</a>
										</div>
										<div class="p_Price">
											<img src="img/ms_price.png">
										</div>
										<div class="p_Opp">
											<a href="#"><img src="img/addcart2.gif"></a>
										</div>

									</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>
										<a href="#"><img src="img/ms.jpg"></a>
									</dt>
									<dd>
										<div class="p_Name">
											<a href="#">微软（Microsoft）无线激光鼠标ARC 黑色</a>
										</div>
										<div class="p_Price">
											<img src="img/ms_price.png">
										</div>
										<div class="p_Opp">
											<a href="#"><img src="img/addcart2.gif"></a>
										</div>

									</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>
										<a href="#"><img src="img/ms.jpg"></a>
									</dt>
									<dd>
										<div class="p_Name">
											<a href="#">微软（Microsoft）无线激光鼠标ARC 黑色</a>
										</div>
										<div class="p_Price">
											<img src="img/ms_price.png">
										</div>
										<div class="p_Opp">
											<a href="#"><img src="img/addcart2.gif"></a>
										</div>

									</dd>
								</dl>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div class="c-bot"></div>


	</div>

	<div class="List_cart t">
		<h2>
			<strong>我收藏的商品<span id="smallSize">(现在就放入购物车吧！)</span><span
					id="extra">进入收藏夹>></span></strong>
		</h2>
		<div id="notFav">您还未收藏任何商品...</div>
	</div>
	<div id="help">帮我们改进购物车</div>
</div>
<!-- 页脚1 -->
<%@include file="footer1.jsp"%>

</body>
<script type="text/javascript">
	var v1 = new Vue({
		el : "#CartTb",
		data : {
			totalPrice : 0,
			totalQuantity : 0,
			cartId : 0,
			products : []
		},
		beforeMount : function() {
			axios.get("cartServlet", {
				params : {
					type : "queryCart"
				}
			}).then(function(result) {
				v1.totalPrice = result.data.totalPrice;
				v1.totalQuantity = result.data.totalQuantity;
				v1.cartId = result.data.cartId;
				v1.products = result.data.products
			});
		},
		methods : {
			addCut : function(mark, id) {
				if ("add" == mark) {
					for (var i = 0; i < this.products.length; i++) {
						if (this.products[i].productId == id) {
							this.products[i].quantity += 1;
							v1.totalPrice += this.products[i].price;
							axios.get("cartServlet", {
								params : {
									type : "addCart",
									productId : id,
									mark : "add"
								}
							});
						}
					}
				} else if ("cut" == mark) {
					for (var i = 0; i < this.products.length; i++) {
						if (this.products[i].productId == id) {
							if (this.products[i].quantity > 1) {
								this.products[i].quantity -= 1;
								v1.totalPrice -= this.products[i].price;
								axios.get("cartServlet", {
									params : {
										type : "addCart",
										productId : id,
										mark : "cut"
									}
								});
							}
						}
					}
				}

			}
		}
	});

	var v2 = new Vue({
		el : "#delProducts",
		data : {
			delProducts : []
		},
		beforeMount : function() {
			axios.get("cartServlet", {
				params : {
					type : "getDelProduct"
				}
			}).then(function(result) {
				v2.delProducts = result.data
			});
		}
	});
</script>
</html>
