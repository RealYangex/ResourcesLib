<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page buffer="16kb"%>
    <% request.setAttribute("APP_PATH", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>成绩管理-资源建设平台</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/layui.css">
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
  	#customerTable thead td{
  		background-color: #FF9933;
  		color:white;
  	}
  	#customerTable tbody{
  		padding:0 0 0 16px;
  	}
  	#search{
  		cursor:pointer;
  	}
  	#btnSort{
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

  	#ExcelBtn{
  		padding:20px 0 10px 20px;
  	}
  	#ExcelBtn #AllToExcel,#ToExcel{
  		border:1px solid #1E9FFF;
  		border-radius:3px;
  		background-color:#fff;
  		padding:6px;
  		color:#1E9FFF;
  	}
  	#ExcelBtn #AllToExcel:hover,#ToExcel:hover{
  		cursor:pointer;
  		background-color:#1E9FFF;
  		color:#fff;
  	}
  	#MulDelete{
  		border:1px solid #E72722;
  		border-radius:3px;
  		background-color:#fff;
  		padding:6px;
  		color:#E72722;
  	}
  	#MulDelete:hover{
  		cursor:pointer;
  		background-color:#E72722;
  		color:#fff;
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
						<span>成绩管理</span>
					</div>
					
					<div style="width:100%;height:36px;padding:10px 0 0 20px;">
						<!--  
						<label style="display:inline">按试题查看:</label>
						<div class="dropdown" style="display:inline">
							<button type="button" class="btn dropdown-toggle btn-sm" id="dropdownMenu1" 
									data-toggle="dropdown">
								所有消息
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" id="dropMenu" role="menu" aria-labelledby="dropdownMenu1">
								<li role="presentation">
									<a role="menuitem" tabindex="-1" href="#">所有消息</a>
								</li>
								<li role="presentation">
									<a role="menuitem" tabindex="-1" href="#">资源访问</a>
								</li>
								<li role="presentation">
									<a role="menuitem" tabindex="-1" href="#">资源下载</a>
								</li>
								<li role="presentation">
									<a role="menuitem" tabindex="-1" href="#">请求授权</a>
								</li>
								<li role="presentation">
									<a role="menuitem" tabindex="-1" href="#">密码修改</a>
								</li>
							</ul>
						</div> -->
						<button class='btn btn-info  fr' id="btnSort" statu="up"><span class="fa  fa-sort" > 按分数排名</button>
					</div>
					<div style="width:100%;height:100%;background-color: #FFFFFF;padding:10px 0 0 0;">
						<table class="table table-striped table-hover table-bordered" id="customerTable">
							<thead>
								<tr>
									<td style='padding-left:18px;'><input type="checkbox" id="selectAll"/></td>
									<td>序 号</td>
									<td>用户名</td>
									<td>真实姓名</td>
									<td>考试开始时间</td>
									<td>考试结束时间</td>
									<td>考试成绩</td>
									<td>总分</td>
									<td>操 作</td>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
						<div id="queryPage">
							<!--  
							<span class="fristSpan">共520条数据  当前第<span>8/16</span>页  跳转到：<input type="number" style="width:52px;"/ ><button class="btn btn-info btn-sm jump"><span class='fa fa-send-o'></span></button> <div class="fr"><button class="btn btn-info btn-sm"><span class='fa  fa-chevron-left'></span> </button><button class="btn btn-info btn-sm next"><span class='fa  fa-chevron-right'></span> </button></div>
							-->
						</div>
						<div id="ExcelBtn" style="display:none">
							<button id="AllToExcel">全导出Excel表</button>
							<button id="ToExcel">导出Excel表</button>
							<button id="MulDelete">删除选中项</button>
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

	$(function(){
		dropdownMenu();//下拉菜单函数调用
		
		var current_page = 1;
		var maxPage ;
		
		getExam(1);
		
		function getExam(page,sort){
			var pageIndex = page-1;
			var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:58*1000});
			url="";
			data="";
			if(typeof(sort)=="undefined"){
				
				//非排序方式获取数据
				data="pageIndex="+pageIndex;
				url="${APP_PATH}/Exam/getExamWithCustomer";
			}else{
				//非排序方式获取数据
				data="pageIndex="+pageIndex+"&sort="+sort;
				url="${APP_PATH}/Exam/getExamWithCustomerSortByScore";
			}
			$.ajax({
				url:url,
				type:"get",
				data:data,
				success:function(data){
					setTimeout(function(){layer.close(load)}, 500);
					if(data.code==200){
						var customer = data.extend.examList;
						var examCount = data.extend.examCount;
						var showNum = data.extend.showNum;
						
						//清空原有数据
						$("#customerTable tbody").empty();
						
						//填充表格数据
						var tb = "";
						$.each(customer,function(index,item){
							var tr = $("<tr ></tr>").attr("id",item.id);
							var index = index+1+showNum*(current_page-1); 
							tr.append($("<td style='padding-left:18px;'></td>").append("<input type='checkbox'  class='selectOne' >"));
							tr.append($("<td ></td>").append(index));
							tr.append($("<td></td>").append(item.customer.username));
							tr.append($("<td></td>").append(item.customer.realName));
							tr.append($("<td></td>").append(timeToTimeString(item.startTime)));
							tr.append($("<td></td>").append(timeToTimeString(item.endTime)));
							tr.append($("<td></td>").append(item.score));
							tr.append($("<td></td>").append(item.allScore));
							tr.append($("<td></td>").append("<button class='btn btn-info btn-xs detailBtn'><span class='fa fa-file-video-o'></span> 详情</button>&nbsp;&nbsp;<button class='btn btn-danger btn-xs deleteBtn'><span class='fa fa-trash'></span> 删 除</button>"));

							tr.appendTo($("#customerTable tbody"))
						})
						
						//显示导出按钮
						$("#ExcelBtn").css("display","block");
						maxPage = Math.ceil(examCount/showNum);
						var pageNow = current_page;
						//设置分页数据
						var pageHtml = "";
						var button ="";
						var nextPage = parseInt(pageNow)+parseInt(1);
						var prePage = parseInt(pageNow)-parseInt(1);
						
						//判断是否是排序状态
						if(typeof(sort)=="undefined"){
							pageHtml = '<span class="fristSpan">共'+examCount+'条数据  当前第<span>'+pageNow+'/'+maxPage+'</span>页  跳转到：<input type="number" style="width:52px;"/ id="jumpPage"><button class="btn btn-info btn-sm jump"><span class="fa fa-send-o"></span></button>';
							if(pageNow==maxPage){
								button = '<div class="fr"><button class="btn btn-info btn-sm pre" pageto='+prePage+'><span class="fa  fa-chevron-left"></span> </button><button class="btn btn-info btn-sm next" style="cursor:not-allowed;" disabled><span class="fa  fa-chevron-right"></span> </button></div>';
							}else if(pageNow==1){
								button = '<div class="fr"><button class="btn btn-info btn-sm pre" style="cursor:not-allowed;disabled" disabled><span class="fa  fa-chevron-left"></span> </button><button class="btn btn-info btn-sm next"  pageto='+nextPage+'><span class="fa  fa-chevron-right"></span> </button></div>';
							}else{
								button = '<div class="fr"><button class="btn btn-info btn-sm pre"  pageto='+prePage+' ><span class="fa  fa-chevron-left"></span> </button><button class="btn btn-info btn-sm next"  pageto='+nextPage+'><span class="fa  fa-chevron-right"></span> </button></div>';
							}
						}else{
							pageHtml = '<span class="fristSpan">共'+examCount+'条数据  当前第<span>'+pageNow+'/'+maxPage+'</span>页  跳转到：<input type="number" style="width:52px;"/ id="jumpPage"><button class="btn btn-info btn-sm jump" sort="sort"><span class="fa fa-send-o"></span></button>';
							if(pageNow==maxPage){
								button = '<div class="fr"><button class="btn btn-info btn-sm pre" pageto='+prePage+' sort="sort"><span class="fa  fa-chevron-left"></span> </button><button class="btn btn-info btn-sm next" style="cursor:not-allowed;" disabled sort="sort"><span class="fa  fa-chevron-right"></span> </button></div>';
							}else if(pageNow==1){
								button = '<div class="fr"><button class="btn btn-info btn-sm pre" style="cursor:not-allowed;disabled" disabled sort="sort"><span class="fa  fa-chevron-left"></span> </button><button class="btn btn-info btn-sm next"  pageto='+nextPage+' sort="sort"><span class="fa  fa-chevron-right"></span> </button></div>';
							}else{
								button = '<div class="fr"><button class="btn btn-info btn-sm pre"  pageto='+prePage+' sort="sort"><span class="fa  fa-chevron-left"></span> </button><button class="btn btn-info btn-sm next"  pageto='+nextPage+' sort="sort"><span class="fa  fa-chevron-right"></span> </button></div>';
							}
						}
						
						pageHtml+=button;
						$("#queryPage").empty();
						$("#queryPage").append(pageHtml);
					}else{
						
					}
				},error:function(){
					
				}
			})
		}
		
		//跳转按钮点击事件
		$(document).on("click",".jump",function(){
			var sort = $(this).attr("sort");
			var pageIndex =	$("#jumpPage").val();
			if(pageIndex=="") return;
			if(pageIndex>maxPage){
				pageIndex = maxPage;
			}else if(pageIndex<1){
				pageIndex = 1;
			}
			
			//重新设置当前页
			current_page = pageIndex;
			if(typeof(sort)=="undefind"){
				
				getExam(pageIndex);
			}else{
				var statu = $("#btnSort").attr("statu");
				if(statu=="up"){
					getExam(pageIndex,"down");
				}else{
					getExam(pageIndex,"up");
				}
			}
		});
		
		//上一页按钮点击事件
		$(document).on("click",".pre",function(){
			var sort = $(this).attr("sort");
			var pageIndex = $(this).attr("pageto");
			current_page = pageIndex;
			if(typeof(sort)=="undefind"){
				
				getExam(pageIndex);
			}else{
				var statu = $("#btnSort").attr("statu");
				if(statu=="up"){
					getExam(pageIndex,"down");
				}else{
					getExam(pageIndex,"up");
				}
			}
			
		})
		
		//下一页按钮点击事件
		$(document).on("click",".next",function(){
			var sort = $(this).attr("sort");
			var pageIndex = $(this).attr("pageto");
			current_page = pageIndex;
			if(typeof(sort)=="undefind"){
				getExam(pageIndex);
			}else{
				
				var statu = $("#btnSort").attr("statu");
				if(statu=="up"){
					getExam(pageIndex,"down");
				}else{
					getExam(pageIndex,"up");
				}
			}
		})
		
		//删除按钮点击事件
		$(document).on("click",".deleteBtn",function(){
			var id = $(this).parents("tr").attr('id');
			var username = $(this).parents("tr").find("td:eq(2)").text();
			layer.confirm("是否删除用户名为 "+username+" 的考试记录?",{btn:["确定","取消"]},function(){
				var load = layer.msg("正在删除,请稍后!",{icon:16,shade:0.05,time:38*1000});
					$.ajax({
						url:'${APP_PATH}/Exam/deleteEaxmById',
						data:'id='+id,
						type:'post',
						success:function(data){
							setTimeout(function(){layer.close(load)}, 500);
							if(data.code==200){
								getExam(current_page);
							}
						},error:function(data){
							
						}
					})
				},function(){
					
				})
		})
		
		//详情按钮点击事件
		$(document).on("click",".detailBtn",function(){
			layer.open({
				  type: 1 
				  ,area: ['1000px', '543px']
		          ,title:'考试详情'
				  ,shade: 0.2
				  ,anim: 5 
				  ,content:'<div style="height:450px;overflow:auto">'+
					       '<table id="examDetailTable" class="layui-table table" lay-skin="line">'+
					          '<thead>'+
	                             '<tr>'+
	                                '<th width="50px">序号</th>'+
	                                '<th width="550px">考试题目</th>'+
	                                '<th width="250px">题目选项</th>'+
	                                '<th width="150px">用户答案</th>'+              
	                             '</tr>'+
	                          '</thead>'+
		                      '<tbody>'+
		                      '</tbody>'+
		                   '</table>'+
		                   '</div>'+               
		                   '<button class="layui-btn layui-btn-normal layui-layer-close" style="margin-right:50px;position: relative;float: right;">关闭</button>'
				});
		    var  id=$(this).parents("td").parents("tr").attr("id");
		    var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
		    $.ajax({
				url:'${APP_PATH}/Exam/getExamDetail',
				type:"post",
				data:"id="+id,
				success:function(data){
					layer.close(load);
					$("#examDetailTable tbody").empty();
					 var detailList = data.extend.detailList;console.log(detailList);
					 var subjectList = data.extend.subjectList;console.log(subjectList);
	                 var k=0;
					 for(var i=0;i<detailList.length;i++){
						   var tr = $("<tr></tr>");
						    tr.append($("<td></td>").append(++k));
							tr.append($("<td></td>").append(subjectList[i].subjectContent));
							var td=$("<td></td>");
							var L=1;
							for(var j=0;j<subjectList[i].anwserList.length;j++){
								if(subjectList[i].anwserList[j].isTrue==true)
								    td.append('<p style="margin:0;color:#FF9933">'+L+". "+subjectList[i].anwserList[j].anwserContent+'(正确答案)</p>');
								else
									td.append('<p style="margin:0">'+L+". "+subjectList[i].anwserList[j].anwserContent+'</p>');
							     L++;
							}
							tr.append(td);
							tr.append($("<td></td>").append(detailList[i].userAnwser));
							tr.appendTo($("#examDetailTable tbody"))
					 }
				},error:function(){
					
				}
			}); 
		})
		
		//全选框选中事件
		$(document).on("click","#selectAll",function(){
			var check = $(this).prop("checked");
			if(check==true){
				
				//全部选中
				$("#customerTable tbody").find("input[type='checkbox']").prop("checked",true);
			}else{
				//全部选不中
				$("#customerTable tbody").find("input[type='checkbox']").prop("checked",false);
			}
		})
		
		//单个复选框选中事件
		$(document).on("click",".selectOne",function(){
			var checkboxLength = $("#customerTable tbody").find("input[type='checkbox']").length;
			var currentSelectLength =$("#customerTable tbody").find("input[type='checkbox']:checked").length;
			
			//当选中的框等于所有框的时候 全选选中
			if(checkboxLength==currentSelectLength){
				$("#selectAll").prop("checked",true)
			}else{
				$("#selectAll").prop("checked",false)
			}
		})
		
		//全部导出excel按钮点击事件
		$(document).on("click","#AllToExcel",function(){
			layer.confirm("是否导出全出的考试记录?",{btn:["确定","取消"]},function(layerIndex){
				
				layer.close(layerIndex);
				var formName=$(".formName").text();
			    var form = $("<form action='${APP_PATH}/View/allExportExcelWrite' method='post' style='display:none'></from>");
			    $(document.body).append(form);
			    form.submit();
			},function(){
				
			})
		})
		
		//导出excel按钮点击事件
		$(document).on("click","#ToExcel",function(){
			var selects = $("#customerTable tbody").find("input[type='checkbox']:checked");
			if(selects.length==0){
				var selectAll  = selects = $("#customerTable tbody").find("input[type='checkbox']");
				layer.confirm("是否导出该页所有的考试记录?",{btn:["确定","取消"]},function(layerIndex){
					
						var data = "序 号`用户名`真实姓名`考试结束时间`考试开始时间`考试成绩`总分";
						$.each(selectAll,function(index,item){
							var trs = "";
							for(var i = 1;i<=7;i++){
								var td = $(item).parents("tr").find("td:eq("+i+")").text();
								trs += td+"`";
							}
							data+="#"+trs.substring(0,trs.length-1);
						})
						layer.close(layerIndex);
						var formName=$(".formName").text();
					    var form = $("<form action='${APP_PATH}/View/exportExcelWrite' method='post' style='display:none'></from>");
					    $("<input name='data' value='"+data+"'>").appendTo(form);
					    $("<input name='formName' value='"+formName+"'>").appendTo(form);
					    $(document.body).append(form);
					    form.submit();
					},function(){
						
					})
					
			}else{
				var nameStr = "";
				$.each(selects,function(index,item){
					var id = $(item).parents("tr").attr('id');
					var name = $(item).parents("tr").find("td:eq(2)").text();
					nameStr+=name+";"
					
				})
				
				layer.confirm("是否导出用户名为 "+nameStr+" 的考试记录?",{btn:["确定","取消"]},function(layerIndex){
					
						var data = "序 号`用户名`真实姓名`考试结束时间`考试开始时间`考试成绩`总分";
						$.each(selects,function(index,item){
							var trs = "";
							for(var i = 1;i<=7;i++){
								var td = $(item).parents("tr").find("td:eq("+i+")").text();
								trs += td+"`";
							}
							data+="#"+trs.substring(0,trs.length-1);
						})
						layer.close(layerIndex);
						var formName=$(".formName").text();
					    var form = $("<form action='${APP_PATH}/View/exportExcelWrite' method='post' style='display:none'></from>");
					    $("<input name='data' value='"+data+"'>").appendTo(form);
					    $("<input name='formName' value='"+formName+"'>").appendTo(form);
					    $(document.body).append(form);
					    form.submit();
					},function(){
						
					})
			}
			
			
		})
		//导出 excel End
		
		//删除按钮点击事件
		$(document).on("click","#MulDelete",function(){
			var selects = $("#customerTable tbody").find("input[type='checkbox']:checked");
			if(selects.length==0){
				layer.alert("请先选择需要删除的项");
				return;
			}
			var idstr = "";
			var nameStr = "";
			var ids = [];
			$.each(selects,function(index,item){
				var id = $(item).parents("tr").attr('id');
				var name = $(item).parents("tr").find("td:eq(2)").text();
				nameStr+=name+";"
				ids.push(id);
				
			})
			
			layer.confirm("是否删除用户名为 "+nameStr+" 的考试记录?",{btn:["确定","取消"]},function(){
				var load = layer.msg("正在删除,请稍后!",{icon:16,shade:0.05,time:38*1000});
					$.ajax({
						url:'${APP_PATH}/Exam/deleteEaxmByIds',
						data:'ids='+ids,
						type:'post',
						success:function(data){
							setTimeout(function(){layer.close(load)}, 500);
							if(data.code==200){
								getExam(current_page);
							}
						},error:function(data){
							
						}
					})
				},function(){
					
				})
		})
		
		//按分数排名显示按钮点击事件
		$(document).on("click","#btnSort",function(){
			var statu = $(this).attr("statu");
			if(statu=="up"){
				$(this).attr("statu","donw");
			}else{
				$(this).attr("statu","up");
			}
			getExam(1,statu);
		})
		//按分数排名显示按钮点击事件 End
		
		
		/**
		 *	时间戳转换为事件字符串函数
		 */
		 function timeToTimeString(timestamp){
			var newDate = new Date();
			newDate.setTime(timestamp);
			var showDate = newDate.toLocaleString();
			return showDate;
		}
	})
	
	//下拉菜单B
    var TopicTypeSel=0;
	function dropdownMenu(){
		var li=$("#dropMenu").find("li");

		$(li[0]).click(function(){
			var txt=$(li[0]).text().replace(/(^\s*)|(\s*$)/g, "");
			$("#dropdownMenu1").empty();
			$("#dropdownMenu1").html(txt+"<span class='caret'></span>");	
			//MsgTypeSel=0;
			//getAllSupplipes(1,0);
		});
		$(li[1]).click(function(){
			var txt=$(li[1]).text().replace(/(^\s*)|(\s*$)/g, "");
			$("#dropdownMenu1").empty();
			$("#dropdownMenu1").html(txt+"<span class='caret'></span>");
			//MsgTypeSel=1;
			//getAllSupplipes(1,1);
	    })
		$(li[2]).click(function(){
			var txt=$(li[2]).text().replace(/(^\s*)|(\s*$)/g, "");
			$("#dropdownMenu1").empty();
			$("#dropdownMenu1").html(txt+"<span class='caret'></span>");	
			//MsgTypeSel=2;
			//getAllSupplipes(1,2);
		})
		$(li[3]).click(function(){
			var txt=$(li[3]).text().replace(/(^\s*)|(\s*$)/g, "");
			$("#dropdownMenu1").empty();
			$("#dropdownMenu1").html(txt+"<span class='caret'></span>");
			//MsgTypeSel=3;
			//getAllSupplipes(1,3);
		})
		$(li[4]).click(function(){
			var txt=$(li[4]).text().replace(/(^\s*)|(\s*$)/g, "");
			$("#dropdownMenu1").empty();
			$("#dropdownMenu1").html(txt+"<span class='caret'></span>");
			//MsgTypeSel=3;
			//getAllSupplipes(1,3);
		})
		
		
			
	}
//下拉菜单E
</script>
</body>
</html>