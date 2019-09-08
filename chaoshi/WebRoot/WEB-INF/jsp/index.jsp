<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  import="com.product.bean.User"
	pageEncoding="UTF-8"%> 

 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统</title>

<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">
<script src="<%=basePath %>js/jquery-3.4.1.min.js"></script>
<script src="<%=basePath %>js/bootstrap.min.js"></script>

<link rel="stylesheet" href="<%=basePath %>css/index.css" type="text/css">


</head> 
<body>
	<div id="navigation">
		  <%@ include file="my.jsp"%> 
	 
    <ul>
        <li><a href="main">首 页</a>
        
        </li>
        <li>
            <a href="#">商品操作</a>
            <ul>
                <li><a href="order">进退商品</a></li>
                <li><a href="showProduct">所有商品</a></li>
            </ul>
        </li>
        <li>   
        <a href="#">员工操作</a>
        <ul>
        	<li><a href="showEmp">所有员工</a></li>
            <li><a href="showEmpSa">员工业绩</a></li>
         </ul>
        </li>
        </font>
        <li><a href="go_updapass">修改密码</a></li> 
        <li><a href="#" id="updateimg">更换头像</li>
         <li><a href="#" id="updateimg">个人中心</li>
          <li><a href="gologin">退出^-^</a></li>
         
    </ul>

    
    <%@ include file="contact.jsp"%>

</div>
	<div id="foot" style="overflow: hidden; ">
	
	
   <span><p>欢迎管理员:${sessionScope.user.username }</p>
   
	 <%User user=(User)request.getSession().getAttribute("user");%>
	 <p>超市总余额： <%=user.getBalance() %> </p>

	 </span>
	  <div id="container">
	 	 <div id="list">
	 		<img alt="1" src="images/3.jpg">
	 		<img alt="2" src="images/1.jpg">
	 		<img alt="3" src="images/2.jpg">
	 		<img alt="4" src="images/3.jpg">
	 		<img alt="5" src="images/1.jpg">
	 	 </div> 
	 	 <a  href="javascript:;" id="next" class="arrow">></a>
	 
	</div>
	</div>
	<script type="text/javascript" src="<%=basePath %>js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
/* 	$('.grid').click(function(){
	alert("待开发")
	})
		$('#updateimg').click(function(){
	alert("待开发")
	}) */

	
    $('#navigation>ul>li:has(ul)').hover(function () {
        $(this).children('ul').stop().slideDown()
    },function () {
        $(this).children('ul').stop().slideUp()
    })
	$(".touxiang").click(function(){
	
	});
	
$(function(){
var $container = $('#container');
var $list = $('#list');
var $prev=$('#prev');
var $next=$('#next');
var PAGE_WIDTH=600;//一页的宽度
var imgCount=3
$next.click(function(){
	nextPage(true)
});
/* 平滑翻页 */
function nextPage(next){
var currLeft= $list.position().left;
var offset=next?-PAGE_WIDTH:PAGE_WIDTH;
currLeft+=offset

if(currLeft===-(imgCount+1)*PAGE_WIDTH){

currLeft=-PAGE_WIDTH
}
else if(currLeft===0){
currLeft=-imgCount*PAGE_WIDTH
}
$list.css('left',currLeft);
}
});
$(function () {
        $(".dropdown").mouseover(function () {
            $(this).addClass("open");
        });
 
        $(".dropdown").mouseleave(function () {
            $(this).removeClass("open");
        })
    })
$("#send").click(function(){
var name=$("#name").val();
var phone=$("#phone").val();
var advice=$("#advice").val();
$.ajax({
url:"advice",
type:"POST",
data:{
"realname":name,
"telephone":phone,
"advice":advice
},
success:function(data){
alert("发送成功")
window.location.href="goindex"; 
}

})
})
</script>
</body>
</html>