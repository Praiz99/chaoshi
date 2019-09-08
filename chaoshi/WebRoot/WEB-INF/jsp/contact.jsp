
<%@ page language="java" contentType="text/html; charset=UTF-8"  
	pageEncoding="UTF-8"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <style type="text/css">

  </style>
  </head>
  
  <body >
 	<div >
 	     <font style="color: red;font-size: 20px;"><span  id="Date" ></span></font>
   	
    <img src="images/weixin.png" width="25px" height="25px"><font >xxx-xxx</font>&nbsp
    <img src="images/phone.png" width="25px" height="25px"><font >138-000-0000</font>
    <img src="images/qq.png" width="25px" height="25px"><font>1045xxxxxxx</font>
    <img src="images/myhome.png" width="25px" height="25px"><font>浙江省杭州市XXXXX</font>

    </div>
    <script type="text/javascript" src="<%=basePath %>js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	var random=Math.random();  //生成随机数：0.32273213103830223
	var demo= (2<<23);   //十进制数：16777216
	var list=random*demo;   //生成代表颜色的随机数：5414546.672569901
	var num=Math.floor(list);  //向下取整：5414546
	$("font").css({"color": "#"+num.toString(16)})
	$(function(){
setInterval(function(){
var weekday=new Array(7) 
weekday[0]="一";
weekday[1]="二";
weekday[2]="三";
weekday[3]="四";
weekday[4]="五";
weekday[5]="六";
weekday[6]="日";   
var date=new Date();
 
var year=date.getFullYear(); //获取当前年份   
var mon=date.getMonth()+1; //获取当前月份   
var da=date.getDate(); //获取当前日   
var day=date.getDay(); //获取当前星期几   
var h=date.getHours(); //获取小时   
var m=date.getMinutes(); //获取分钟   
var s=date.getSeconds(); //获取秒   
var d=document.getElementById('Date'); 
t='当前时间:'+year+'年'+mon+'月'+da+'日'+'星期'+weekday[day]+' '+h+':'+m+':'+s+'<br/>';   
d.innerHTML=t;  },1000);  });
	</script>
  </body>
</html>
