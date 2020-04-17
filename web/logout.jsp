<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/logout_style.css" rel="stylesheet" type="text/css"/>
<title>退出</title>
		<script type="text/javascript">
				function loginmethod() {
					var temp = window.document.getElementById("time");
					var t = 2;
					window.setInterval(function() {
						if (t == 0) {
							var loc = window.location;
							loc.href = "book.jsp";
							return;
						}
						temp.innerHTML = t;
						t--;
					}, 1000);
				}
	</script>
</head>
<body onload="loginmethod()">
<div class="succeed">
	<div class="s_cornor_t">
		<div class="s_cornor_tl">
		</div>
		<div class="s_cornor_tr">
		</div>
	</div>
	<div class="s_cornor_c">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td align="right" width="200">
						<img src="img/suc_05.gif" height="66" width="85"></td>
					<td>
						<h1>
							退出成功！</h1>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<strong>购物车中的商品已暂存</strong></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						下次登录时，这些商品会自动加入到购物车，您可以直接购买</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<font color="#999999"><strong>3</strong>&nbsp;秒后自动返回&nbsp;<a href="#">京东首页</a>，请稍候...</font></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<img src="img/logo2.jpg" height="46" width="167"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="s_cornor_b">
		<div class="s_cornor_bl">
		</div>
		<div class="s_cornor_br">
		</div>
	</div>
</div>
</body>
</html>
