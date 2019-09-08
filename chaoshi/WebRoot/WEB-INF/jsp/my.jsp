<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'my.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
#my{
 position: absolute;
 right: 30px;
 top:50px;
 font: 12px/1.5 tahoma, arial, \5b8b\4f53;
} 
  #my img{
   width:30px;
   height: 30px;
   border-radius:50%
  }   
     fieldset, img {
            border: 0;
        }
     
 
        button, input, select, textarea {
            font-size: 100%;
        }
        .container-fluid {
            background: aquamarine;
            height: 100%;
        }
        .nav > li > a:hover {
            color: #262626;
            text-decoration: none;
            background-color: #354144;
        }
        .open > a {
            background-color: #354144 !important;
        }
        .grid:hover {
            background:  #efefef ;
        } 
     
</style>
  </head>
  
  <body>
    <div id="my">
		 <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle"
                               data-toggle="dropdown"
                               style="height: 60px;background-color: #C0C0C0;" >
                                <img alt="" class="img-circle" src="<%=basePath %>${sessionScope.user.photo }" width="38px" height="38px"/>
                                <span style="color: #FFFFFF;font-size: 15px">
                                <i>${sessionScope.user.username }</i>
                            </span>
                            </a>
                            <div class="dropdown-menu pull-right"
                                 style="background: #FFFFFF;width: 320px;overflow: hidden">
                                <div style="margin-top: 16px;border-bottom: 1px solid #eeeeee">
                                    <div style="text-align: center">
                                        <img class="img-circle" src="<%=basePath %>${sessionScope.user.photo }"
                                             style="width: 38px;height: 38px;"/>
                                    </div>
                                    <div style="color: #323534;text-align: center;line-height: 36px;font-size: 15px">
                                        <span>${sessionScope.user.username }</span>
                                    </div>
                                </div>
                                <div class="row" style="margin-left: 15px;margin-right: 15px;margin-top: 10px">
                                <a href="favorite" class="favorite">
                                    <div class="col-md-4 text-center grid">
                                   
                                        <i class="fa fa-thumbs-up" style="font-size: 25px;line-height: 45px;"></i>
                                        <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                        
                                   	
   										 		${sessionScope.user.favorite.favor ?"已赞":"点个赞吧"} 
                                            	</p>
                                    </div>
                                   </a> 
                                    <a data-toggle="modal" data-target="#message" href="">
                                    <div class="col-md-4 text-center grid">
                                        <i class="fa fa-comments" style="font-size: 25px;line-height: 45px;"></i>
                                        <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                            留言</p>
                                    </div>
                                    </a>
                                    <a data-toggle="modal" data-target="#updateimg" href="">
                                    <div class="col-md-4 text-center grid">
                                        <i class="fa fa-user-circle" style="font-size: 25px;line-height: 45px;"></i>
                                        <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                            修改头像</p>
                                    </div>
                                </div>
                                </a>
                                <div class="row" style="margin-top: 20px">
                                <a href="gologin">
                                    <div class="text-center " 
                                         style="padding: 15px;margin: 0px;color: #323534;">
                                       <i class="fa fa-sign-out"></i> 退出登入界面
                                    </div>
                                    </a>
                                </div>                       
                            </div>
                        </li>
                    </ul>
                   
	 </div>
	 <div>
	 <!-- 修改头像 -->
	 <div id="updateimg" class="modal fade" >
        <div class="modal-dialog" >
            <div class="modal-content">
                <div class="modal-body">
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-title" >
                    <p class="text-center">修改头像</p>
                </div>
                <div class="modal-body">
                		
                    <form  class="form-group" enctype="multipart/form-data" action="upload" method="POST" >
                    		<div class="form-group">
                                <label>当前头像:</label><br/>
                                <img src="<%=basePath %>${sessionScope.user.photo }" width="38px" height="38px"">
                            </div>
                             <div class="form-group" >
                                <label class="control-label">更换头像</label>
   								 <input type="file" name="photo" id="file"/>
                            </div> 
                   
                            <div class="text-right">
                                <button class="btn btn-primary con" type="submit">确定</button>
                                <button class="btn btn-danger" data-dismiss="modal">取消</button>
                            </div>  
                    </form>
                </div>
            </div>
        </div>
    </div>
	 <!--  留言--> 
	  <div id="message" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-title">
                    <h1 class="text-center">留言</h1>
                </div>
                <div class="modal-body">
                		
                
                    <form class="form-group message">
                    		<div class="form-group">
                                <label for="name">姓名</label>
                                <input name="realname" id="name" class="form-control" type="text" placeholder="留下名字">
                            </div>
                            <div class="form-group">
                                <label for="phone">联系方式</label>
                                <input name="telephone" id="phone" class="form-control" type="text" placeholder="留下联系方式">
                            </div>
                             <div class="form-group">
                                <label for="advice">留言和建议</label>
                                <textarea name="advice" id="advice" class="form-control"	placeholder="留言和建议" rows="3" ></textarea>
                            </div> 
                   
                            <div class="text-right">
                                <button class="btn btn-primary"  type="button" id="send">发送</button>
                                <button class="btn btn-danger" data-dismiss="modal">取消</button>
                            </div>  
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
  </body>
</html>
