<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>京东商城 - 图书频道首页</title>
    <link rel="stylesheet" type="text/css" href="css/book.css" />
    <link rel="stylesheet" type="text/css" href="css/book_list.css" />
    <link rel="stylesheet" type="text/css" href="css/zpageNav.css" />
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/vue.js"></script>
    <script type="text/javascript" src="js/zpageNav.js"></script>
</head>
<body id="book">

<span id="parent_id"  style="display: none">${param.parent_id}</span>

<!--快捷访问栏开始-->
<%@include file="head.jsp"%>
<!--头部导航结束-->
<div class="clear"></div>
<!--位置-->
<div id="position" class="page_width">
    <ul>
        <li><a href="#">首页</a></li>
        <li>&gt;</li>
        <li><a href = "#">图书</a></li>
        <li>&gt;</li>
        <li><a href="#">小说</a></li>
        <li>&gt;</li>
        <li><a href="#">中国当代小说</a></li>
    </ul>
</div>
<!--主体main部分开始-->
<div class="clear"></div>


<%
    //推荐在jsp页面中进行业务处理
    //1.获取分类id
    //2.查询二级分类
    //3.嵌入到当前页面
    //4.返回拼写完毕的页面给客户端

%>
<div id="book_list_content">

    <div id="main" class="page_width">
        <!--左侧开始-->
        <div id="left_list">
            <div id="same_sort">
                <div class="book_tit" style="width:209px;"><h2>浏览同级分类<br /><span>Browse other categories</span></h2></div>
                <div class="book_content">
                    <ul>
                        <li v-for="category of categoriesTwo">
                            <a href='http://www.baidu.com' @click.prevent="queryCategoriesTwoProducts(category.category_id)" >{{category.name}}</a>
                        </li>
                    </ul>
                    <div class="clear"></div>
                    <div class="extra"><a href="book.jsp">返回上级分类&gt;&gt;</a></div>
                </div>
            </div>

            <div class="books">
                <div class="book_title">
                    <h2>新书推荐<br /><span>New Releases</span></h2>
                </div>
                <div class="book_info">
                    <div class="book_pic">
                        <div class=""><a href="bookDetail.jsp" target="_blank"><img src="img/book_59.jpg"/></a></div>
                    </div>
                    <div class="book_text">
                        <div class="book_name"><a href="bookDetail.jsp" target="_blank"><font color="#FF0000">《古炉》（贾平凹）</font></a></div>
                        <div class="book_intr">　　《<古炉>（贾平凹）》的故事发生在陕西一个叫“古...</div>
                        <div class="book_more"><a href="#" target="_blank">深度了解&gt;&gt;</a></div>
                    </div>
                </div>
                <div class="book_info">
                    <div class="book_pic">
                        <div class=""><a href="bookDetail.jsp" target="_blank"><img src="img/book_59.jpg"/></a></div>
                    </div>
                    <div class="book_text">
                        <div class="book_name"><a href="bookDetail.jsp" target="_blank"><font color="#FF0000">《古炉》（贾平凹）</font></a></div>
                        <div class="book_intr">　　《<古炉>（贾平凹）》的故事发生在陕西一个叫“古...</div>
                        <div class="book_more"><a href="#" target="_blank">深度了解&gt;&gt;</a></div>
                    </div>
                </div>
                <div class="book_info">
                    <div class="book_pic">
                        <div class=""><a href="bookDetail.jsp" target="_blank"><img src="img/book_59.jpg"/></a></div>
                    </div>
                    <div class="book_text">
                        <div class="book_name"><a href="bookDetail.jsp" target="_blank"><font color="#FF0000">《古炉》（贾平凹）</font></a></div>
                        <div class="book_intr">　　《<古炉>（贾平凹）》的故事发生在陕西一个叫“古...</div>
                        <div class="book_more"><a href="#" target="_blank">深度了解&gt;&gt;</a></div>
                    </div>
                </div>
            </div>


            <div class="ad_left_list">
                <div class=""><a href="#" target="_blank"><img src="img/book_61.jpg" /></a></div>
                <div class=""><a href="#" target="_blank"><img src="img/book_47.jpg"></a></div>
            </div>

        </div>
        <!--左侧结束-->

        <!--右侧开始-->
        <div id="right_list">

            <div id="filter">
                <div class="fore item">排序：</div>
                <ul class="item tab">
                    <li id='filter-curr' class='down'><b></b><a href='#' name="sale_count">销售排行</a><span></span></li>
                    <li class='up price'><b></b><a href="#" name="fixed_price">价格</a><span></span></li>
                    <li  class="up discount"><b></b><a href='#'>折扣</a><span></span></li>
                    <li class="down"><b></b><a href='#'>好评度</a><span></span></li>
                    <li  class='down'><b></b><a href='#'>上架时间</a><span></span></li>
                    <li  class="down"><b></b><a href='#' name="publish_time">出版时间</a><span></span></li>
                </ul>
                <span class="clear"></span>
            </div>

            <!--
                分页视图
                <div class="page">
                <img src="images/page.jpeg" />
            </div> -->

            <div class="clear"></div>

            <div class="product_list">
                <div v-for="product of products" class="pro_item">
                    <div class="pro_picture"><a :href="'bookDetail.jsp?prodeuctId='+product.product_id"><img :src="product.picture" /></a></div>
                    <div class="pro_info">
                        <div class="pro_up">
                            <div class="bookName"><a :href="'bookDetail.jsp?prodeuctId='+product.product_id">{{product.name}}</a></div>
                            <div class="author">作&nbsp;&nbsp;&nbsp;&nbsp;者：<span>马识途</span> 著，译<br />出&nbsp;版&nbsp;社：<span>陕西师范大学出版社</span><br /></div>
                        </div>
                        <div class="pro_down">
                            <div class="pro_left">
                                出版时间：2010年10月<br />
                                定&nbsp;&nbsp;&nbsp;&nbsp;价：<s>￥{{product.fixed_price}}</s>
                            </div>
                            <div class="pro_right">
                                顾客评价：<span class="star">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>（<span>已有96人评价</span>）<br />
                                会员价：<b><font>￥12.10</font></b><span class="user_price"></span> 京东价：<b>￥12.70</b>（43折)
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div class="book_btn">
                            <a href="initCart.jsp" class="buy"></a><input type="button" value="收藏" class="favorite" />
                        </div>
                    </div>
                </div>
            </div><!--列表结束-->

            <!--
                分页视图
                <div class="page">
                 <img src="images/page.jpeg" />
             </div> -->
            <!-- 分页组件 -->
            <div class="wrap" id="wrap">
                <zpagenav :page="page" :page-size="pageSize" max-page="maxPage"
                          :total="total" @pagehandler="pageHandler">
                </zpagenav>
            </div>

        </div>
        <!--右侧结束-->
    </div>
</div>
<div class="clear"></div>
<!--服务部分开始-->
<%@include file="footer.jsp"%>

<script type="text/javascript">
    alert("parent_id:"+$("#parent_id").html())

    var orderFiled="sale_count"; //排序字段
    var orderStyle = "desc"; //排序方式
    var pageNum = 1; //当前页面
    var pageSize = 5;// 每页的条数
    var category_id;//当前商品的二级分类中某一个菜单的id

    /**
     查询商品信息
     1. 分页查询
     2. 排序
     3. 查询默认商品信息
     4. 查询指定商品信息
     */
    function queryProducts(category_id,orderFiled,orderStyle,pageNum,pageSize){

        $.ajax({
            url:"bookList",
            type:"post",
            success:function(result){
                alert("result:"+result)
                console.log(result);
                vm.$data.products = result;
            },
            data:{"type":"queryProductAjax","category_id":category_id,
                "orderFiled":orderFiled,"orderStyle":orderStyle,
                "pageNum":pageNum,"pageSize":pageSize},

            dataType:"json"
        });
    }

    var vm =  new Vue({
        el:"#book_list_content",
        data:{
            categoriesTwo:[],
            products:[],
            //--------分页数据
            page:1,//默认显示页码
            pageSize:10,//每页显示的条数
            maxPage:9,//最大页码
            total:55//商品总数量
        },
        methods:{
            //点击二级菜单，查询商品信息
            queryCategoriesTwoProducts:function(id){
                //点击二级菜单，默认选中第一页
                this.pageHandler(1);
                //查询指定二级菜单下的商品信息
                alert("查询指定二级菜单下的商品信息:"+id)
                category_id = id;
                //查询用户点击的二级菜单信息 ，category_id用户点击的菜单的id
                queryProducts(category_id, orderFiled, orderStyle, pageNum, pageSize);
            },
            //分页事件
            pageHandler:function(page){
                alert("点击页码："+page)
                //1.修改样式，设置当前页的背景
                this.page = page;
                //2.发送ajax请求，请求指定页数据
                queryProducts(category_id, orderFiled, orderStyle, page, pageSize)
            }
        },
        mounted:function(){
            //获取当前二级菜单列表
            $.ajax({
                url:"book",
                type:"post",
                success:function(result){
                    alert("用户点击的一级菜单下的所有二级菜单:"+result)
                    console.log(result);
                    vm.$data.categoriesTwo = result;
                    //获取一级菜单下的所有二级菜单中第一个菜单项得id
                    category_id = result[0].category_id;

                    alert("二级菜单中的第一个菜单项:"+category_id)
                    //在次发起ajax请求，请求当前二级菜单列表中的第一项下的商品信息
                    //category_id 用户点击的一级菜单下的二级菜单列表中的第一个二级菜单id
                    queryProducts(category_id, orderFiled, orderStyle, pageNum, pageSize);
                },
                data:{"type":"queryBookCategory","parent_id":$("#parent_id").html()},
                dataType:"json"
            });
        },
        created:function(){
            //默认设置第一页为选中页
            this.pageHandler(1);
        }
    });

</script>
<script type="text/javascript">
    $(function(){
        //1. 给排序菜单绑定单击事件
        $("#filter li").bind("click",function(){
            //alert("sort 商品")
            //2. 修改样式
            //获取列表项的默认class属性值，修改方向
            var liObjClass = $(this).attr("class");
            if(liObjClass.indexOf("down")!=-1){
                //默认向下，修改属性值，向上
                liObjClass = liObjClass.replace("down","up");


                orderStyle = "asc";
            }else if(liObjClass.indexOf("up")!=-1){
                liObjClass = liObjClass.replace("up","down");

                orderStyle = "desc"
            }else{
                liObjClass = liObjClass+" down "

                orderStyle = "desc"
            }
            //更新排序方式
            $(this).attr("class",liObjClass);

            //设置默认排序按钮的背景颜色
            $("#filter li:not(this)").removeAttr("id");
            $(this).attr("id","filter-curr");
            //3. 请求新的数据（排序方式不同）

            orderFiled = $(this).find("a").attr("name");
            queryProducts(category_id, orderFiled, orderStyle, pageNum, pageSize);
        });
    });
</script>


</body>
</html>
















