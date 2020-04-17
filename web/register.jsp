<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="css/book.css" />
    <link rel="stylesheet" type="text/css" href="css/sign.css" />
    <link type="text/css" rel="stylesheet" href="css/delete_order_style.css"/>
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/vue.js"></script>
<%--    <script type="text/javascript" src="js/vue.js"></script>--%>

    <script  type="text/javascript">
        /*给注册按钮绑定单击事件  */
        $(function(){
            //页面加载完毕后自动触发   ajax请求
            $("#button").bind("click",function(){
                alert("register");
                //1. 获取注册表单的注册信息
                //2. 验证数据格式
                //3. 提交表单数据到服务器，请求UserServlet验证用户注册信息
                //4. ajax/非ajax
                //1. 获取注册表单的注册信息
                var type = $("#type").val();
                var username = $("#username").val();
                var password = $("#password").val();
                var password2 = $("#password2").val();
                var email = $("#email").val();
                var recommender = $("#recommender").val();
                //2. 验证数据格式RegExp.test()
                //略，非null验证
                console.log("username:"+username);
                console.log(password);
                console.log(password2);
                console.log(email);
                console.log(recommender);
                if(username==null||username==''){
                    alert('用户名不能为null')
                    return;
                }
                if(password==null||password==""){
                    alert('密码不能为null')
                    return;
                }
                if(password!=password2){
                    alert('密码不一致')
                    return;
                }
                //验证用户名和密码格式：6位，不能使用特殊字符，不能使用数字开头
                //邮箱，邮箱的格式
                //3. 提交表单数据到服务器，请求UserServlet验证用户注册信息
                //数据已经提交至服务器

                $.ajax({
                    url:"user",
                    success:function(result){
                        alert("注册结果："+result)
                        if(result>0){
                            //跳转登录页面
                            //注册成功
                            window.location="registerOk.jsp";
                        }else{
                            $("#registerResult").html("注册失败！");
                        }
                    },
                    type:"post",
                    data:{"type":type,"username":username,"password":password,"email":email,"recommender":recommender}
                });

            });
        });

    </script>
</head>
<body>
<div id="bodyPart">
    <!--头部导航开始-->
    <%@include file="head1.jsp"%>

    <!--注册-->
    <div id="bodyPart" >

        <div class="login_logo">
            <a href="index.jsp"><img src="images/logo_regist.gif" /></a>
        </div>
        <div id="register">
            <div class="register_tit">
                <h2>注册新用户</h2><b></b>
                <span>我已经注册，现在就 <a href="login.jsp" style="color: #005AA0;">登录</a> </span>
            </div>

            <div class="register_content">
                <div class="clear"></div>
                <form action="user" method="post">
                    <div class="user_form">
                        <div class="uInfo">
                            <span class="label">用户名：</span>
                            <input type="text" id="username" name="username" class="text" />
                            <!--多传递一个表单元素  -->
                            <input type="hidden" id="type" name="type" value="checkRegisterAjax" class="text" />
                        </div>
                        <div class="uInfo">
                            <span class="label">设置密码：</span>
                            <input type="password" id="password" name="password"  class="text" />
                        </div>
                        <div class="uInfo">
                            <span class="label">确认密码：</span>
                            <input type="password" id="password2" name="password2"  class="text"  />
                        </div>
                        <div class="uInfo">
                            <span class="label">邮箱：</span>
                            <input type="text" id="email" name="email"  class="text"  />
                        </div>
                        <div class="uInfo">
                            <span class="label">推荐人用户名：</span>
                            <input type="text" id="recommender" name="recommender" class="text"  />
                        </div>
                        <div class="uInfo">
                            <span class="label">验证码：</span>
                            <input type="text" name="code" id="code" /><img src="images/check_code.jpeg" />    <font>看不清？</font><a href="#">换一张</a>
                        </div>
                        <div class="uInfo">
                            <span class="label">&nbsp;</span>
                            <input type="button" id="button" value="同意以下协议，提交"/>
                            <span id="registerResult"></span>
                        </div>
                    </div>
                </form>

                <div class="clear"></div>
                <div id="protocol_con">
                    <h5>一、本站服务条款的确认和接纳</h5>
                    <p>本站的各项电子服务的所有权和运作权归本站。本站提供的服务将完全按照其发布的服务条款和操作规则严格执行。用户同意所有服务条款并完成注册程序，才能成为本站的正式用户。用户确认：本协议条款是处理双方权利义务的约定，除非违反国家强制性法律，否则始终有效。在下订单的同时，您也同时承认了您拥有购买这些产品的权利能力和行为能力，并且将您对您在订单中提供的所有信息的真实性负责。</p>
                    <h5>二、服务简介</h5>
                    <p>本站运用自己的操作系统通过国际互联网络为用户提供网络服务。同时，用户必须：</p>
                    <ul>
                        <li>(1)自行配备上网的所需设备，包括个人电脑、调制解调器或其它必备上网装置。 </li>
                        <li>(2)自行负担个人上网所支付的与此服务有关的电话费用、网络费用。 </li>
                    </ul>
                    <p>基于本站所提供的网络服务的重要性，用户应同意</p>
                    <ul>
                        <li>(1)提供详尽、准确的个人资料。 </li>
                        <li>(2)不断更新注册资料，符合及时、详尽、准确的要求。 </li>
                    </ul>
                    <p>本站保证不公开用户的真实姓名、地址、电子邮箱和联系电话等用户信息， 除以下情况外：</p>
                    <ul>
                        <li>(1)用户授权本站透露这些信息。 </li>
                        <li>(2)相应的法律及程序要求本站提供用户的个人资料。 </li>
                    </ul>
                    <h5>三、价格和数量</h5>
                    <p>本站将尽最大努力保证您所购商品与网站上公布的价格一致。</p>
                    <p>产品的价格和可获性都在本站上指明，这类信息将随时更改。</p>
                    <p>您所订购的商品，如果发生缺货，您有权取消定单。</p>
                    <h5>四、送货</h5>
                    <p>本站将会把产品送到您所指定的送货地址。所有在本站上列出的送货时间为参考时间，参考时间的计算是根据库存状况、正常的处理过程和送货时间、送货地点的基础上估计得出的。</p>
                    <p>请清楚准确地填写您的真实姓名、送货地址及联系方式。因如下情况造成订单延迟或无法配送等，本站将无法承担迟延配送的责任：</p>

                </div>

            </div>

        </div>

    </div>

    <div class="clear"></div>
    <!--头部导航开始-->
    <%@include file="footer1.jsp"%>
</div>
</body>
<script type="text/javascript">
    var vm = new Vue({
        el:"#register",
        data:{},
        method:{}
    });

 </script>


</html>















