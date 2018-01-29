<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page buffer="16kb"%>
    <% request.setAttribute("APP_PATH", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/layui.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/adminIndex.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/adminResource.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/iconfont.css" />
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/fileUpload.css" />
  
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/echarts.common.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/adminResource.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/fileUpload.js"></script>
  
  <style>
  	.red{
  		background-color: pink;
  	}
  	.filename{
	    text-overflow: ellipsis;
	    width: 140px;
  	}
  	.fileType{
  		top:85px;
  	}
  	.progress{
  		margin-top:12px;
  		margin-bottom:0px;
  		
  	}
  	
  </style>
</head>
<body class="adminResource">
	<!-- 头部Begin -->
	<jsp:include page="./adminHeader.jsp"  flush="true"/>
	<!-- 头部END -->
	
	<!-- contentBegin -->
	<div class="content">
		<div class="real-content">
			<!-- 左侧导航栏Begin -->
			<%@include file="./adminLeftMenu.jsp" %>
			<!-- 左侧导航栏END -->
			
			<!-- 右侧内容展示 样式自定义 不用之前的样式 -->
			<div class="spanr fr" id="span2" style="padding-left:30px;height:1000px;width:900px;position: relative;">
				<!-- 左侧菜单B -->
				<div class="left-menu">
				    <div class="left-menu-top">
				       <span class="fileAll">全部文件</span>
				    </div>
				    <ul>
				        <li class="fileTypeBtn" type="4">图片</li>
				        <li class="fileTypeBtn" type="3">文档</li>
				        <li class="fileTypeBtn" type="2">视频</li>
				        <li class="fileTypeBtn" type="1">音频</li>
				        <li class="fileTypeBtn" type="5">其它</li>
				    </ul>
				</div>
				<!-- 左侧菜单E -->
				
				<!-- 右边内容B -->
				<div class="right-content">
				    <!-- 顶部B -->
				    <ul  class="right-top">
				        <li class="fl li-one">
				            <button style="width: 85px" id="drop-button" class="layui-btn layui-btn-sm layui-btn-normal changeBtn">上传</button>
				        </li>

				        <li class="fl li-two"><button style="width: 85px" class="layui-btn layui-btn-sm layui-btn-normal changeBtn" id="newFolder">新建文件夹</button></li>
				        <li class="fr li-three">
				            <input id="searchIpt" style="height: 30px;width: 135px; margin-top: 5px;padding-right: 25px;" type="text" name="title" placeholder="搜索您的文件" class="layui-input">
				            <span  id="searchBtn"></span>
				        </li>

				    </ul>
				    <!-- 顶部E -->
				    
				    <!-- 文件路径导航B -->
				    <ul class="path-nav">
				       <li class="li-one li-z" id="lastLevel" style="display:none;">返回上一级</li>
				       <div id="filePath">
				       		<li class="li-z path-sign" style="margin-left:3px;">全部文件</li>
				       		<li class="li-z path-sign">工具资源</li>
				       </div>
				    </ul>
				    <!-- 文件路径导航E -->
				    
				    <!-- 表格B -->
				    <div class="table-container" style="height:620px;overflow-y:auto;">
				    
				    <table class="layui-table table" lay-skin="line" id="fileTable" currentParentId="1" >
                       <thead>
                           <tr>
                              <th width="50%">文件名</th>
                              <th width="20%">类型</th>
                              <th width="10%" style="text-align:center">修改日期</th>
                              <th width="20%" style="text-align:center">操 作</th>
                           </tr> 
                       </thead>
                       <tbody style="width:100%; height:300px;overflow-y:scroll;">
                      </tbody>
                    </table>
                    </div>
                    <!-- 表格E -->
				</div>
				<!-- 右边内容E -->
			</div>
			<!-- 右侧内容End -->
		</div>
	</div>
	<!-- content END -->
	
	<!-- footerBegin -->
	<jsp:include page="./adminFooter.jsp" flush="true"/>
	<!-- footerEnd -->
<script type="text/javascript" src="${APP_PATH}/static/js/jquery.mousewheel.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/showImage.js"></script>	
<script type="text/javascript">

  
  //上传文件B
  $(document).on('click','#drop-button',function(){
	  //console.log(33);
  });

  $(document).on('click','#upLoading-file',function(){
	  //console.log(11);
  });
  $(document).on('click','#upLoading-folder',function(){
	  //console.log(22);
  });

//上传文件E
  $(document).ready(function(){
	  var lastParent = -1;
	  var fileLifo = new Array();
	  var filePathLifo = new Array();
	  filePathLifo.push("全部文件");
	  //var parentId = $("#fileTable").attr("currentParentId");
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
				  console.log(data);
				  setTimeout(function(){layer.close(load)}, 500);
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
						  tr.append('<td><a class="openFile"><i class="'+icon+'"></i>'+item.name+'</a><i2 style="display:inline-block;width:16px;height:16px;"><i3 style="display:none;color:#1E9FFF;" class="fa fa-download download"></i3></i2></td>');
						  tr.append('<td>'+showType+'</td>');
						  tr.append('<td>'+showDate+'</td>');
						  tr.append('<td><button class="btn btn-xs btn-info rename" style="display:none;"><span class="fa fa-edit"></span> 重命名</button>&nbsp;&nbsp;<button class="btn btn-xs btn-danger delete"><span class="fa fa-trash"></span> 删 除</button></td>');
						  $("#fileTable tbody").append(tr);
					  })
				  }
			  },
			  error:function(data){
				  console.log(data);
			  }
		  })
	  }
	  
	 //上传部分代码 Begin
	 var uploadPage = '<div id="fileUploadContent" class="fileUploadContent" style="padding:8px 10px;"></div><div><button class="btn btn-sm btn-info " style="padding:6px 18px;float:right;margin:26px 60px 0 10px;" id="cancel">取 消</button><button class="btn btn-sm btn-info uploadFileBtn" style="padding:6px 12px;float:right;margin:26px 10px 0 10px;"><span class="fa fa-upload"></span> 上 传</button></div>';
	 //上传按钮点击事件
	 $("#drop-button").click(function(){
		 var page = layer.open({
			  type: 1 
			  ,area: ['900px', '600px']
			  ,title: '上传文件'
			  ,shade: 0.6 
			  ,maxmin: false 
			  ,anim: 5
			  ,content: uploadPage
			}); 
		 //显示内容
		 $("#fileUploadContent").initUpload({
		        "uploadUrl":"${APP_PATH}/Resources/uploadFile",//上传文件信息地址
		        //"progressUrl":"#",//获取进度信息地址，可选，注意需要返回的data格式如下（{bytesRead: 102516060, contentLength: 102516060, items: 1, percent: 100, startTime: 1489223136317, useTime: 2767}）
		        "selfUploadBtId":"selfUploadBt",//自定义文件上传按钮id
		        "isHiddenUploadBt":false,//是否隐藏上传按钮
		        "isHiddenCleanBt":false,//是否隐藏清除按钮
		        "isAutoClean":true,//是否上传完成后自动清除
		        "velocity":10,//模拟进度上传数据
		        //"rememberUpload":true,//记住文件上传
		       // "showFileItemProgress":false,
		        //"showSummerProgress":false,//总进度条，默认限制
		        //"scheduleStandard":true,//模拟进度的方式，设置为true是按总进度，用于控制上传时间，如果设置为false,按照文件数据的总量,默认为false
		        //"size":350,//文件大小限制，单位kb,默认不限制
		        //"maxFileNumber":3,//文件个数限制，为整数
		        //"filelSavePath":"",//文件上传地址，后台设置的根目录
		        "beforeUpload":beforeUploadFun,//在上传前执行的函数
		        "onUpload":onUploadFun,//在上传后执行的函数
		         //autoCommit:true,//文件是否自动上传
		        "fileType":['png','jpg','docx','doc','mp4','mp3','wma','flv','qsv','qlv','kux','mts','mp4','bmp','txt','pdf','rtf','ppt','xls','pptx','xlsx','jpeg','3gp','mpeg','m4a','bhd','lrc']
		        //文件类型限制，默认不限制，注意写的是文件后缀

		    });
		 	var Upload
		 	function beforeUploadFun(opt){
		 		Upload = layer.msg("正在上传,请稍后!",{icon:16,shade:0.05,time:58*1000});
		        opt.otherData =[{"name":"parentId","value":parentId}];
		    }
		    function onUploadFun(opt,data){
		    	
		    	if(data.code==200){
		    		layer.close(Upload);
		        	layer.confirm("上传完成,是否继续上传文件?",{btn:["继续上传","取消"]},function(index){
		        		layer.close(index);
		        	},function(index){
		        		layer.close(index);
		        		layer.close(page);
		        	});
		        																//先清除当前栈中已经存在的页面id
		        	fileLifo.pop();
		        	getFiles(parentId,1);
		    	}else if(data.code==300){
		    		layer.close(Upload);
		        	layer.confirm(data.message,{btn:["继续上传","取消"]},function(index){
		        		layer.close(index);
		        	},function(index){
		        		layer.close(index);
		        		layer.close(page);
		        	});
		        	getFiles(parentId,1);
		    	}else{
		    		layer.alert("上传失败 请检查!");
		    	}
		        uploadTools.uploadError(opt);//显示上传错误
		    }
		    function testUpload(){
		        var opt = uploadTools.getOpt("fileUploadContent");
		        uploadEvent.uploadFileEvent(opt);
		    }
		    function tt() {
		        var opt = uploadTools.getOpt("fileUploadContent");
		        uploadTools.uploadError(opt);//显示上传错误
		    }
		    
		    $(document).on("click","#cancel",function(){
		    	layer.close(page);
		    })
	 })
	 //上传代码 End
	 var newfolder;
	 //新建文件夹
	 $("#newFolder").click(function(){
		  newfolder = layer.open({
						  type: 1 
						  ,area: ['380px', '200px']
						  ,title: '新建文件夹 输入名字'
						  ,shade: 0.2
						  ,anim: 5 
						  ,content: '<div style="padding:50px;"><input value="新建文件夹" class="form-control"/ id="folderName"><button class="btn btn-primary btn-xs" style="margin-top:28px;float:right;" id="createCancel"> 取 消 </button><button class="btn btn-info btn-xs" style="margin-top:28px;float:right;margin-right:16px;" id="createOk"> 确 定 </button></div>'
						}); 
		$("#folderName").select(); 
	 })
	 //新建文件夹 确定按钮点击事件
	 $(document).on('click',"#createOk",function(){
		 var folderName = $("#folderName").val();
		 $.ajax({
			 url:'${APP_PATH}/Resources/mkdir',
			 data:'parentId='+parentId+"&name="+folderName,
			 type:'post',
			 success:function(data){
				 if(data.code==200){
					 														//刷新页面前 先清除当前栈中存在的页面
					 fileLifo.pop();
					 getFiles(parentId);
					 layer.close(newfolder)
				 }else if(data.code==300){
					 layer.alert("当前该文件夹已经存在");
				 }
			 },
			 error:function(data){
				 
			 }
		 })
	 })
	 
	 //新建文件夹 取消按钮点击事件
	 $(document).on('click',"#createCancel",function(){
		 layer.close(newfolder);
	 })
	 
	 //鼠标悬浮Begin
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
	 //鼠标悬浮End
	 
	 //下载按钮点击事件
	 $(document).on("click",".download",function(){
	 	var id =$(this).parents("tr").attr("fileid");
	 	var form = $("<form action='${APP_PATH}/Resources/download' method='post' style='display:none'></from>");
		   $("<input name='id' value='"+id+"'>").appendTo(form);
		   $(document.body).append(form);
		   form.submit();
	 })
	 
	 //文件点击事件
	 $(document).on("click",".openFile",function(){
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
	 		}else if(suffix.toLowerCase()==".mp4".toLowerCase()){
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
	 			window.open("${APP_PATH}/"+localtion);
	 		}
	 		
	 	}else if(type==3){								//文档
	 													//pdf
	 		if(suffix.toLowerCase()==".pdf".toLowerCase()){
	 			window.open("${APP_PATH}/"+localtion);
	 		}else if(suffix.toLowerCase()==".rtf"||suffix.toLowerCase()==".ppt"||suffix.toLowerCase()==".pptx"||suffix.toLowerCase()==".txt"||suffix.toLowerCase()==".doc"||suffix.toLowerCase()==".docx"||suffix.toLowerCase()==".xls"||suffix.toLowerCase()==".xlsx"){
	 																										//支持预览的文档
	 			window.open("http://dcsapi.com?k=282939901&url=http://118.24.28.134/ResourceLib/"+localtion);
	 		}else{	
	 																										//不支持预览 交给浏览器
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
	 
	 //删除按钮点击事件
	 $(document).on("click",".delete",function(){
		 var name = $(this).parents("tr").find("td:eq(0)").text();
		 var fileType = $(this).parents("tr").attr("filetype");
		 var id = $(this).parents("tr").attr("fileid");
		 var message = "";
		 if(fileType!=0){
			 message = "是否删除【"+name+"】文件，并且不可以恢复？";
		 }else{
			 message = "是否删除【"+name+"】文件件和该文件夹下的所有文件，并且不可以恢复？";
		 }
		 layer.confirm(message,{btn:["确定","取消"]},function(index){
			 var loadDelete = layer.msg("正在删除,请稍后!",{icon:16,shade:0.05,time:58*1000});
			 $.ajax({
				 url:'${APP_PATH}/Resources/deleteFile',
				 data:'id='+id+"&type="+fileType+"&parentId="+parentId,
				 type:'post',
				 success:function(data){
					 layer.close(loadDelete);
					 if(data.code==200){
						 fileLifo.pop();
						 getFiles(parentId);
						 layer.close(index)
					 }
				 },
				 error:function(data){
					 
				 }
			 })
		 },function(index){
			 layer.close(index)
		 })
	 })
	 
	 /*
	 //重名名按钮点击事件
	 var rename;
	 $(document).on("click",".rename",function(){
		 var name = $(this).parents("tr").find("td:eq(0)").text();
		 var id = $(this).parents("tr").attr("fileid");
		 rename = layer.open({
			  type: 1 
			  ,area: ['380px', '200px']
			  ,title: '输入新的名字'
			  ,shade: 0.2
			  ,anim: 5 
			  ,content: '<div style="padding:50px;"><input value="'+name+'" class="form-control"/ id="newName"><button class="btn btn-primary btn-xs" style="margin-top:28px;float:right;" id="renameCancel"> 取 消 </button><button class="btn btn-info btn-xs" style="margin-top:28px;float:right;margin-right:16px;" id="renameOk" rid='+id+' oldname="'+name+'"> 确 定 </button></div>'
			}); 
		$("#newName").select(); 
	 })
	 
	 //重命名 取消按钮点击事件
	 $(document).on('click',"#renameCancel",function(){
		 layer.close(rename);
	 })
	 
	 //重命名 确定按钮点击事件
	 $(document).on('click',"#renameOk",function(){
		 var newNameStr = $("#newName").val();
		 var fileType = $(this).parents("tr").attr("filetype");
		 var id = $(this).attr("rid");
		 var oldname = $(this).attr("oldname");
		 																	//名字没有更改
		 if(newNameStr==oldname){
			 return;
		 }
		 $.ajax({
			 url:'${APP_PATH}/Resources/rename',
			 data:'parentId='+parentId+"&newname="+newNameStr+"&id="+id+"&oldname="+oldname+"&fileType="+fileType,
			 type:'post',
			 success:function(data){
				 if(data.code==200){
					 														//刷新页面前 先清除当前栈中存在的页面
					 fileLifo.pop();
					 getFiles(parentId);
					 layer.close(rename)
				 }else if(data.code==300){
					 layer.alert("当前该文件名已经存在");
				 }
			 },
			 error:function(data){
				 
			 }
		 })
	 })
	 
	 */
	 //上传按钮点击事件
	 $(document).on("click",".uploadFileBtn",function(){
		 $(".uploadFileBt").trigger("click");
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
				  setTimeout(function(){layer.close(load)}, 500)
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
						  tr.append('<td><a class="openFile"><i class="'+icon+'"></i>'+item.name+'</a><i2 style="display:inline-block;width:16px;height:16px;"><i3 style="display:none;color:#1E9FFF;" class="fa fa-download download"></i3></i2></td>');
						  tr.append('<td>'+showType+'</td>');
						  tr.append('<td>'+showDate+'</td>');
						  tr.append('<td><button class="btn btn-xs btn-info rename" style="display:none;"><span class="fa fa-edit"></span> 重命名</button>&nbsp;&nbsp;<button class="btn btn-xs btn-danger delete"><span class="fa fa-trash"></span> 删 除</button></td>');
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
				  setTimeout(function(){layer.close(load)}, 500);
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
						  tr.append('<td><a class="openFile"><i class="'+icon+'"></i>'+item.name+'</a><i2 style="display:inline-block;width:16px;height:16px;"><i3 style="display:none;color:#1E9FFF;" class="fa fa-download download"></i3></i2></td>');
						  tr.append('<td>'+showType+'</td>');
						  tr.append('<td>'+showDate+'</td>');
						  tr.append('<td><button class="btn btn-xs btn-info rename" style="display:none;"><span class="fa fa-edit"></span> 重命名</button>&nbsp;&nbsp;<button class="btn btn-xs btn-danger delete"><span class="fa fa-trash"></span> 删 除</button></td>');
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
</body>
</html>