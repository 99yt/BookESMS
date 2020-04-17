<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/book_style.css"  type="text/css" rel="stylesheet"/>
	<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="js/vue.js"></script>
	<script type="text/javascript" src="js/axios.js"></script>
<title>商品详情</title>
</head>
<body>
<!--头部导航开始-->

<div id="bodyPart">
<%@include file="head.jsp"%>
	<%--ID--%>
	<input type="hidden" name="type" id="productId" value="${param.productId}">
	<div class="w">
		<div class="crumb">
			 <a href="#">首页</a>
			 &nbsp;&gt;&nbsp;
			 <a href="#">图书</a>
			 &nbsp;&gt;&nbsp;
			 <a href="#">小说</a>
			 &nbsp;&gt;&nbsp;
			 <a href="#">三国演义</a>
        </div>
	</div>
	<!-----主体----->
	<div class="main">
		<div class="left">
			
			<div id="recent">
				<div class="mt">
					<h2>购买此商品的网友还购买了
					 </h2>
				</div>
				<div class="mc">
					<ul>
						<li>
							<div class="p-img"><a href="#"><img src="img/ln_ipad1.jpg"></a></div>
							<div class="p-name"><a href="#">苹果（Apple）iPadMB292CH/A9.</a></div>
							<div class="p-name"><strong class="price"><img src="img/ln_ipad_price.png" ></strong></div>
						</li>
						<li>
							<div class="p-img"><a href="#"><img src="img/ln_ipad1.jpg"></a></div>
							<div class="p-name"><a href="#">苹果（Apple）iPadMB292CH/A9.</a></div>
							<div class="p-name"><strong class="price"><img src="img/ln_ipad_price.png" ></strong></div>
						</li>
						<li>
							<div class="p-img"><a href="#"><img src="img/ln_ipad1.jpg"></a></div>
							<div class="p-name"><a href="#">苹果（Apple）iPadMB292CH/A9.</a></div>
							<div class="p-name"><strong class="price"><img src="img/ln_ipad_price.png" ></strong></div>
						</li>
					</ul>
				</div>
			</div>
			
			<br/>
			<div id="recent">
				<div class="mt">
					<h2>最近浏览过的商品</h2>
					<div class="extra"><a id="clearRec">清空</a></div>
				</div>
				<div class="mc">
					<ul>
						<li>
							<div class="p-img"><a href="#"><img src="img/ln_ipad1.jpg"></a></div>
							<div class="p-name"><a href="#">苹果（Apple）iPadMB292CH/A9.</a></div>
							<div class="p-name"><strong class="price"><img src="img/ln_ipad_price.png" ></strong></div>
						</li>
						<li>
							<div class="p-img"><a href="#"><img src="img/ln_ipad1.jpg"></a></div>
							<div class="p-name"><a href="#">苹果（Apple）iPadMB292CH/A9.</a></div>
							<div class="p-name"><strong class="price"><img src="img/ln_ipad_price.png" ></strong></div>
						</li>
						<li>
							<div class="p-img"><a href="#"><img src="img/ln_ipad1.jpg"></a></div>
							<div class="p-name"><a href="#">苹果（Apple）iPadMB292CH/A9.</a></div>
							<div class="p-name"><strong class="price"><img src="img/ln_ipad_price.png" ></strong></div>
						</li>
					</ul>
				</div>
			</div>
			<div id="adv">
				<img src="img/pop_bs_5.jpg">
			</div>
		</div><!---left结束--->
		
		<div class="right-extra" id="detail">

			<div id="name">
				<h1>{{Product.name}}<font id="advertiseWord" style="color: rgb(255, 0, 0);"></font></h1>
			</div>

			<div id="preview">
				<div id="spec-n1"><img :src='Product.picture'></div>
				<div id="spec-n5">
					<div id="spec-left" class="control"></div>
					<div id="spec-right" class="control"></div>
					<div id="spec-list">
						<ul class="list-h">
							<li><img width="50" height="50" src="img/ln_ipad3.jpg"></li>
							<li><img width="50" height="50" src="img/ln_ipad4.jpg"></li>
							<li><img width="50" height="50" src="img/ln_ipad5.jpg"></li>
							<li><img width="50" height="50" src="img/ln_ipad6.jpg"></li>
						</ul>
					</div>
				</div>
				<ul class="links">
						<li class="enlarge"><b></b><a href="#" target="_blank">点击看大图</a></li>
						<li class="partake">分享到：<b></b></li>
				</ul>				
			</div>			
			<ul id="summary">
					<li>作　　者：{{Product.author}} </li>
					<li>出 版 社： {{Product.publishing}}</li>
					<li>ＩＳＢＮ：{{Product.isbn}}</li>
					<li>出版时间：{{Product.publish_time}}</li>
					<li>版　　次：{{Product.which_edtion}}</li>
					<li>页　　数：{{Product.total_page}}</li>
					<li>装　　帧：{{Product.bind_layout}}</li>
					<li>开　　本：{{Product.book_size}}</li>
					<li id="market-price">市&nbsp;场&nbsp;价：<s>￥{{Product.fixed_price}}</s><span class="pid">商品编号：{{Product.product_id}}</span></li>
					<li>
				    	<div class="fl">
							京&nbsp;东&nbsp;价：
							<strong class="price">{{Product.lower_price}}</strong>
							<a href="#">(降价通知)</a>
				    	</div>
					</li>
              		<li id="storeinfocontainer">库&nbsp;&nbsp;&nbsp;&nbsp;存：送至 <img src="img/ln_beijing.jpg">           
					下单后立即发货</li>
					<li class="clearfix">
    					<span class="fl">商品评分：</span>
						<span id="star"></span>
						<span id="assess"><a href="#">(已有1256人评价)</a></span>
					</li>
			</ul>

			<div id="choose">
				<div class="amount">
					<ul>
						<li class="selectver">我要买：</li>
						<li class="reduce"><input type="button" value="-" v-on:click="addCut('cut')" style="width: 15px; height: 15px"/></li>
						<li id="pamount">1</li>
						<li class="add"><input type="button" value="+" v-on:click="addCut('add')" style="width: 15px; height: 15px"/></li>
					</ul>
				</div>
				<div class="btns">
					<input id="InitCartUrl" class="btn-append" type="button"
						   v-on:click="addCart()" /> <input type="button" value="收藏此商品" id="coll264644" class="btn-coll" />
				</div>
			</div>

			
			<div id="carriage">
				<ul class="item clearfix">
					<li class="fore-1">京东商城全场免运费：</li>
					<li class="fore-2"><a href="#">配送说明<b></b></a></li>
				</ul>
			</div>			
			
			<div class="co-service">
				<div class="mt">
					<h2>编辑推荐</h2>
				</div>
				<div class="mc">
					<div class="con">
						{{Product.editor_description}}		</div>
				</div>				
			</div>	
					
			<div class="co-service">
				<div class="mt">
					<h2>内容简介</h2>
				</div>
				<div class="mc">
					<div class="con">
					 　{{Product.book_summary}}			</div>
				
				</div>
				
			</div>		
			
			<div class="co-service">
				<div class="mt">
					<h2>目录</h2>
				</div>
				<div class="mc">
					<div class="con">
					 　　{{Product.catalog}}
					 </div>
				</div>
				
			</div>		
			<div class="co-service">
				<div class="mt">
					<h2>精彩书摘</h2>
				</div>
				<div class="mc">
					<div class="con">
					 　{{Product.extracts}}					 </div>
				</div>
				
			</div>
			
			<div id="comment">
				<ul class="tab">
					<li class="curr">全部评价<strong id="cnum0">(1271)</strong><span></span></li>
					<li>好评<strong id="cnum1">(1248)</strong><span></span></li>
					<li>中评<strong id="cnum2">(18)</strong><span></span></li>
					<li>差评<strong id="cnum3">(5)</strong><span></span></li>
				</ul>	
						
				<div id="comment-0">
					<div id="i-comment"> 
						<div class="rate"> <strong>98%</strong> <br> 好评度 </div> 
						<div class="percent"> 
							<dl> <dt>好评</dt> <dd class="d1"> <div style="width: 147px;"> </div> </dd> <dd class="d2"> 98%</dd> </dl> 
							<dl> <dt>中评</dt> <dd class="d1"> <div style="width: 3px;"> </div> </dd> <dd class="d2"> 2%</dd> </dl> 
							<dl> <dt>差评</dt> <dd class="d1"> <div style="width: 0px;"> </div> </dd> <dd class="d2"> 0%</dd> </dl> 
						</div> 
						<div class="btns"> 
							<div> 我在京东购买过此商品</div> 
							<a class="btn-comment" href="#">我要评价</a>
							<div><a target="_blank" href="#">查看全部评价</a></div>
						</div>
					</div>
				</div>
				<div class="item">				
					 <div class="user"> 
						<div class="u-icon"> <a href="#" target="_blank"> <img  src="img/61.gif" height="50" width="50"> </a> </div> 
						<div class="u-name"> <a href="#" target="_blank">weisenly</a></div> 
						<div class="u-address"> (江苏)</div><div class="date-buy">购买日期<br>2010-12-30</div>
					</div> 
					<div class="i-item">
						<div class="o-topic"><strong class="topic"><a href="#" target="_blank">很棒，Ipad</a></strong><span class="star sa5"></span><span class="date-comment">2011-02-15 20:53</span></div>
						<div class="comment-content">
							<dl> <dt>优点：</dt> <dd> 看书很方便，Lp在上面看电影</dd> </dl> 
							<dl> <dt>不足：</dt> <dd> 暂时还没发现缺点哦！</dd> </dl>  
							<dl> <dt>使用心得：</dt> <dd> 等不及2代了，直接去自提点提的，另外，套子很不错，至于贴膜，请外面的专业贴膜帮忙弄的。</dd> </dl> 
						</div>
						 <div class="btns"> <div class="useful"> <span>此评价对我</span> <a name="agree" class="btn-agree" title="0" href="#none">有用(0)</a> <a name="oppose" class="btn-oppose" title="0" href="#">没用(0)</a> </div> <a class="btn-reply" href="#">回复</a> </div>  
					</div> 
					<div class="corner tl"> </div>
					<div class="corner tr"> </div> 
					<div class="corner b">  </div> 
					<div class="corner bl"> </div> 
					<div class="corner br"> </div> 					
				
				</div>
				<div class="item">				
					 <div class="user"> 
						<div class="u-icon"> <a href="#" target="_blank"> <img  src="img/61.gif" height="50" width="50"> </a> </div> 
						<div class="u-name"> <a href="#" target="_blank">高木</a></div> 
						<div class="u-address"> (北京)</div><div class="date-buy">购买日期<br>2010-11-03</div>
					</div> 
					<div class="i-item">
						<div class="o-topic"><strong class="topic"><a href="#" target="_blank">很棒，Ipad</a></strong><span class="star sa5"></span><span class="date-comment">2011-02-15 20:53</span></div>
						<div class="comment-content">
							<dl> <dt>优点：</dt> <dd> 朋友说不错</dd> </dl> 
							<dl> <dt>不足：</dt> <dd>     暂时还没发现缺点哦！</dd> </dl>  
							<dl> <dt>使用心得：</dt> <dd> 没用,送朋友了</dd> </dl> 
						</div>
						 <div class="btns"> <div class="useful"> <span>此评价对我</span> <a name="agree" class="btn-agree" title="0" href="#none">有用(0)</a> <a name="oppose" class="btn-oppose" title="0" href="#">没用(0)</a> </div> <a class="btn-reply" href="#">回复</a> </div>  
					</div> 
					<div class="corner tl"> </div>
					<div class="corner tr"> </div> 
					<div class="corner b"> </div> 
					<div class="corner bl"> </div> 
					<div class="corner br"> </div> 									
				</div>
				
				<div id="numPage">
					<div class="numPageNo">
						<ul>
							<li class="numBgLeft"><img src="img/ln_num_right.jpg"></li>
							<li class="numBgMiddle nextPage">下一页</li>
							<li class="numBgRight"><img src="img/ln_num_left.jpg"></li>
						</ul> 
					</div>
					<div class="numPageNo">
						<ul>
							<li class="numBgLeft"><img src="img/ln_num_right.jpg"></li>
							<li class="numBgMiddle">8</li>
							<li class="numBgRight"><img src="img/ln_num_left.jpg"></li>
						</ul> 
					</div>
					<div class="numPageNo">
						<ul>
							<li class="numBgLeft"><img src="img/ln_num_right.jpg"></li>
							<li class="numBgMiddle">7</li>
							<li class="numBgRight"><img src="img/ln_num_left.jpg"></li>
						</ul> 
					</div>
					<div class="numPageNo">
						<ul>
							<li class="numBgLeft"><img src="img/ln_num_right.jpg"></li>
							<li class="numBgMiddle">6</li>
							<li class="numBgRight"><img src="img/ln_num_left.jpg"></li>
						</ul> 
					</div>
					<div class="numPageNo">
						<ul>
							<li class="numBgLeft"><img src="img/ln_num_right.jpg"></li>
							<li class="numBgMiddle">...</li>
							<li class="numBgRight"><img src="img/ln_num_left.jpg"></li>
						</ul> 
					</div>
					<div class="numPageNo">
						<ul>
							<li class="numBgLeft"><img src="img/ln_num_right.jpg"></li>
							<li class="numBgMiddle">5</li>
							<li class="numBgRight"><img src="img/ln_num_left.jpg"></li>
						</ul> 
					</div>
					<div class="numPageNo">
						<ul>
							<li class="numBgLeft"><img src="img/ln_num_right.jpg"></li>
							<li class="numBgMiddle">4</li>
							<li class="numBgRight"><img src="img/ln_num_left.jpg"></li>
						</ul> 
					</div>
					<div class="numPageNo">
						<ul>
							<li class="numBgLeft"><img src="img/ln_num_right.jpg"></li>
							<li class="numBgMiddle">3</li>
							<li class="numBgRight"><img src="img/ln_num_left.jpg"></li>
						</ul> 
					</div>
					<div class="numPageNo">
						<ul>
							<li class="numBgLeft cur"><img src="img/ln_num_right.jpg"></li>
							<li class="numBgMiddle curM">2</li>
							<li class="numBgRight cur"><img src="img/ln_num_left.jpg"></li>
						</ul> 
					</div>
					<div class="numPageNo">
						<ul>
							<li class="numBgLeft"><img src="img/ln_num_right.jpg"></li>
							<li class="numBgMiddle">1</li>
							<li class="numBgRight"><img src="img/ln_num_left.jpg"></li>
						</ul> 
					</div>
					<div class="numPageNo">
						<ul>
							<li class="numBgLeft"><img src="img/ln_num_right.jpg"></li>
							<li class="numBgMiddle nextPage">上一页</li>
							<li class="numBgRight"><img src="img/ln_num_left.jpg"></li>
						</ul> 
					</div>						
				</div>
			</div>
			<!----comment结束---->
						
		</div><!---right-extra结束--->		
	</div><!---main结束--->
	
	<!--服务部分开始-->
<%@include file="footer.jsp"%>

</div><!---bodyPart结束--->
</body>
<script type="text/javascript" src="js/jquery-3.3.1.js">
	var productId=$("#productId").val();
	var vm=new Vue({
		el:"#detail",
		data:{
			Product:[]
		},beforeMount : function() {
			axios.get("bookList", {
				params : {
					type : "getbookDetail",
					ProductId : productId,


				}
			}).then(function(result) {
				vm.Product = result.data;
			});
		},methods : {
			addCart : function() {
				var quantity = parseInt($("#pamount").html());
				window.location.href = "cartServlet?type=addCart&productId="
						+ vm.Product.productId + "&quantity=" + quantity;
			},
			addCut : function(mark) {
				var quantity = parseInt($("#pamount").html());
				if ("add" == mark) {
					quantity = quantity + 1;
					$("#pamount").html(quantity);
				} else if ("cut" == mark) {
					if (quantity > 1) {
						quantity = quantity - 1;
						$("#pamount").html(quantity);
					}

				}
			}
		}

	})
</script>
</html>
