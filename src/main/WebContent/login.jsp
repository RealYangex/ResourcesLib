<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath());%>
<html><head>
<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="renderer" content="webkit"/>
<title>请登录--问卷调查管理系统</title> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>

<link href="${APP_PATH}/static/css/AdminLogin.css" rel="stylesheet" type="text/css" />
</head>

<body>
   <div class="login">
    <div class="message">管理登录</div>
    <div id="darkbannerwrap"></div>
    
    <form method="post">
		<input name="action" value="login" type="hidden"/>
		<input name="username" id="name" placeholder="用户名" required="" type="text"/>
		<hr class="hr15"/>
		<input name="password" id="specifications" placeholder="密码" required="" type="password"/>
		<hr class="hr15"/>
		<input name="vetfcode" id="code" placeholder="验证码" required="" type="text" style="width:50%;float:left;"/>
		<img class="changeImage" id="imgCode" src="${APP_PATH}/View/imageCode"   style="width:100px;height:42px;margin-top:1px;margin-left:10px;"/><a herf="#" class="changeImage" style="float:right; margin-left:5px;margin-top:15px;">看不清？</a>
		<hr class="hr15"/>
		<input value="登录" id="login" style="width:100%;" type="button"/>
		<hr class="hr20"/>
	</form>

</div>
</body>
<script type="text/javascript">
		//判断浏览器版本
		function getVendorPrefix() {
		// 使用body是为了避免在还需要传入元素
		var body = document.body || document.documentElement,
		    style = body.style,
		    vendor = ['webkit', 'khtml', 'moz', 'ms', 'o'],
		    i = 0;
		
		while (i < vendor.length) {
		    // 此处进行判断是否有对应的内核前缀
		    if (typeof style[vendor[i] + 'Transition'] === 'string') {
		        return vendor[i];
		    }
		    i++;
		    }
		}
		if(typeof(getVendorPrefix())=="undefined"){
			alert("您的浏览器内核版本过低，请更换其他浏览器，如果使用的是多核浏览器，如360 请更换至 【极速模式】");
		}
		$(function(){
			
			//验证码改变事件
			$(".changeImage").click(function(){
				
				changeImageSrc();
			});
			function changeImageSrc(){
				$("#imgCode").attr('src',"${APP_PATH}/View/imageCode?"+Math.random());
			}
			//立即登录按钮点击事件
			$("#login").click(function(){
				var name = $("#name").val();
				var pass = $("#specifications").val();
				var code = $("#code").val();
				
				if(name==""||pass==""||code==""){
					layer.alert("必填信息不能为空");
					return;
				}
				
				var load = layer.msg("正在登录,请稍后!",{icon:16,shade:0.06,time:38*1000});					//提示
				$.ajax({
					url:'${APP_PATH}/AdmLogin/login',
					data:{"name":name,"pass":pass,"codE":code},
					type:'post',
					success:function(result){
						if(result.code==200){                         
							window.location.href="${APP_PATH}/View/adminIndex";
							window.event.returnValue=false;  
						}else if(result.code==300){
							layer.alert("验证码输入有误");
							//更改验证码
							changeImageSrc();
						}else{
							layer.alert("用户名或密码错误");
							//更改验证码
							changeImageSrc();
						}
					},error:function(result){
						layer.alert("系统出错 请联系管理员");
					}
				})
			})
			
		})
</script>
</html>