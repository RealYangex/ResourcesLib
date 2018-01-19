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
     <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/index.css">
     <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/font-awesome.min.css">
     <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/iconfont.css">
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/js/sui.min.js"></script>  
    <script type="text/javascript" src="${APP_PATH}/static/js/index.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>
    
    <style type="text/css">

    </style>
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
              <div class="mid-con-content">   
                     <!-- 右边内容B -->
				<div class="right-content">
				    <!-- 文件路径导航B -->
				    <ul class="path-nav">
				       <li class="li-one li-z" id="lastLevel" style="display:none;">返回上一级</li>
				       <div id="filePath" style="margin-top: 6px;">
				       		<li class="li-z path-sign" style="margin-left:3px;">全部文件</li>
				       		<li class="li-z path-sign">工具资源</li>
				       </div>
				       <li class="fr li-three">
				            <input id="searchIpt" style="height: 30px;width: 135px;padding-right: 25px;" type="text" name="title" placeholder="搜索文件" class="layui-input">
				            <span  id="searchBtn"></span>
				       </li>
				    </ul>
				    <!-- 文件路径导航E -->
				    
				    <!-- 表格B -->
				    <div class="out-table-container" style="height:362px;overflow:hidden;width:100.2%; border-right: 1px solid #EEEEEE;">
				    <div class="table-container" style="height:362px;width:102%; overflow-y:auto;">
				    <table class="layui-table table" lay-skin="line" id="fileTable" currentParentId="1" style="margin-top: 0px;margin-bottom: 0px;">
                       <thead>
                           <tr>
                              <th width="50%">文件名</th>
                              <th width="20%">类型</th>
                              <th width="10%" style="text-align:center">日期</th>
                           </tr> 
                       </thead>
                       <tbody style="width:100%; height:300px;overflow-y:scroll;">
                      </tbody>
                    </table>
                    </div>
                    </div>
                    <!-- 表格E -->
				</div>
				<!-- 右边内容E -->       
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
<script type="text/javascript">
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
	  
	  
	  var lastParent = -1;
	  var fileLifo = new Array();
	  var filePathLifo = new Array();
	  filePathLifo.push("全部文件");
	  var parentId = 1;
	  getFiles(parentId);
	  														//创建文件路径
	  createFilePath();
	  //根据id 获取当前文件下所有的文件
	  function getFiles(id,type){
		  fileLifo.push(id);
		  parentId = id;
		  //判断是否需要显示上一级
		  if(fileLifo.length!=1){
			  $("#lastLevel").css("display","inline");
		  }else{
			  $("#lastLevel").css("display","none");
		  }
		  if(typeof(type)=="undefined"){
		  	var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:58*1000});
		  }
		  $.ajax({
			  url:'${APP_PATH}/Resources/getFiles',
			  data:"parentId="+id,
			  type:'post',
			  success:function(data){
				  layer.close(load);
				  if(data.code==200){
					  var resources = data.extend.resources;
					  
					  //清空表格
					  $("#fileTable tbody").empty();
					  if(resources==null) return;
					  $.each(resources,function(index,item){
						  var tr = $("<tr></tr>").attr('fileType',item.resResourcesType).attr('childrenId',item.childrensId).attr('fileId',item.id).attr('localtion',item.localtion);
						  var timestamp = item.createTime;
						  var newDate = new Date();
						  newDate.setTime(timestamp);
						  var showDate = newDate.toLocaleString();
						  var showType = "";
						  var icon = "fa fa-";
						  switch(item.resResourcesType){
						  	case 0: showType='文件夹'; icon+="folder-open yellow"; break;
						  	case 1: showType='音频文件';icon+="file-audio-o"; break;
						  	case 2: showType='视频文件';icon+="file-movie-o"; break;
						  	case 3: showType='文档文件';icon+="file-word-o"; break;
						  	case 4: showType='图片文件';icon+="file-photo-o"; break;
						  	case 5: showType='其他文件';icon+="file-zip-o"; break;
						  }
						  tr.append('<td><a class="open"><i class="'+icon+'"></i>'+item.name+'</a><i2 style="display:inline-block;width:16px;height:16px;"><i3 style="display:none;color:#1E9FFF;" class="fa fa-download download"></i3></i2></td>');
						  tr.append('<td>'+showType+'</td>');
						  tr.append('<td>'+showDate+'</td>');
		
						  $("#fileTable tbody").append(tr);
					  })
				  }
			  },
			  error:function(data){
				  console.log(data);
			  }
		  })
	  }
	  
	 //鼠标悬浮
	 $(document).on("mouseover","tr",function(){
		 if($(this).attr("filetype")!=0){
		 	$(this).find("i3").css("display","inline-block");
		 }
	 })
	 $(document).on("mouseout","tr",function(){
		 if($(this).attr("filetype")!=0){
		 	$(this).find("i3").css("display","none");
		 }
	 })
	 
	 //下载按钮点击事件
	 $(document).on("click",".download",function(){
	 	var id =$(this).parents("tr").attr("fileid");
	 	var form = $("<form action='${APP_PATH}/Resources/download' method='post' style='display:none'></from>");
		   $("<input name='id' value='"+id+"'>").appendTo(form);
		   $(document.body).append(form);
		   form.submit();
	 })
	 
	 //文件点击事件
	 $(document).on("click",".open",function(){
	 	var id = $(this).parents("tr").attr("fileid");
	 	var type = $(this).parents("tr").attr("filetype");
	 	var localtion = $(this).parents("tr").attr("localtion");
	 	var name = $(this).parents("tr").find("td:eq(0)").text();
	 	var index = name.lastIndexOf(".");
	 	var suffix = name.substring(index,name.length);
	 	
	 	if(type==0){									
	 													//设置导航条内容
	 		filePathLifo.push($(this).text());
	 													//获取当前文件夹的 的所有文件
	 		getFiles(id);
														//创建文件路径
	 		createFilePath();
	 	}else if(type==1){	
	 													//音频
	 		if(suffix==".wma"){							//不可以播放的音频
	 			layer.open({
	 			      type: 2,
	 			      title: '音频播放',
	 			      shadeClose: true,
	 			      shade: false,
	 			      btn:["取消"],
	 			      area: ['380px', '200px'],
	 			      content: "${APP_PATH}/"+localtion
					  //content:'http://localhost:8080/ResourceLib/static/Upload/%E9%9F%B3%E4%B9%90/%E9%82%93%E7%8E%89%E5%8D%8E-%E9%9D%A9%E5%91%BD%E7%86%94%E7%82%89%E7%81%AB%E6%9C%80%E7%BA%A2.wma'
	 			    });
	 		}else if(suffix==".mp3"||suffix==".m4a"){
	 			var player; 
		 		player = layer.open({
					  type: 1 
					  ,area: ['380px', '200px']
					  ,title: '音频播放'
					  ,shade: 0.2
					  ,anim: 5 
		 			  //,content: '<div style="padding:50px;padding-top:30px;"><label style="color:#337AB7">'+name+'</label><embed height="100" width="100" src="${APP_PATH}/'+localtion+'" loop="false"  /></audio><button class="btn btn-primary btn-sm" style="margin-top:38px;float:right;" id="playCancel"> 取 消 </button></div>'
					  ,content: '<div style="padding:50px;padding-top:30px;"><label style="color:#337AB7">'+name+'</label><audio controls="controls" autoplay="true"><source src="${APP_PATH}/'+localtion+'" loop="false" /></audio><button class="btn btn-primary btn-sm" style="margin-top:38px;float:right;" id="playCancel"> 取 消 </button></div>'
					}); 
		 		$(document).on('click',"#playCancel",function(){
		 			layer.close(player);
		 		})
	 		}else{
	 			
	 		}
	 	}else if(type==2){								//视频
	 		var address = localtion;
	 													//flv格式视频
	 		if(suffix.toLowerCase() == ".flv".toLowerCase()){
	 			$.ajax({
	 				url:'${APP_PATH}/Resources/playVideo',
	 				data:'src='+address,
	 				type:'post',
	 				success:function(data){
	 					if(data.code==200){
		 					layer.open({
		 		 			      type: 2,
		 		 			      title: '视频播放  '+name,
		 		 			      shadeClose: true,
		 		 			      shade: false,
		 		 			      btn:["关闭"],
		 		 			      area: ['616px', '516px'],
		 						  content:'${APP_PATH}/playVideoFlv.jsp'
		 		 			});
	 					}
	 				},
	 				error:function(){
	 					
	 				}
	 			})
	 		}else if(suffix==".mp4"){
	 			$.ajax({
	 				url:'${APP_PATH}/Resources/playVideo',
	 				data:'src='+address,
	 				type:'post',
	 				success:function(data){
	 					if(data.code==200){
		 					layer.open({
		 		 			      type: 2,
		 		 			      title: '视频播放  '+name,
		 		 			      shadeClose: true,
		 		 			      shade: false,
		 		 			      btn:["关闭"],
		 		 			      area: ['616px', '516px'],
		 						  content:'${APP_PATH}/playVideoH5.jsp'
		 		 			});
	 					}
	 				},
	 				error:function(){
	 					
	 				}
	 			})
	 																	//wmv格式
	 		}else if(suffix.toLowerCase() == ".wmv".toLowerCase()){
	 			$.ajax({
	 				url:'${APP_PATH}/Resources/playVideo',
	 				data:'src='+address,
	 				type:'post',
	 				success:function(data){
	 					if(data.code==200){
		 					layer.open({
		 		 			      type: 2,
		 		 			      title: '视频播放  '+name,
		 		 			      shadeClose: true,
		 		 			      shade: false,
		 		 			      btn:["关闭"],
		 		 			      area: ['616px', '516px'],
		 						  content:'${APP_PATH}/playVideoWmv.jsp'
		 		 			});
	 					}
	 				},
	 				error:function(){
	 					
	 				}
	 			})
	 		}else{
	 			
	 		}
	 		
	 	}else if(type==3){								//文档
	 													//pdf
	 		if(suffix==".pdf"){
	 			window.open("${APP_PATH}/"+localtion);
	 		}
	 	}else if(type==4){								//图片
	 		showImage("${APP_PATH}/"+localtion);
	 	}else{			
	 													//其他文档直接交给浏览器 实现下载
	 		window.open("${APP_PATH}/"+localtion);
	 	}
	 })
	 
	 //返回上级 按钮点击事件
	 $(document).on("click","#lastLevel",function(){
		 fileLifo.pop();
		 filePathLifo.pop();
		 var lastPage = fileLifo.pop();
		 getFiles(lastPage);
														//创建文件路径
	 	 createFilePath();
	 })
	 
	/**
	 *根据文件栈生成当前的文件导航
	 */
	 function createFilePath(){
		 var path = "";
		 if(fileLifo.length==1){
			 path+='<li class="li-z path-sign fileAll" style="margin-left:12px;" fileId="1" >全部文件</li>';
		 }else{
			 for(var i = 0;i<fileLifo.length;i++){
				 var id = fileLifo[i];
				 var pa = filePathLifo[i];
				 if(i==0){
					 path+='<li class="li-z jump" style="margin-left:12px;"  fileId="1" index="'+i+'">'+pa+'<i class="fa fa-angle-right" style="color:#D1D0D0;font-size:13px;margin-left:5px;"></i></li>';
				 }else{
					 path+='<li class="li-z jump" fileId="'+id+'" index="'+i+'">'+pa+'<i class="fa fa-angle-right" style="color:#D1D0D0;font-size:13px;margin-left:5px;"></i></li>';
				 }
			 }
		 }
		 $("#filePath").empty();
		 $("#filePath").append(path);
	 }
	 
	 //文件路径点击事件
	 $(document).on("click",".jump",function(){
		 var id = $(this).attr("fileId");
		 var index = $(this).attr("index");
		 for(var i =1 ;i<=fileLifo.length-index;i++){
				fileLifo.pop();
				filePathLifo.pop();
			}
		 	fileLifo.pop();
			getFiles(id);
			
			createFilePath();
	 })
	 
	 //搜索按钮点击事件
	 $("#searchBtn").click(function(){
		var searchContent=$("#searchIpt").val();
		if(searchContent==""){
			return;
		}
		var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:58*1000});
		$.ajax({
			  url:'${APP_PATH}/Resources/getFilesByName',
			  data:{"searchContent":searchContent},
			  type:'post',
			  success:function(data){
				  layer.close(load);
				  if(data.code==200){
					  $("#searchIpt").val("");
					  var resources = data.extend.resources;
					  if(resources==null){
						  layer.alert("没有找到您搜索的文件！");
						  return; 
					  }
					  //清空表格
					  $("#fileTable tbody").empty();
					  $.each(resources,function(index,item){
						  var tr = $("<tr></tr>").attr('fileType',item.resResourcesType).attr('childrenId',item.childrensId).attr('fileId',item.id).attr('localtion',item.localtion);
						  var timestamp = item.createTime;
						  var newDate = new Date();
						  newDate.setTime(timestamp);
						  var showDate = newDate.toLocaleString();
						  var showType = "";
						  var icon = "fa fa-";
						  switch(item.resResourcesType){
						  	case 0: showType='文件夹'; icon+="folder-open yellow"; break;
						  	case 1: showType='音频文件';icon+="file-audio-o"; break;
						  	case 2: showType='视频文件';icon+="file-movie-o"; break;
						  	case 3: showType='文档文件';icon+="file-word-o"; break;
						  	case 4: showType='图片文件';icon+="file-photo-o"; break;
						  	case 5: showType='其他文件';icon+="file-zip-o"; break;
						  }
						  tr.append('<td><a class="open"><i class="'+icon+'"></i>'+item.name+'</a><i2 style="display:inline-block;width:16px;height:16px;"><i3 style="display:none;color:#1E9FFF;" class="fa fa-download download"></i3></i2></td>');
						  tr.append('<td>'+showType+'</td>');
						  tr.append('<td>'+showDate+'</td>');
						  $("#fileTable tbody").append(tr);
					  })
				  }
			  },
			  error:function(data){
				  console.log(data);
			  }
		  });
		
																	//清空当前栈
		fileLifo = [];
		filePathLifo = [];
																	//重新生成导航
		filePathLifo.push("全部文件");
		fileLifo.push(1);
																												
		createFilePath();
																	//去除上一级
		$("#lastLevel").css("display","none");
																	//设置上传按钮禁止点击
		$(".changeBtn").attr("disabled","disabled");
		$(".changeBtn").css("cursor","not-allowed");
	 })
	 //文件按钮点击事件B
	 $(".fileTypeBtn").click(function(){
		var type = $(this).attr("type");
		var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:58*1000});
		$.ajax({
			  url:'${APP_PATH}/Resources/getFilesByType',
			  data:"type="+type,
			  type:'post',
			  success:function(data){
				  layer.close(load);
				  if(data.code==200){
					  var resources = data.extend.resources;
					  
					  //清空表格
					  $("#fileTable tbody").empty();
					  if(resources==null) return;
					  $.each(resources,function(index,item){
						  var tr = $("<tr></tr>").attr('fileType',item.resResourcesType).attr('childrenId',item.childrensId).attr('fileId',item.id).attr('localtion',item.localtion);
						  var timestamp = item.createTime;
						  var newDate = new Date();
						  newDate.setTime(timestamp);
						  var showDate = newDate.toLocaleString();
						  var showType = "";
						  var icon = "fa fa-";
						  switch(item.resResourcesType){
						  	case 0: showType='文件夹'; icon+="folder-open yellow"; break;
						  	case 1: showType='音频文件';icon+="file-audio-o"; break;
						  	case 2: showType='视频文件';icon+="file-movie-o"; break;
						  	case 3: showType='文档文件';icon+="file-word-o"; break;
						  	case 4: showType='图片文件';icon+="file-photo-o"; break;
						  	case 5: showType='其他文件';icon+="file-zip-o"; break;
						  }
						  tr.append('<td><a class="open"><i class="'+icon+'"></i>'+item.name+'</a><i2 style="display:inline-block;width:16px;height:16px;"><i3 style="display:none;color:#1E9FFF;" class="fa fa-download download"></i3></i2></td>');
						  tr.append('<td>'+showType+'</td>');
						  tr.append('<td>'+showDate+'</td>');
						  $("#fileTable tbody").append(tr);
					  })
				  }
			  },
			  error:function(data){
				  console.log(data);
			  }
		  });
		
																	//清空当前栈
		fileLifo = [];
		filePathLifo = [];
																	//重新生成导航
		filePathLifo.push("全部文件");
		fileLifo.push(1);
																												
		createFilePath();
																	//去除上一级
		$("#lastLevel").css("display","none");
																	//设置上传按钮禁止点击
		$(".changeBtn").attr("disabled","disabled");
		$(".changeBtn").css("cursor","not-allowed");
	 })
	 //文件按钮点击事件E
	 
	 $(document).on("click",".fileAll",function(){
		//清空当前栈
		fileLifo = [];
		filePathLifo = [];
																	//重新生成导航
		filePathLifo.push("全部文件");
		
		getFiles(1);
																	//恢复按钮可用
		$(".changeBtn").removeAttr("disabled");
		$(".changeBtn").css("cursor","pointer");
	 })
  });
</script>
</html>