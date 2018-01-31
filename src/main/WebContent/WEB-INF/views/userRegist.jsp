<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath());%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>用户注册</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css"> 
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/sui.min.css">
     <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/userRegist.css">
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/js/sui.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>  
    <style type="text/css">
    
    </style>
</head>
<body>
    <div class="sui-row-fluid">
       <div class="top sui-row-fluid">
           <div class="top-left fl">欢迎注册</div>
           <div class="top-return fr">返回</div>
           <div class="top-right fr">
               <div class="hadAccount">已有账号？</div>
               <div class="login">请登录</div>
           </div>
       </div>
       
       <div class="sui-row-fluid">
       <div class="content">
          <form class="sui-form sui-formm" id="formRegist" novalidate="novalidate">
             <div style="position: relative;">
                <input class="input-xlarge account" name="account" type="text" placeholder="请输入用户名" style="height:40px;padding-left:50px; display: block;">
             </div> 
             <div style="position: relative;">
                <input class="input-xlarge name" name="name" type="text" placeholder="请输入真实姓名" style="height:40px;padding-left:50px; display: block;">
             </div> 
             <div style="position: relative;">
                <input class="input-xlarge email" id="inputEmail" name="email" type="text" placeholder="请输入邮箱" data-rules="required|email" style="height:40px;padding-left:50px; display: block;">
             </div>
             <div style="position: relative;">
                <input class="input-xlarge password" name="password" title="密码" type="password" placeholder="请输入密码" style="height:40px;padding-left:50px; display: block;">
             </div> 
             <div style="position: relative;">
                <input class="input-xlarge repassword" name="repassword"  type="password" placeholder="请再次输入密码" style="height:40px;padding-left:50px; display: block;">
             </div> 
              <button type="submit" class="sui-btn btn-block btn-xlarge btn-danger" href="javascript:void(0);" style="bcolor:#DBC481; height:40px;line-height:33px; display: block;">提交</button>        
          </form>
           <div class="bg-img sui-row-fluid">
              
           </div>
       </div>
       </div>
    </div>
    <!--登录弹出框B -->
    <div tabindex="-1" class="sui-modal hide fade" style="width: 375px;border: 1px" id="loginModal" role="dialog" data-hasfoot="false"  data-backdrop="static">
    <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="border-bottom:0">
        <button class="sui-close" aria-hidden="true" type="button" data-dismiss="modal"></button>
        <h4 class="modal-title" style=" margin-top: 20px; text-align: center;font-size: 20px;font-weight: normal;" id="myModalLabel">登录</h4>
      </div>
      <div class="modal-body">
          <form class="sui-form form-horizontal" id="formLogin" novalidate="novalidate">
             <div class="control-group" style="margin-top: 30px;">
                <label class="control-label" for="inputAccount">用户名：</label>
                <div class="controls">
                   <input name="account"  id="inputAccount" type="text" placeholder="用户名">
                </div>
             </div>
             <div class="control-group">
                <label class="control-label" for="inputPassword">&nbsp;密&nbsp;&nbsp;&nbsp;码：</label>
                <div class="controls">
                   <input name="password"  title="密码" id="inputPassword" type="password" placeholder="密码">
                </div>
             </div>

             <div class="control-group">
                 <div class="controls">
                     <button id="loginButton" style="margin-left: 96px; margin-top: 15px;" class="sui-btn btn-danger" type="submit">登录</button>
                 </div>
                 <div class="controls">
                     <button id="closeButton" style="margin-left: 30px; margin-top: 15px;" class="sui-btn btn-danger" type="button" data-dismiss="modal">关闭</button>             
                 </div>
             </div>
          </form>
      </div>
    </div>
   </div>
   </div>
    <!--登录弹出框E -->
</body>
<script>
//登录B
$("#formLogin").validate({
    rules: {
      account: {
        required: true,
        minlength: 1,
        maxlength: 12
      },
      password: {
        required: true,
        minlength: 1,
        maxlength: 8
      },
    },
    success: function() {
    	var load = layer.msg("正在登录,请稍后!",{icon:16,shade:0.05,time:38*1000});
    	$.ajax({
			url:'${APP_PATH}/Customer/loginCustomer',       //传到控制器controller
			data:{"userName":$("#inputAccount").val(),"userPassword":$("#inputPassword").val()},
			type:'post',
			success:function(data){
				setTimeout(function(){layer.close(load)}, 500);
				if(data.code==200){			
					if(data.extend.userType==1){
					   $('#loginModal').modal('hide');
						layer.confirm('登录成功！', {
							  btn: ['确定'] 					  
							}, function(index, layero){
								layer.close(index);
								 window.open("${APP_PATH}/View/index","_parent");
							});	
				   }else{
					   layer.alert("您的账号还未被授权！");
				   }						
				}
				else{
					layer.alert("用户名或密码错误！");
				}
			}
		});
      return false;
    }
  });
  //登录E
  
  //注册B
	  $("#formRegist").validate({
		  rules: {
	      account: {
	        required: true,
	        minlength: 1,
	        maxlength: 12
	      },
	      name: {
	          required: true,
	          minlength: 1,
	          maxlength: 12
	        },
	      email: {
	            required: true,
	            minlength: 2,
	            maxlength: 20
	          },
	      password: {
	        required: true,
	        minlength: 1,
	        maxlength: 8
	      },
	      repassword: {
	        required: true,
	        prefill: 'password',
	        match: 'password'
	      },
	    },
	    success: function() {
	    	var load = layer.msg("正在提交,请稍后!",{icon:16,shade:0.05,time:38*1000});
	    	$.ajax({
				url:'${APP_PATH}/Customer/saveCustomerInfo',       //传到控制器controller
				data:{"userName":$(".account").val(),"userRealName":$(".name").val(),"userEmail":$(".email").val(),"userPassword":$(".password").val()},
				type:'post',
				success:function(data){
					setTimeout(function(){layer.close(load)}, 500);
					if(data.code==200){
						layer.confirm('信息已提交,请等待管理员审核！', {
							  btn: ['确定'] 					  
							}, function(index, layero){													
								 layer.close(index);
								 window.open("${APP_PATH}/View/index","_self");
							});	
					}
					else if(data.code==300){
						layer.alert("用户名已存在！");
					}
					else{
						layer.alert("遇到错误！");
					}
				}
			});
	      return false;
	    }
	  })
	  //注册E
 
 //注册E

//弹出登录框B
$(document).on('click','.login',function(){	
	$('#inputAccount').val('');
	$('#inputPassword').val('');
	$('#loginModal').modal('toggle');
});
//弹出登录框E

/*屏幕适应B*/
$(document).ready(function(){
	adaptiveDisplay();
	function adaptiveDisplay(){
      var sUserAgent = navigator.userAgent.toLowerCase();
      var pc=sUserAgent.match(/windows/i) == "windows";
      if(pc){ 
    	  $("#loginModal").css("left","53%");
    	  $(".top").css({"height":"35px","padding-top":"0px","padding-bottom":"0px"});
    	  $(" .top .top-left").css({"height":"35px","width":"335px","line-height":"35px"});
    	  $(" .top .top-right").css({"height":"35px","width":"250px","line-height":"35px"});
    	  $(".content").css({"height":"400px","width":"1360px"});
    	  $(".sui-formm").css({"height":"90%","width":"330px","padding":"165px 60px 0px 60px","margin-left":"11%"});
    	  $(".sui-formm input").css({"width":"55%","height":"25px"});
    	  $(".sui-formm button").css({"width":"72%","height":"25px","line-height":"15px"});
    	  $(".content .bg-img").css("display","block");
    	  $(".top .top-return").css("display","block");
    	 
      }else{
    	  $("#loginModal").css("left","62.3%");
    	  $(".top").css({"height":"100%","padding-top":"10px","padding-bottom":"10px"});
    	  $(" .top .top-left").css({"height":"150%","width":"35%","line-height":"150%"});
    	  $(" .top .top-right").css({"height":"150%","width":"55%","line-height":"150%"});
    	  $(".content").css({"height":"100%","width":"100%"});
    	  $(".sui-formm").css({"height":"100%","width":"58%","padding":"60px 60px 45px 60px","margin-left":"4%"});
    	  $(".sui-formm input").css({"width":"80%","height":"25px"});
    	  $(".sui-formm button").css("width","106%");
    	  $(".content .bg-img").css("display","none");
    	  $(".top .top-return").css("display","none");
      }

	}
	
   	  $(window).resize(function() {
    	adaptiveDisplay();
	 });
   	  
});
/*屏幕适应B*/

 //返回主页B
 $(document).on("click",".top-return",function(){
	 window.open("${APP_PATH}/View/index","_self");
 })
 //返回主页E

</script>
</html>