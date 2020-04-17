<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html >
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>核对订单信息</title>
	<link type="text/css" href="css/orderInfoSure_style.css"
		  rel="stylesheet" />
	<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="js/vue.js"></script>
	<script type="text/javascript" src="js/axios.js"></script>
</head>

<body>
<div id="bodyPart">
	<div id="top">
		<div id="logo"></div>
		<div id="Cart">
			<ul>
				<li id="myCart">1.我的购物车</li>
				<li id="writeInfo" class="white">2.填写核对订单信息</li>
				<li id="successSub">3.成功提交订单</li>
			</ul>
		</div>
	</div>
	<div class="List_cart">
		<h2>
			<strong>填写核对订单信息</strong>
		</h2>

		<div class="cart_table">
			<div id="part_consignee">
				<div class="o_show">

					<h1>
						收货人信息&nbsp;<a href="#">[修改]</a>
					</h1>

					<div class="middle">
						<table cellpadding="0" cellspacing="0">
							<tr>
								<td align="right" style="width: 80px;">收货人姓名：</td>
								<td>{{user.real_name}}</td>
							</tr>

							<tr>
								<td align="right">省 份：</td>
								<td>{{user.province}}</td>
							</tr>

							<tr>
								<td align="right">地 址：</td>
								<td>{{user.area}}</td>
							</tr>

							<tr>
								<td align="right">手机号码：</td>
								<td>{{user.mobile}}</td>
							</tr>

							<tr>
								<td align="right">固定电话：</td>
								<td>{{user.phone}}</td>
							</tr>

							<tr>
								<td align="right">电子邮件：</td>
								<td>{{user.email}}</td>
							</tr>

							<tr>
								<td align="right">邮 编：</td>
								<td>{{user.zipcode}}</td>
							</tr>

						</table>
					</div>
				</div>
			</div>


			<div id="part_payTypeAndShipType">
				<div class="o_show">
					<h1>
						支付及配送方式&nbsp;<a href="#" id="linkPayTypeShipType">[修改]</a>
					</h1>
					<div class="middle">
						<table cellpadding="0" cellspacing="0">
							<tr>
								<td style="text-align: right; width: 80px;">支付方式：</td>
								<td>在线支付</td>
							</tr>
							<tr style="">
								<td style="text-align: right;">配送方式：</td>
								<td>京东快递</td>
							</tr>
							<tr>
								<td style="text-align: right;">运 费：</td>
								<td>0.00元<span style="color: red;">(免运费)</span></td>
							</tr>
							<tr>
								<td style="text-align: right;">送货日期：</td>
								<td style="color: red;">只双休日、假日送货(工作日不用送)</td>
							</tr>
						</table>
					</div>
				</div>
			</div>


			<div id="part_invoice">
				<div class="o_show">
					<h1>
						发票信息&nbsp;<a href="#">[修改]</a>
					</h1>
					<div class="middle">
						<table cellpadding="0" cellspacing="0">
							<tr>
								<td style="text-align: right; width: 82px;">发票类型：</td>
								<td>普通发票</td>
							</tr>
							<tr>
								<td style="text-align: right;">发票抬头：</td>
								<td>个人</td>
							</tr>
							<tr>
								<td style="text-align: right;">发票内容：</td>
								<td>明细</td>
							</tr>
						</table>
					</div>
				</div>
			</div>


			<div id="part_remark">
				<div class="o_show">
					<h1>
						订单备注&nbsp;<a href="#">[修改]</a>
					</h1>
					<div class="middle">
						<table cellpadding="0" cellspacing="0">
							<tr>
								<td style="text-align: left; padding-left: 20px;">暂无备注</td>
							</tr>
						</table>
					</div>
				</div>
			</div>


			<div id="part_cart">
				<div class="o_show">
					<h1>
						<span style="margin-right: 700px;">商品清单</span><a
							href="myCart.html" id="backCart">返回修改购物车</a>
					</h1>
					<div class="middle">
						<table width="100%" cellspacing="0" cellpadding="0" class="Table">
							<tr class="align_Center Thead">
								<td width="7%">商品编号</td>
								<td>商品名称</td>
								<td width="10%">京东价</td>
								<td width="8%">返现</td>
								<td width="8%">赠送积分</td>
								<td width="9%">库存状态</td>
								<td width="9%">商品数量</td>
							</tr>

							<tr class="align_Center" v-for="p of products">
								<td style="padding: 5px 0pt;">{{p.product_id}}</td>
								<td class="align_Left"><a
										:href="'bookDetail.jsp?productId='+p.productId">{{p.name}}</a></td>
								<td><span class="price">￥{{p.price}}</span></td>
								<td>￥0.00</td>
								<td>0</td>
								<td>现货</td>
								<td>{{p.quantity}}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>


			<div id="ware_info">
				<div id="acc_info">结算信息</div>
				<h1></h1>
				<div class="middle">
					<ul id="part_info">
						<li style="padding-bottom: 5px;" class="info1">商品金额：<span
								class="totalPrice"></span>元 + 运费：0.00元 - 优惠券：<span
								id="price_coupon">0.00</span>元 - 礼品卡：<span id="price_coupon">0.00</span>元
							- 返现：0.00元 <br></li>

						<li style="width: 100%; overflow: hidden;" class="info2">
							<table cellspacing="0" cellpadding="0" width="100%">
								<tr>
									<td><a href="#">(<span id="couponStateShow">+</span>)使用优惠券抵消部分总额
									</a></td>
									<td style="text-align: right; font-size: 15px;"><b>应付总额：<font
											color="red">￥<span class="totalPrice"></span></font> 元
									</b></td>
								</tr>
								<tr>
									<td colspan="2"><a href="#">(<span
											id="couponStateShow">+</span>)使用京东礼品卡
									</a></td>
								</tr>
							</table>
						</li>
					</ul>
				</div>
			</div>


			<div id="submit_btn">
				<a href="orderServlet?type=addOrder"><img src="img/submit.jpg" /></a>
			</div>
			<div id="line"></div>
		</div>
		<!----cart_table结束---->

		<div class="round">
			<div class="lround"></div>
			<div class="rround"></div>
		</div>
	</div>
</div>
<!-- 页脚类型1 -->
<%@include file="footer1.jsp"%>
</body>
<script type="text/javascript">
	var v2 = new Vue({
		el : "#part_consignee",
		data : {
			user : {}
		},
		beforeMount : function() {
			axios.get("user", {
				params : {
					type : "getOneInfoById"
				}
			}).then(function(result) {
				v2.user = result.data;
			});
		}
	});

	var v1 = new Vue({
		el : "#part_cart",
		data : {
			totalPrice : 0,
			products : []
		},
		beforeMount : function() {
			axios.get("cartServlet", {
				params : {
					type : "queryCart"
				}
			}).then(function(result) {
				v1.totalPrice = result.data.totalPrice;
				v1.products = result.data.products
				$(".totalPrice").html(v1.totalPrice);
			});
		}
	});
</script>
</html>
