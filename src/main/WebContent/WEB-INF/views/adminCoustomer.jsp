<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page buffer="16kb"%>
    <% request.setAttribute("APP_PATH", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>会员管理-资源建设平台</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/adminIndex.css">

  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/echarts.common.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>
  <style>
  	#customerTable{
  		text-align:center;
  	}
  	#customerTable thead{
  		background-color: #29B7D3;
  		color:white;
  	}
  	#customerTable thead td{
  		background-color: #29B7D3;
  		color:white;
  	}
  	#customerTable tbody{
  		padding:0 0 0 16px;
  	}
  	#search{
  		cursor:pointer;
  	}
  	#btnAdd{
  		margin-right:20px;
  	}
  	#queryPage .next{
  		margin-right:20px;
  	}
  	#queryPage .fristSpan{
  		padding-left:20px;
  	}
  	#queryPage .jump{
  		font-size:15px;
  		margin-left:6px;
  	}
  	
  </style>
</head>
<body>
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
			<div class="spanr fr" id="span2" style="padding-left:30px;height:600px;width:900px;">
				<div style="width:100%;height:100%;background-color: #FFFFFF">
					<div style="width:100%;height:40px;background-color: #F6F6F6;padding:10px 0 0 20px;">
						<span>所有会员</span>
					</div>
					<div style="width:100%;height:36px;padding:10px 0 0 20px;">
						<div class="form-inline">
						  <div class="form-group">
						    <div class="input-group">
						      <input type="text" class="form-control" id="searchInput" style="width:200px;height:30px;" placeholder="请输入用户名查询"/>
						      <div class="input-group-addon"><span class="fa  fa-search" id="search"></span></div>
						    </div>
						  </div>
						<button class='btn btn-info  fr' id="btnAdd" ><span class="fa  fa-plus-circle" > 添 加</button>
						</div>
					</div>
					<div style="width:100%;height:100%;background-color: #FFFFFF;padding:10px 0 0 0;">
						<table class="table table-striped table-hover" id="customerTable">
							<thead>
								<tr>
									<td style="padding-left:18px;">序 号</td>
									<td>用户名</td>
									<td>真实姓名</td>
									<td>密 码</td>
									<td>邮 箱</td>
									<td>最后访问时间</td>
									<td>操 作</td>
									<td style="display:none"></td>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
						<div id="queryPage">
							<span class="fristSpan"></span>
						</div>
					</div>
				</div>
			</div>
			<!-- 右侧内容End -->
		</div>
	</div>
	<!-- content END -->
	
	<!-- footerBegin -->
	<jsp:include page="./adminFooter.jsp" flush="true"/>
	<!-- footerEnd -->
	

<script type="text/javascript">
    //$(function()开始
	$(function(){
		getAllSupplipes(1);
	})
	//$(function()结束
			
	   //function getAllSupplipes(pn)B
		function getAllSupplipes(pn){
			 $("#customerTable tbody").empty();
			 var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
			$.ajax({
				url:'${APP_PATH}/Customer/getAllCustomer',
				type:"get",
				data:'pn='+pn,
				success:function(data){
					layer.close(load);
					var customer = data.extend.cusList.list;
					var currentPage=parseInt(data.extend.cusList.pageNum);//当前页
					var pageSize=parseInt(data.extend.cusList.pageSize);  //每页数量				
					var i=pageSize*currentPage-(pageSize-1);
					var tb = "";
					$("#customerTable tbody").empty();
					$.each(customer,function(index,item){
						var jurisdiction="";
						var cls="";
						if(item.currentType==1){
							jurisdiction="禁止登录";cls="btn-warning";
						}else if(item.currentType==0){
							jurisdiction="授权登录";cls="btn-primary";
						}
						else{
							jurisdiction="等待授权";cls="btn-default";
						}
						var date="";
                         if(item.lastTime==0||item.lastTime==null){                    
                        	date="未登录过";
                         }
                         else{
                        	 var date=new Date(item.lastTime).toLocaleString();
                         }
						var tr = $("<tr ></tr>");
						tr.append($("<td style='padding-left:18px;'></td>").append(i++));
						tr.append($("<td></td>").append(item.username));
						tr.append($("<td></td>").append(item.realName));
						tr.append($("<td></td>").append(item.password));
						tr.append($("<td></td>").append(item.eamil));
						tr.append($("<td></td>").append(date)); 
						tr.append($("<td></td>").append("<button class='btn btn-info btn-xs edit'><span class='fa fa-pencil'></span>&nbsp;编 辑</button>&nbsp;&nbsp;<button class='btn "+cls+" btn-xs forbidLogin'><span class='fa fa-minus-circle'></span>&nbsp;"+jurisdiction+"</button>&nbsp;&nbsp;<button class='btn btn-danger btn-xs delete'><span class='fa fa-trash'></span>&nbsp;删 除</button>"));
						tr.append($("<td></td>").append(item.id).css("display","none"));				
						tr.appendTo($("#customerTable tbody"));
					});
					// 分页信息显示和导航
					makePageInfo(data);
				},error:function(){
					
				}
			});
		}
		//function getAllSupplipes(pn)E
		
		// showSearchName B
		function  showSearchName(pn,name){
			 $("#customerTable tbody").empty();
			 var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
			$.ajax({
				url:'${APP_PATH}/Customer/getAllCustomer',
				type:"get",
				data:'pn='+pn,
				success:function(data){
					layer.close(load);
					var customer = data.extend.cusList.list;
					var currentPage=parseInt(data.extend.cusList.pageNum);//当前页
					var pageSize=parseInt(data.extend.cusList.pageSize);  //每页数量				
					var i=pageSize*currentPage-(pageSize-1);
					var tb = "";
					$("#customerTable tbody").empty();
					$.each(customer,function(index,item){
						var jurisdiction="";
						var cls="";
						if(item.currentType==1){
							jurisdiction="禁止登录";cls="btn-warning";
						}else{
							jurisdiction="授权登录";cls="btn-primary";
						}

						var date="";
                         if(item.lastTime==0||item.lastTime==null){                    
                        	date="未登录过";
                         }
                         else{
                        	 var date=new Date(item.lastTime).toLocaleString();
                         }
						var tr = $("<tr ></tr>");
						if(item.username==name){$(tr).css("background-color","#B23AEE");}
						tr.append($("<td style='padding-left:18px;'></td>").append(i++));
						tr.append($("<td></td>").append(item.username));
						tr.append($("<td></td>").append(item.realName));
						tr.append($("<td></td>").append(item.password));
						tr.append($("<td></td>").append(item.eamil));
						tr.append($("<td></td>").append(date)); 
						tr.append($("<td></td>").append("<button class='btn btn-info btn-xs edit'><span class='fa fa-pencil'></span>&nbsp;编 辑</button>&nbsp;&nbsp;<button class='btn "+cls+" btn-xs forbidLogin'><span class='fa fa-minus-circle'></span>&nbsp;"+jurisdiction+"</button>&nbsp;&nbsp;<button class='btn btn-danger btn-xs delete'><span class='fa fa-trash'></span>&nbsp;删 除</button>"));
						tr.append($("<td></td>").append(item.id).css("display","none"));				
						tr.appendTo($("#customerTable tbody"));
					});
					// 分页信息显示和导航
					makePageInfo(data);
				},error:function(){
					
				}
			});
		}
		// showSearchName E
		
		var currentPage="";     //当前页
		var lastPages="";
		//分页信息和导航B
		function makePageInfo(data){
			$("#queryPage").empty();
			currentPage=data.extend.cusList.pageNum;
			 lastPages=data.extend.cusList.pages;
			var pageInfoAndNav = $("<span></span>").append(" 共"+data.extend.cusList.total+"条数据  当前第<span>"+data.extend.cusList.pageNum+"/"+data.extend.cusList.pages+"</span>页  跳转到：<input type='number' id='navInput' style='width:52px;'><button id='navButton' class='btn btn-info btn-sm jump'><span class='fa fa-send-o'></span></button> ")
			                                       .append("<div class='fr'><button class='btn btn-info btn-sm prev'><span class='fa  fa-chevron-left'></span> </button><button class='btn btn-info btn-sm next'><span class='fa  fa-chevron-right'></span> </button></div>");
			 pageInfoAndNav.appendTo("#queryPage");
			 
			 //跳到指定页
			$("#navButton").unbind('click').click(function(){
				 var num= $("#navInput").val();$("#navInput").val("");
				 if(num>0&&$("#navInput").val()<=data.extend.cusList.pages){
					 getAllSupplipes(num); 
				 } 
			});
			 
			 //上一页
			 $(".prev").unbind('click').click(function(){
				 if(data.extend.cusList.hasPreviousPage==true){
					 getAllSupplipes(data.extend.cusList.pageNum-1);
				 }
			 });
			 //下一页
			 $(".next").unbind('click').click(function(){
				 if(data.extend.cusList.hasNextPage==true){
					 getAllSupplipes(data.extend.cusList.pageNum+1); 
				 } 
			 });
			 
		}
		//分页信息和导航E
		
   //搜索用户B
   $(document).on('click','#search',function(){
	   var searchName=$("#searchInput").val();
	   if(searchName!=""){
		   var load = layer.msg("正在搜索,请稍后!",{icon:16,shade:0.05,time:38*1000});
		   $.ajax({
				url:'${APP_PATH}/Customer/searchOneCustomer',
				data:'searchName='+searchName,
				type:'post',
				success:function(data){
					layer.close(load);
					if(data.code==200){
						var placePage=data.extend.placePage;
						layer.confirm('已搜索到！', {
							  btn: ['确定'] 					  
							}, function(index, layero){						
								 showSearchName(placePage,searchName);
								 layer.close(index);
							});					 
					}else{
						layer.alert("不存在您搜索的用户！");
					}							
				}					
			}) 
	   }
   });
	
   //搜索用户E
   
   //更改用户登录权限B
   $(document).on('click','.forbidLogin',function(){
	   var id = $(this).parents("tr").find("td:eq(7)").text();
	   var td = $(this).parents("tr").find("td:eq(6)");
	   var btn=$(td).find("button:eq(1)");
	   var typeStr=$(btn).text().replace(/(^\s*)|(\s*$)/g, "");
	   if(typeStr=="等待授权"){
		   typeStr="授权登录";
	   }
	   var curtType="";
	   if(typeStr=="授权登录"){
		   currentType='0';
	   }else if(typeStr=="禁止登录"){
		   currentType='1';
	   }

	   layer.confirm("是否"+typeStr+"用户【"+$(this).parents("tr").find("td:eq(1)").text()+"】登录?", {
			  btn: ['确定','取消'] 					  
			}, function(index, layero){
				layer.close(index);
				var load = layer.msg("正在"+typeStr+",请稍后!",{icon:16,shade:0.05,time:38*1000});
				$.ajax({
					url:'${APP_PATH}/Customer/forbidLoginCustomer',
					data:{"id":id,"currentType":currentType},
					type:'post',
					success:function(data){
						if(data.code==200){
							layer.close(load);
							if(data.extend.type==0){
								$(btn).text("");
							    $(btn).html("<span class='fa fa-minus-circle'></span>&nbsp;授权登录");
							    $(btn).removeClass("btn-warning").addClass("btn-primary");
							}else if(data.extend.type==1){
								$(btn).text("");
								$(btn).html("<span class='fa fa-minus-circle'></span>&nbsp;禁止登录");
								$(btn).removeClass("btn-primary").addClass("btn-warning");
							}						
						}else{
							layer.alert("禁止失败！");
						}							
					}					
				});
			}, function(index, layero){
				return;
			}
			);
   });
 //更改用户登录权限E
   
   //删除用户B
   $(document).on('click','.delete',function(){
	             var id = $(this).parents("tr").find("td:eq(7)").text();
	             var thisTr=$(this).parents("tr");
	           
				layer.confirm("是否删除用户【"+$(this).parents("tr").find("td:eq(1)").text()+"】?",{icon:3},function(index){
					var load = layer.msg("正在删除数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
					$.ajax({
						url:'${APP_PATH}/Customer/deleteOneCustomer',
						data:'id='+id,
						type:'post',
						success:function(data){
							if(data.code==200){
								layer.close(load);
								$(thisTr).remove();
								layer.confirm('删除成功！', {
									  btn: ['确定'] 					  
									}, function(index, layero){						
										layer.close(index);
										 getAllSupplipes(currentPage);
									});
							}else{
								layer.alert("操作失败，请检查");
							}							
						}					
					})
				})
			})
   //删除用户E
   
   //添加用户B
   var add_mdal="";
   $(document).on("click","#btnAdd",function(){
	   $('#add_modal .Name').val("");
	   $('#add_modal .realName').val("");
	   $('#add_modal .email').val("");
	   $('#add_modal .password').val("");
	  add_mdal=layer.open({
			  type: 1 
			  ,area: ['480px', '332px']
	          ,title:'添加用户'
			  ,shade: 0.2
			  ,anim: 5 
			  ,content:'<div id="add_modal" class="modal-content" style="border-radius: 0px; width: 480px;background-color:#F8F8F8;border-color:#F8F8F8">'+				  
		      '<div class="modal-body">'+
		        	'<form class="form-horizontal" id="form_add_confirm">'+	        	    
						  '<div class="form-group">'+
						    '<label for="Name" class="col-sm-2 control-label" >用户名</label>'+
						   ' <div class="col-sm-10">'+
						      '<input style="width: 70%" type="text" value="" class="fl form-control Name"  name="Name" placeholder="用户名" maxlength="12">'+
						     ' <span  class="help-block fr"></span>'+
						    '</div>'+
						  '</div>'+
						  '<div class="form-group">'+
						    '<label for="realName" class="col-sm-2 control-label">实&nbsp;&nbsp;&nbsp;&nbsp;名</label>'+
						   ' <div class="col-sm-10">'+
						     ' <input style="width: 70%" type="text" value=""  class="fl form-control realName" name ="realName" placeholder="真实姓名" maxlength="12">'+
						     ' <span  class="help-block fr"></span>'+
						   ' </div>'+
						 ' </div>'+	
						 '<div class="form-group">'+
						    '<label for="email" class="col-sm-2 control-label">邮箱</label>'+
						   ' <div class="col-sm-10">'+
						     ' <input style="width: 70%" type="text" value=""  class="fl form-control email" name ="email" placeholder="邮箱" maxlength="12">'+
						     ' <span  class="help-block fr"></span>'+
						   ' </div>'+
						 ' </div>'+	
						 ' <div class="form-group">'+
						    '<label for="password" class="col-sm-2 control-label">密码</label>'+
						    '<div class="col-sm-10">'+
						      '<input style="width: 70%" type="text" value=""  class="fl form-control password" name ="password" placeholder="密码" maxlength="8">'+
						     ' <span  class="help-block fr"></span>'+
						    '</div>'+
						  '</div>'	+				  
					'</form>'+
		     ' </div>'+
		     ' <div class="modal-footer">'+
		        '<button type="button" class="btn btn-default btn-sm layui-layer-close" style="position: relative;" data-dismiss="modal"> 关  闭 </button>'+
		       ' <button type="button" class="btn btn-info btn-sm" id="btnSave"  > 保  存 </button>'+
		     ' </div>'+
		   ' </div>'
			}); 
   });
   $(document).on("click","#btnSave",function(){
	   var name=$('#add_modal .Name').val();
	   var realName=$('#add_modal .realName').val();
	   var email=$('#add_modal .email').val();
	   var password=$('#add_modal .password').val();
	   if(name==""){
		   $('#add_modal .Name').focus();
		   $('#add_modal .Name').parents("div").children(".help-block").text("请填写用户名").css("color","#FF0000");
			return;
		}else{
			 $('#add_modal .Name').parents("div").children(".help-block").text("");
		}
	   if(realName==""){
		   $('#add_modal .realName').focus();
		   $('#add_modal .realName').parents("div").children(".help-block").text("请填写真实姓名").css("color","#FF0000");
			return;
		}else{
			$('#add_modal .realName').parents("div").children(".help-block").text("");
		}
	   if(email==""){
		   $('#add_modal .email').focus();
		   $('#add_modal .email').parents("div").children(".help-block").text("请填写邮箱").css("color","#FF0000");
			return;
		}else{
			 $('#add_modal .email').parents("div").children(".help-block").text("");
		}
	   if(password==""){
		   $('#add_modal .password').focus();
		   $('#add_modal .password').parents("div").children(".help-block").text("请填写密码").css("color","#FF0000");
			return;
		}else{
			$('#add_modal .password').parents("div").children(".help-block").text("");
		}
	   
	   var load = layer.msg("正在保存,请稍后!",{icon:16,shade:0.05,time:38*1000});
   	$.ajax({
			url:'${APP_PATH}/Customer/saveCustomerInfo',       //传到控制器controller
			data:{"userName":name,"userRealName":realName,"userEmail":email,"userPassword":password},
			type:'post',
			success:function(data){
				layer.close(load);
				if(data.code==200){
					   $('#add_modal .Name').val("");
					   $('#add_modal .realName').val("");
					   $('#add_modal .email').val("");
					   $('#add_modal .password').val("");
					layer.confirm('保存成功,是否查看！', {
						  btn: ['确定','取消'] 					  
						}, function(index, layero){
							layer.close(index);
							layer.close(add_mdal);
							 getAllSupplipes(lastPages+1);
						}, function(index, layero){
							  layer.close(index);
							  layer.close(add_mdal);
							  getAllSupplipes(currentPage);
						}
						);	
				}
				else{
					layer.alert("保存失败！");
				}
			}
		});
   });
   //添加用户E
   
    //编辑用户B
     var currentIndex;
     var edit_mdal="";
   $(document).on("click",".edit",function(){
	   currentIndex=this;
	   edit_mdal=layer.open({
			  type: 1 
			  ,area: ['480px', '332px']
	          ,title:'编辑用户'
			  ,shade: 0.2
			  ,anim: 5 
			  ,content:'<div id="edit_modal" class="modal-content" style="border-radius: 0px; width: 480px;background-color:#F8F8F8;border-color:#F8F8F8">'+				  
		      '<div class="modal-body">'+
		        	'<form class="form-horizontal" id="form_add_confirm">'+	
		        	      '<div class="form-group" style="display:none;">'+
				              '<label for="id" class="col-sm-2 control-label" >ID</label>'+
				              ' <div class="col-sm-10">'+
				                   '<input style="width: 70%" type="text" class="fl form-control id"  name="id" placeholder="用户名" maxlength="12">'+
				                   ' <span  class="help-block fr"></span>'+
				              '</div>'+
				          '</div>'+
						  '<div class="form-group">'+
						    '<label for="Name" class="col-sm-2 control-label" >用户名</label>'+
						   ' <div class="col-sm-10">'+
						      '<input style="width: 70%" type="text" class="fl form-control Name"  name="Name" placeholder="用户名" maxlength="12">'+
						     ' <span  class="help-block fr"></span>'+
						    '</div>'+
						  '</div>'+
						  '<div class="form-group">'+
						    '<label for="realName" class="col-sm-2 control-label">实&nbsp;&nbsp;&nbsp;&nbsp;名</label>'+
						   ' <div class="col-sm-10">'+
						     ' <input style="width: 70%" type="text"   class="fl form-control realName" name ="realName" placeholder="真实姓名" maxlength="12">'+
						     ' <span  class="help-block fr"></span>'+
						   ' </div>'+
						 ' </div>'+	
						 '<div class="form-group">'+
						    '<label for="email" class="col-sm-2 control-label">邮箱</label>'+
						   ' <div class="col-sm-10">'+
						     ' <input style="width: 70%" type="text"   class="fl form-control email" name ="email" placeholder="邮箱" maxlength="12">'+
						     ' <span  class="help-block fr"></span>'+
						   ' </div>'+
						 ' </div>'+	
						 ' <div class="form-group">'+
						    '<label for="password" class="col-sm-2 control-label">密码</label>'+
						    '<div class="col-sm-10">'+
						      '<input style="width: 70%" type="text"   class="fl form-control password" name ="password" placeholder="密码" maxlength="8">'+
						     ' <span  class="help-block fr"></span>'+
						    '</div>'+
						  '</div>'	+				  
					'</form>'+
		     ' </div>'+
		     ' <div class="modal-footer">'+
		        '<button type="button" class="btn btn-default btn-sm layui-layer-close" style="position: relative;" data-dismiss="modal"> 关  闭 </button>'+
		       ' <button type="button" class="btn btn-info btn-sm" id="editSave"  > 保  存 </button>'+
		     ' </div>'+
		   ' </div>'
			}); 
	   $('#edit_modal .id').val($(this).parents("tr").find("td:eq(7)").text());
	   $('#edit_modal .Name').val($(this).parents("tr").find("td:eq(1)").text());
	   $('#edit_modal .realName').val($(this).parents("tr").find("td:eq(2)").text());
	   $('#edit_modal .email').val($(this).parents("tr").find("td:eq(4)").text());
	   $('#edit_modal .password').val($(this).parents("tr").find("td:eq(3)").text());
   });
   $(document).on("click","#editSave",function(){
	   
	   var id=$('#edit_modal .id').val();
	   var name=$('#edit_modal .Name').val();
	   var realName=$('#edit_modal .realName').val();
	   var email=$('#edit_modal .email').val();
	   var password=$('#edit_modal .password').val();
	   if(name==""){
		   $('#edit_modal .Name').focus();
		   $('#edit_modal .Name').parents("div").children(".help-block").text("请填写用户名").css("color","#FF0000");
			return;
		}else{
			 $('#edit_modal .Name').parents("div").children(".help-block").text("");
		}
	   if(realName==""){
		   $('#edit_modal .realName').focus();
		   $('#edit_modal .realName').parents("div").children(".help-block").text("请填写真实姓名").css("color","#FF0000");
			return;
		}else{
			$('#edit_modal .realName').parents("div").children(".help-block").text("");
		}
	   if(email==""){
		   $('#edit_modal .email').focus();
		   $('#edit_modal .email').parents("div").children(".help-block").text("请填写邮箱").css("color","#FF0000");
			return;
		}else{
			 $('#edit_modal .email').parents("div").children(".help-block").text("");
		}
	   if(password==""){
		   $('#edit_modal .password').focus();
		   $('#edit_modal .password').parents("div").children(".help-block").text("请填写密码").css("color","#FF0000");
			return;
		}else{
			$('#edit_modal .password').parents("div").children(".help-block").text("");
		}
	   
	   var load = layer.msg("正在保存,请稍后!",{icon:16,shade:0.05,time:38*1000});
   	$.ajax({
			url:'${APP_PATH}/Customer/editCustomerInfo',       //传到控制器controller
			data:{"id":id,"name":name,"realName":realName,"email":email,"password":password},
			type:'post',
			success:function(data){
				layer.close(load);
				if(data.code==200){
					layer.confirm('保存成功！', {
						  btn: ['确定'] 					  
						}, function(index, layero){
							$(currentIndex).parents("tr").find("td:eq(1)").text(name);
							$(currentIndex).parents("tr").find("td:eq(2)").text(realName);
							$(currentIndex).parents("tr").find("td:eq(3)").text(password);
							$(currentIndex).parents("tr").find("td:eq(4)").text(email);
							layer.close(index);
							layer.close(edit_mdal);
							 
						});	
				}
				else{
					layer.alert("保存失败！");
				}
			}
		});
   });
   //编辑用户E
</script>
</body>
</html>