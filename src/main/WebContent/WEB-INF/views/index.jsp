<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath());
  pageContext.setAttribute("UserId",request.getSession().getAttribute("UserId"));
  pageContext.setAttribute("UserName",request.getSession().getAttribute("UserName"));
  pageContext.setAttribute("UserPassword",request.getSession().getAttribute("UserPassword"));
  pageContext.setAttribute("UserType",request.getSession().getAttribute("UserType"));
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>主页</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css"> 
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/sui.min.css">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/index.css">
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/js/sui.min.js"></script>  
    <script type="text/javascript" src="${APP_PATH}/static/js/index.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>
</head>
<body>

    <!-- 顶部B -->
    <div class="sui-row-fluid slides">
       <!-- 登录栏B -->
	   <div class="sui-row-fluid top">
	       <div class="top-Answer-que fr">在线考试</div>
	       <div class="top-regist fr">注册</div>
	       <div class="top-login fr" id="top-login">登录</div>
       </div>
       <!-- 登录栏E -->
      
       <!-- 轮播图B -->
        <div class="slides-content">
            <div class="slides-title"></div>
            <div class="slides-img" id="slides-img">
               <ul>
                   <li><img alt="" src="${APP_PATH}/static/images/index/slide-img1.png">1</li>
                   <li><img alt="" src="${APP_PATH}/static/images/index/slide-img2.png">2</li>
                   <li><img alt="" src="${APP_PATH}/static/images/index/slide-img3.png">3</li>                
               </ul>
            </div>
        </div>
        <!-- 轮播图E -->
        
        <div class="mid-title"></div>
    </div>
    <!-- 顶部E-->
    
    <!-- 内容B -->
    <div class="sui-row-fluid">
        <div class="middle">
            <div class="mid-content">
                <div class="mid-con-nav">当前位置：首页</div>
                <div class="mid-con-content">          
                </div>
            </div>
        </div>
    </div>
    <!-- 内容E -->
    
    <!-- 底部B -->
    <div class="sui-row-fluid" style="margin: 0 auto;">
       <div class="bottom-top">
           <div class="row">
              <span class="sui-dropdown"> 
                <span class="dropdown-inner">
	               <a class="dropdown-toggle" style="border: 1px solid #666666;color: #666666" role="button" href="#" data-toggle="dropdown" >--国家党史部门网站-- </a>
                   <ul class="sui-dropdown-menu" role="menu" aria-labelledby="drop1">
                      <li role="presentation"><a tabindex="-1" role="menuitem" href="http://dsyj.qingdao.gov.cn/">红色轨迹党史网</a></li>
                      <li role="presentation"><a tabindex="-1" role="menuitem" href="http://www.zgdsw.org.cn/GB/349944/index.html">中共产党历史网</a></li>
                      <li role="presentation"><a tabindex="-1" role="menuitem" href="https://www.wxyjs.org.cn/"> 中共中央文献研究室</a></li>
                   </ul>
                </span>
             </span>
             <span class="sui-dropdown">
                <span class="dropdown-inner">
	               <a class="dropdown-toggle" style="border: 1px solid #666666;color: #666666" role="button" href="#" data-toggle="dropdown">--部分省市区党史部门网站--</a>
                   <ul class="sui-dropdown-menu" role="menu" aria-labelledby="drop1">
                      <li role="presentation"><a tabindex="-1" role="menuitem" href="http://www.bnxcw.com">湖南党史网</a></li>
                      <li role="presentation"><a tabindex="-1" role="menuitem" href="http://www.gddsw.com.cn">广东党史网</a></li>
                      <li role="presentation"><a tabindex="-1" role="menuitem" href="http://www.hnszw.org.cn">海南党史网</a></li>
                      <li role="presentation"><a tabindex="-1" role="menuitem" href="http://www.gxdsw.cn">广西党史网</a></li>
                      <li role="presentation"><a tabindex="-1" role="menuitem" href="http://www.xjkunlun.cn/dswx">新疆党史网</a></li>
                      <li role="presentation"><a tabindex="-1" role="menuitem" href="http://www.hndsw.com.cn">河南党史网</a></li>
                   </ul>
                </span>
             </span>
             <span class="sui-dropdown">
                <span class="dropdown-inner">
	               <a class="dropdown-toggle" style="border: 1px solid #666666;color: #666666" role="button" href="#" data-toggle="dropdown">--省内党史部门网站-- </a>
                   <ul class="sui-dropdown-menu" role="menu" aria-labelledby="drop1">
                      <li role="presentation"><a tabindex="-1" role="menuitem" href="http://www.gzgov.gov.cn">贵州省人民政府</a></li>
                      <li role="presentation"><a tabindex="-1" role="menuitem" href="http://www.dsyj.gov.cn">贵州省委党史研究室</a></li>              
                   </ul>
                </span>
             </span>
             <span class="sui-dropdown">
                <span class="dropdown-inner">
	               <a class="dropdown-toggle" style="border: 1px solid #666666;color: #666666" role="button" href="#" data-toggle="dropdown">--校内链接-- </a>
                   <ul class="sui-dropdown-menu" role="menu" aria-labelledby="drop1">
                      <li role="presentation"><a tabindex="-1" role="menuitem" href="http://www.gzmu.edu.cn">贵州民族大学网站</a></li>
                      <li role="presentation"><a tabindex="-1" role="menuitem" href="http://dw.gzmu.edu.cn">贵州民族大学党委办公室</a></li>
                      <li role="presentation"><a tabindex="-1" role="menuitem" href="http://mksxy.gzmu.edu.cn">贵州民族大学马克思主义学院</a></li>
                   </ul>
                </span>
             </span>
          </div>  
       </div>
       <div class="bottom-bot sui-row-fluid">
            <div class="bottom-bot-left">
                <ul>
                   <li>地址：贵州民族大学</li>
                   <li>邮编：553000</li>
                </ul>
            </div> 
            <div class="bottom-bot-right">
                <ul>
                   <li>总访问人次： 01204513</li>
                   <li>今日访问人次： 00003</li>
                </ul>
            </div>                       
       </div>
    </div>
    <!-- 底部E -->
    
     
    <!--登录弹出框B -->
    <div tabindex="-1" class="sui-modal hide fade" style="width: 351px;border: 1px" id="loginModal" role="dialog" data-hasfoot="false"  data-backdrop="static">
    <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="border-bottom:0">
        <button class="sui-close" aria-hidden="true" type="button" data-dismiss="modal"></button>
        <h4 class="modal-title" style=" margin-top: 20px; text-align: center;font-size: 20px;font-weight: normal;" id="myModalLabel">登录</h4>
      </div>
      <div class="modal-body">
          <form class="sui-form form-horizontal" id="form5" novalidate="novalidate">
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
                     <button id="loginButton" style="margin-left: 96px;margin-top: 15px;" class="sui-btn btn-danger" type="submit">登录</button>
                 </div>
                 <div class="controls">
                     <button id="closeButton" style="margin-left: 30px;margin-top: 15px;" class="sui-btn btn-danger" type="button" data-dismiss="modal">关闭</button>             
                 </div>
             </div>
          </form>
      </div>
    </div>
   </div>
   </div>
    <!--登录弹出框E -->
</body>
<script type="text/javascript">
//ready开始
$(document).ready(function(){
	var userType='${UserType}';
	if(userType!=""){
		if(userType==1){
		   $(".top-login").text('${UserName}');
		   $(".top-regist").text('退出');
	    }
		else if(userType==1){
			$(".top-regist").text('注册');
			$("#top-login").text('登录');
		}
	}else{
		$(".top-regist").text('注册');
		$("#top-login").text('登录');
	}
	
	 
	
});//ready结束


//考试跳转B
$(document).on('click','.top-Answer-que',function(){
	var userType='${UserType}';
	if(userType==1){
		window.open('${APP_PATH}/View/examination','_self');
	}else{
		layer.alert("请先登录！");
	}
	
});
//考试跳转E

//登录B
 $("#form5").validate({
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
				layer.close(load);
				if(data.code==200){			
					if(data.extend.userType==1){
					   $('#loginModal').modal('hide');
						layer.confirm('登录成功！', {
							  btn: ['确定'] 					  
							}, function(index, layero){
								location.reload();
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
  })
  //登录E
  
//注册-退出B
$(document).on('click','.top-regist',function(){	
    if($(".top-regist").text()=="注册"){
	    window.open('${APP_PATH}/View/userRegist','_self');
	}else{
		layer.confirm('退出登录将不能访问资源，是否要退出登录？', {
			  btn: ['确定','取消'] 					  
			},function(index, layero){
				var userId='${UserId}';
				$.ajax({
					url:'${APP_PATH}/Customer/exitCustomer',       //传到控制器controller
					type:'post',
					success:function(data){
						if(data.code==200){
						   location.reload();		
						}
						else{
							layer.alert("退出失败！");
						}
					}
				});
			},function(index, layero){
				layer.close(index);
			}
			);
	}
	
});
//注册-退出E
</script>
</html>