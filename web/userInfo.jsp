<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户信息</title>
	<link type="text/css" rel="stylesheet" href="css/delete_order_style.css" />
	<link rel="stylesheet" type="text/css" href="css/book.css" />
	<link rel="stylesheet" type="text/css" href="css/userInfo.css" />
	<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="js/vue.js"></script>
	<script type="text/javascript" src="js/axios.js"></script>

	<script type="text/javascript">
		//昵称区域的编辑和显示状态切换
		$(function() {
			$("#nickname_edit_div").hide();//隐藏昵称修改div
			$("#nickname_div").show();//显示昵称显示div
			$("#nickname_edit").click(function() {
				var nickname = $("#nickname_div span").text();
				if (nickname != "") {
					$("#nickname_txt").val(nickname);
				}
				$("#nickname_edit_div").show();//显示昵称修改div
				$("#nickname_div").hide();//隐藏昵称显示div
				return false;
			});
			$("#nickname_cancel").click(function() {
				$("#nickname_edit_div").hide();//隐藏昵称修改div
				$("#nickname_div").show();//显示昵称显示div
				return false;
			});
		});
		//真实姓名的编辑和显示状态切换
		$(function() {
			$("#name_edit_div").hide();//隐藏真实姓名修改div
			$("#name_div").show();//显示真实姓名显示div
			$("#name_edit").click(function() {
				var name = $("#name_div span").text();
				if (name != "") {
					$("#name_txt").val(name);
				}
				$("#name_edit_div").show();//显示真实姓名修改div
				$("#name_div").hide();//隐藏真实姓名显示div
				return false;
			});
			$("#name_cancel").click(function() {
				$("#name_edit_div").hide();//隐藏真实姓名修改div
				$("#name_div").show();//显示真实姓名显示div
				return false;
			});
		});

		//个人信息区域的编辑和显示状态切换
		$(function() {
			$("#user_edit_div").hide();//隐藏修改div
			$("#user_div").show();//显示文本显示div
			$("#user_edit").click(function() {
				$("#sex").val($("#userSex").html());
				$("#birth").val($("#userBirth").html());
				$("#address").val($("#userProvince").html());
				$("#school").val($("#userSchool").html());
				$("#company").val($("#userCompany").html());
				$("#card").val($("#userCard").html());

				$("#user_edit_div").show();//显示修改div
				$("#user_div").hide();//隐藏文本显示div
				return false;
			});
			$("#user_cancel").click(function() {
				$("#user_edit_div").hide();//隐藏修改div
				$("#user_div").show();//显示文本显示div
				return false;
			});
		});

		//联系信息区域的编辑和显示状态切换
		$(function() {
			$("#address_edit_div").hide();//隐藏修改div
			$("#address_div").show();//显示文本显示div
			$("#address_edit").click(function() {
				$("#email").val($("#uemail").html());
				$("#mobile").val($("#umobile").html());
				$("#phone").val($("#uphone").html());
				$("#msn").val($("#umsn").html());
				$("#qq").val($("#uqq").html());
				$("#website").val($("#uwebsite").html());
				$("#sendAddress").val($("#usendAddress").html());
				$("#zipcode").val($("#uzipcode").html());

				$("#address_edit_div").show();//显示修改div
				$("#address_div").hide();//隐藏文本显示div
				return false;
			});
			$("#address_cancel").click(function() {
				$("#address_edit_div").hide();//隐藏修改div
				$("#address_div").show();//显示文本显示div
				return false;
			});
		});
		//兴趣爱好区域的编辑和显示状态切换
		$(function() {
			$("#fav_edit_div").hide();//隐藏修改div
			$("#fav_div").show();//显示文本显示div
			$("#fav_edit").click(function() {
				$("#fav_edit_div").show();//显示修改div
				$("#fav_div").hide();//隐藏文本显示div
				return false;
			});
			$("#fav_cancel").click(function() {
				$("#fav_edit_div").hide();//隐藏修改div
				$("#fav_div").show();//显示文本显示div
				return false;
			});
		});
	</script>
</head>
<body>
<!--快捷访问栏开始-->
<%@include file="head.jsp"%>
<div id="bodyPart">

	<!--位置-->
	<div class="w">
		<div class="crumb">
			<a href="#">首页</a> &nbsp;&gt;&nbsp; <a href="#">我的京东</a>
			&nbsp;&gt;&nbsp; <a href="#">个人资料</a>
		</div>
	</div>
	<div class="main">
		<!--左侧-->
		<%@include file="left.jsp"%>
		<!--右侧-->
		<div id="right_order">
			<div id="user_info">
				<div class="user_tit">
					<h3>个人资料</h3>
				</div>
				<div class="user_head">
					<h4>当前头像</h4>
					<div class="img_head">
						<div class="img_top"></div>
						<div class="img_middle">
							<a href="#"><img src="img/user_head.jpg" /></a>
						</div>
						<div class="img_bottom"></div>
					</div>
					<div class="edit_head">修改头像</div>
				</div>
				<div class="text_info" id="userInfo">
					<h4>会员信息</h4>
					<div class="text_user">
						<div class="u_item">
							<div class="u_label">会员登录名：</div>
							<div class="u_info">{{user.login_name}}</div>
						</div>
						<div class="u_item">
							<div class="u_label">昵 &nbsp;&nbsp; 称：</div>
							<div class="u_info" id="nickname_edit_div">
								<div class="text_frame">
									<input type="text" id="nickname_txt" class=" in_text" />
								</div>
								<div class="sure_btn">
									<img id="updateNickName" src="images/personal_ok.gif" />&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="#" id="nickname_cancel">取消</a>
								</div>
								<div>
									<span class="text_msg">昵称可由中英文、数字、下划线以及减号组成</span>
								</div>
							</div>
							<div class="u_info" id="nickname_div">
								<span>{{user.nick_name}}</span> &nbsp;&nbsp; <a href="#" id="nickname_edit">修改</a>
							</div>
						</div>

						<div class="u_item">
							<div class="u_label">真实姓名：</div>
							<div class="u_info" id="name_edit_div">
								<div class="text_frame">
									<input type="text" id="name_txt" class="in_text" />
								</div>
								<div class="sure_btn">
									<img id="name_save" src="images/personal_ok.gif" />
									&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" id="name_cancel">取消</a>
								</div>
								<div>
									<span class="text_msg">姓名只是为好友方便寻找你，不会被显示</span>
								</div>
							</div>
							<div class="u_info" id="name_div">
								<span>{{user.real_name}}</span> &nbsp;&nbsp; <a href="#" id="name_edit">修改</a>
							</div>
						</div>
						<div class="u_item">
							<div class="u_label">会员等级：</div>
							<div class="u_info">{{user.grade_id}}</div>
						</div>

					</div>
					<h4>
						<span class="edit" style=""><a href="#" id="user_edit">编辑&gt;&gt;</a></span>个人信息
					</h4>
					<!-- 个人信息显示区 -->
					<div id="user_div" class="text_user">
						<div class="u_item">
							<div class="u_label">性别：</div>
							<div class="u_info" id="userSex">{{user.sex}}</div>
						</div>
						<div class="u_item">
							<div class="u_label">生日：</div>
							<div class="u_info" id="userBirth">{{user.birth}}</div>
						</div>
						<div class="u_item">
							<div class="u_label">所属地区：</div>
							<div class="u_info" id="userProvince">{{user.province}}-{{user.area}}</div>
						</div>
						<div class="u_item">
							<div class="u_label">学校信息：</div>
							<div class="u_info" id="userSchool">{{user.school}}</div>
						</div>
						<div class="u_item">
							<div class="u_label">公司信息：</div>
							<div class="u_info" id="userCompany">{{user.company}}</div>
						</div>
						<div class="u_item">
							<div class="u_label">身份证号码：</div>
							<div class="u_info" id="userCard">{{user.card_number}}</div>
						</div>
					</div>
					<!-- 个人信息编辑区 -->
					<div id="user_edit_div" class="text_user">
						<div class="u_item">
							<div class="u_label">性别：</div>
							<div class="u_info">
								<select id="sex">
									<option selected="selected">男</option>
									<option>女</option>
								</select>
							</div>
						</div>
						<div class="u_item">
							<div class="u_label">生日：</div>
							<div class="u_info">
								<input type="text" id="birth" class="in_text" />
								<span id="birthSpan"></span>
							</div>
						</div>
						<div class="u_item">
							<div class="u_label">所属地区：</div>
							<div class="u_info">
								<input type="text" id="address" class="in_text" />
								<span id="addressSpan"></span>
							</div>
						</div>
						<div class="u_item">
							<div class="u_label">学校信息：</div>
							<div class="u_info">
								<input type="text" id="school" class="in_text" />
								<span id="schoolSpan"></span>
							</div>
						</div>
						<div class="u_item">
							<div class="u_label">公司信息：</div>
							<div class="u_info">
								<input type="text" id="company" class="in_text" />
								<span id="companySpan"></span>
							</div>
						</div>
						<div class="u_item">
							<div class="u_label">身份证号码：</div>
							<div class="u_info">
								<input type="text" id="card" class="in_text" />
								<span id="cardSpan"></span>
							</div>
						</div>
						<div class="save_info">
							<div class="save_1">
								<a href="#"><img id="user_save"src="images/personal_icon2.gif" /></a>
							</div>
							<div class="cancel_1">
								<a href="#" id="user_cancel">取消</a>
							</div>
						</div>
						<div class="clear"></div>
					</div>
					<h4>
						<span class="edit"><a href="#" id="address_edit">编辑&gt;&gt;</a></span>联系信息
					</h4>
					<!-- 联系信息显示区 -->
					<div class="text_user" id="address_div">
						<div class="u_item">
							<div class="u_label">Email：</div>
							<div class="u_info" id="uemail">{{user.email}}</div>
						</div>
						<div class="u_item">
							<div class="u_label">电话：</div>
							<div class="u_info" id="umobile">{{user.mobile}}</div>
						</div>
						<div class="u_item">
							<div class="u_label">手机号：</div>
							<div class="u_info" id="uphone">{{user.phone}}</div>
						</div>
						<div class="u_item">
							<div class="u_label">MSN：</div>
							<div class="u_info" id="umsn">{{user.msn}}</div>
						</div>
						<div class="u_item">
							<div class="u_label">QQ：</div>
							<div class="u_info" id="uqq">{{user.qq}}</div>
						</div>
						<div class="u_item">
							<div class="u_label">个人网址：</div>
							<div class="u_info" id="uwebsite">{{user.website}}</div>
						</div>
						<div class="u_item">
							<div class="u_label">发货地址：</div>
							<div class="u_info" id="usendAddress">{{user.send_address}}</div>
						</div>
						<div class="u_item">
							<div class="u_label">邮编：</div>
							<div class="u_info" id="uzipcode">{{user.zipcode}}</div>
						</div>
					</div>
					<!-- 联系信息编辑区 -->
					<div class="text_user" id="address_edit_div">
						<div class="u_item">
							<div class="u_label">Email：</div>
							<div class="u_info">
								<input type="text" class="in_text" id="email" />
								<div class="space_msg">&nbsp;</div>
								请输入常用的邮箱<font color="#FF0000">(必填) </font>
							</div>
						</div>
						<div class="u_item">
							<div class="u_label">电话：</div>
							<div class="u_info">
								<input type="text" class="in_text" id="mobile" />
								<div class="space_msg">&nbsp;</div>
								请输入正确的区号+电话
							</div>
						</div>
						<div class="u_item">
							<div class="u_label">手机号：</div>
							<div class="u_info">
								<input type="text" class="in_text" id="phone" />
								<div class="space_msg">&nbsp;</div>
								请输入正确的11位手机号码
							</div>
						</div>
						<div class="u_item">
							<div class="u_label">MSN：</div>
							<div class="u_info">
								<input type="text" class="in_text" id="msn" />
								<div class="space_msg">&nbsp;</div>
								请输入常用的MSN号码
							</div>
						</div>
						<div class="u_item">
							<div class="u_label">QQ：</div>
							<div class="u_info">
								<input type="text" class="in_text" id="qq" />
								<div class="space_msg">&nbsp;</div>
								请输入常用的QQ号码
							</div>
						</div>
						<div class="u_item">
							<div class="u_label">个人网址：</div>
							<div class="u_info">
								<input type="text" class="in_text" id="website" />
							</div>
						</div>
						<div class="u_item">
							<div class="u_label">发货地址：</div>
							<div class="u_info">
								<input type="text" class="in_text" id="send_address" />
							</div>
							<div class="space_msg">&nbsp;</div>
							去<a href="#">地址管理</a>中修改此项
						</div>
						<div class="u_item">
							<div class="u_label">邮编：</div>
							<div class="u_info">
								<input type="text" class="in_text" id="zipcode" />
							</div>
							<div class="space_msg">&nbsp;</div>
							去<a href="#">地址管理</a>中修改此项
						</div>
						<div class="save_info">
							<div class="save_1">
								<img id="address_save" src="images/personal_icon2.gif" />
							</div>
							<div class="cancel_1">
								<a href="#" id="address_cancel">取消</a>
							</div>
						</div>
					</div>
					<div class="clear"></div>

					<h4>
						<span class="edit"><a href="#" id="fav_edit">编辑&gt;&gt;</a></span>兴趣爱好
					</h4>
					<div class="u_item" id="fav_div">
						<span class="text_msg"></span>
					</div>
					<!-- 兴趣爱好编辑区 -->
					<div id="fav_edit_div">
						<div class="u_item">
							<div id="interest_hobby">
								<textarea cols="45">{{user.hobby}}</textarea>
							</div>
							<div id="words_msg">最多1000字符</div>
						</div>
						<div class="save_info">
							<div class="save_1">
								<a href="#" id="fav_save"><img
										src="images/personal_icon2.gif" /></a>
							</div>
							<div class="cancel_1">
								<a href="#" id="fav_cancel">取消</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--主体结束-->

<!--服务部分开始-->
<%@include file="footer.jsp"%>
</body>
<script type="text/javascript">
	var v1 = new Vue({
		el : "#userInfo",
		data : {
			user : {}
		},
		beforeMount : function() {
			axios.get("user", {
				params : {
					type : "getOneInfoByName"
				}
			}).then(function(result) {
				v1.user = result.data;
			});
		}
	});

	/* 修改昵称 */
	$(function() {
		$("#updateNickName").click(function() {
			var nickName = $("#nickname_txt").val();
			if (nickName.trim() == "") {
				alert("请输入您的新昵称");
			} else {
				$("#nickname_div span").text(nickName);
				$("#nickname_edit_div").hide();
				$("#nickname_div").show();
				axios.get("user", {
					params : {
						type : "updateNickName",
						nickName : nickName
					}
				});
			}
		});

		$("#name_save").click(function() {
			var realName = $("#name_txt").val();
			var regName = /^[\u4e00-\u9fa5]{2,6}$/;
			if (realName.trim() == "" || !regName.test(realName)) {
				alert('真实姓名填写有误');
			} else {
				$("#name_div span").text(realName);
				$("#name_edit_div").hide();
				$("#name_div").show();
				axios.get("user", {
					params : {
						type : "updateNickName",
						realName : realName
					}
				});
			}
		});

		var bn1 = false;
		var bn2 = false;
		var bn3 = false;
		var bn4 = false;
		var bn5 = false;
		$("#birth")
				.blur(
						function() {
							var birth = $("#birth").val();
							var pattern = /^((19[2-9]\d{1})|(20((0[0-9])|(1[0-8]))))\-((0?[1-9])|(1[0-2]))\-((0?[1-9])|([1-2][0-9])|30|31)$/;
							if (!pattern.test(birth)) {
								bn1 = false;
								$("#birthSpan").html("生日格式有误❌");
							} else {
								bn1 = true;
								$("#birthSpan").html("✔");
							}
						});

		$("#address").blur(function() {
			var address = $("#address").val();
			var pattern = /^[\u4e00-\u9fa5]{2,50}$/;
			if (!pattern.test(address)) {
				bn2 = false;
				$("#addressSpan").html("地址有误❌");
			} else {
				bn2 = true;
				$("#addressSpan").html("✔");
			}
		});

		$("#school").blur(function() {
			var school = $("#school").val();
			var pattern = /^[\u4e00-\u9fa5]{2,20}$/;
			if (!pattern.test(school)) {
				bn3 = false;
				$("#schoolSpan").html("学校有误❌");
			} else {
				bn3 = true;
				$("#schoolSpan").html("✔");
			}
		});

		$("#company").blur(function() {
			var company = $("#company").val();
			var pattern = /^[\u4e00-\u9fa5]{2,20}$/;
			if (!pattern.test(company)) {
				bn4 = false;
				$("#companySpan").html("公司有误❌");
			} else {
				bn4 = true;
				$("#companySpan").html("✔");
			}
		});

		$("#card").blur(function() {
			var card = $("#card").val();
			var pattern = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
			if (!pattern.test(card)) {
				bn5 = false;
				$("#cardSpan").html("身份证号有误❌");
			} else {
				bn5 = true;
				$("#cardSpan").html("✔");
			}
		});

		$("#user_save").click(function() {
			if (bn1 && bn2 && bn3 && bn4 && bn5) {
				var sex = $("#sex").val();
				var birth = $("#birth").val();
				var address = $("#address").val();
				var school = $("#school").val();
				var company = $("#company").val();
				var card = $("#card").val();
				$("#userSex").html(sex);
				$("#userBirth").html(birth);
				$("#userProvince").html(address);
				$("#userSchool").html(school);
				$("#userCompany").html(company);
				$("#userCard").html(card);

				$("#user_edit_div").hide();
				$("#user_div").show();

				axios.get("user", {
					params : {
						type : "updateUserInfo",
						sex : sex,
						birth : birth,
						address : address,
						school : school,
						company : company,
						card : card
					}
				});
			} else {
				alert("信息有误");
			}
		});

		$("#address_save").click(function() {
			var email = $("#email").val();
			var mobile = $("#mobile").val();
			var phone = $("#phone").val();
			var msn = $("#msn").val();
			var qq = $("#qq").val();
			var website = $("#website").val();
			var sendAddress = $("#email").val();
			var zipcode = $("#zipcode").val();

			$("#uemail").html(email);
			$("#umobile").html(mobile);
			$("#uphone").html(phone);
			$("#umsn").html(msn);
			$("#uqq").html(qq);
			$("#uwebsite").html(website);
			$("#usendAddress").html(sendAddress);
			$("#uzipcode").html(zipcode);

			$("#address_edit_div").hide();
			$("#address_div").show();

			axios.get("user", {
				params : {
					type : "updateConnectionInfo",
					email : email,
					mobile : mobile,
					msn : msn,
					qq : qq,
					website : website,
					sendAddress : sendAddress,
					zipcode : zipcode
				}
			});
		});
	});
</script>
</html>
