<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资源建设平台</title>
<style>
	.head{
		height: 60px;
		width: 100%;
		background-color: #FFFFFF;
		border-bottom:1px solid #BABABA;


	}
	.real-head{
		height:100%;
		width: 1170px;
		margin:0 auto;
		padding-top:16px;
	}
</style>
</head>
<body>
	<div class="head" ondragstart='return false;'>
		<div class="real-head" style="-moz-user-select: none;-webkit-user-select: none;-ms-user-select: none;-khtml-user-select: none;user-select: none;cursor:default">
			<span class='admin fl'>Admin</span>
			<img  src="${APP_PATH}/static/images/resouces.png" class="fl">
			<span class='name fl'>资源库建设平台</span>
			<form class='form-inline fl search'>
			<div class="input-group">
		      <input type="text" class="form-control " id="exampleInputAmount" placeholder="" style="width:200px;">
		      <div class="input-group-addon"><span class="fa  fa-search" ></span></div>
		    </div>
		    </form>
		    <div class="dropdown fr"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
               <img src="${APP_PATH}/static/images/user.png" class="nav-avatar" style="width:40px; border-radius:50%">
                <b class="caret"></b></a>
                <ul class="dropdown-menu dropdown-menu-right " style="padding:0px;border-top-left-radius:0px;border-top-right-radius:0px;font-family: 'Microsoft YaHei';width:30px;">
	                <!--  <li ><a href="#" class='person' style="line-height:30px;">个人中心</a></li> -->
	                <li ><a href='${APP_PATH}/AdmLogin/exit' class='logout' style="line-height:30px;">退 出</a></li>
                </ul>
           </div>
		</div>
	</div>
</body>
</html>