<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page buffer="16kb"%>
    <% request.setAttribute("APP_PATH", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>考试管理-资源建设平台</title>
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

  	.examRange{
  		width:200px;height:100px;
  		background-color: #FFFFFF;
  		border-radius:3px;
  		
  	}
  	.margin-right20{
  		margin-right:23px;
  		
  	}
  	.examRange span{
  		color:#40CFE5;
  		font-size:40px;
  		margin:16px 0 8px 0;
  	}
  	.examRange i{
  		font-family: Microsoft YaHei
  	}
  	#shadow{
  		clear:both;
  		width:100%;
  		height:28px;
  	}
  	#eaxmShow{
  		clear:both;
  		width:100%;
  		height:660px;
  		background-color: #fff;
  	}
  	#eaxmTable{
  		margin-top:10px;
  		font-size:18px;
  		table-layout:fixed;
  	}
  	#eaxmTable thead{
  		background-color:#CC6600;
  	}
  	#eaxmTable tbody td{
  		vertical-align: middle;
  		height:68px;
	   	overflow: hidden;
	   	text-overflow: ellipsis;
  	}
  	#eaxmTable thead td{
  		color:#fff;
  		text-align:center;
  	}
  	    
  	#queryPage{
  		padding:0 20px 0 20px;
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
			<div class="spanr fr" id="span2" style="padding-left:30px;height:800px;width:900px;">
				<div style="width:100%;height:100%;">
					<div  class="examRange fr ">
						<center>
							<span class="fa fa-pie-chart"></span><br>
							<i>试题分析</i>
						</center>
					</div>
					<div  class="examRange fr margin-right20">
						<center>
							<span class="fa fa-play-circle"></span><br>
							<i>考试状态</i>
						</center>
						
					</div>
					<div  class="examRange fr margin-right20">
						<center>
							<span class="fa fa-calendar-check-o"></span><br>
							<i>考试安排</i>
						</center>
					</div>
					<div  class="examRange fr margin-right20">
						<center>
							<span class="fa fa-mortar-board"></span><br>
							<i>试题库管理</i>
						</center>
					</div>
					<div id="shadow"></div>
					<div id="eaxmShow">
						<div style="width:100%;height:36px;padding:10px 0 0 20px;">
							<label style="display:inline">按试题查看:</label>
							<div class="dropdown" style="display:inline">
								<button type="button" class="btn dropdown-toggle btn-sm" id="dropdownMenu1" 
										data-toggle="dropdown">
									所有消息
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
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
							</div>
							<button class='btn btn-info  fr' id="btnAdd" ><span class="fa  fa-plus-circle" > 按分数排名</button>
						</div>
						<table class="table table-striped table-hover table-bordered" id="eaxmTable">
							<thead>
								<tr>
									<td style='padding-left:18px;'  width="5%"><input type="checkbox" /></td>
									<td  width="5%">序号</td>
									<td width="18%">试题类型</td>
									<td>题目</td>
									<td>试题答案</td>
									<td width="10%">正确答案</td>
									<td width="15%">操 作</td>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
						<div id="queryPage">
							
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
	var current_page = 1;
	var maxPage ;
	getSubject(1)
	function getSubject(page){
		var pageIndex = page-1;
		var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:58*1000});
		$.ajax({
			url:'${APP_PATH}/Exam/getSubjectAnwser',
			type:'post',
			data:'page='+pageIndex,
			success:function(data){
				layer.close(load);
				if(data.code==200){
					var subjectAnwser = data.extend.subjectAnwsers;
					var subjectCount = data.extend.subjectCount;
					var showNum = data.extend.showNum;
					console.log(data);
					
					//清空原有数据
					$("#eaxmTable tbody").empty();
					
					//填充表格数据
					$.each(subjectAnwser,function(index,item){
						var index = index+1+showNum*(current_page-1); 
						var anwsers = item.anwser;
						var anwser = "";
						var anwserTd = $("<div style='height:68px;width:100%;overflow: hidden;text-overflow: ellipsis;'><div>");
						$.each(anwsers,function(index,an){
							anwserTd.append("<span class='fa fa-star-o'></span>"+" "+an+"<br>")
						})
						var anTd = $("<td></td>").append(anwserTd);
						var anwser = item.anwser;
						var tr = $("<tr></tr>").attr("id",item.id);
						var checktd = $('<td style="padding-left:18px;"><input type="checkbox" /></td>');
						var idTd = $("<td>"+index +"</td>");
						var typeTd = $("<td>"+item.subjectType+"</td>");
						var titleTd = $("<td></td>").append("<div style='max-height:68px;width:100%;overflow: hidden;text-overflow: ellipsis;'>"+item.title+"</div>");
						var trueTd = $("<td></td>").append("<div style='max-height:68px;width:100%;overflow: hidden;text-overflow: ellipsis;'><span class='fa fa-star'></span>"+" "+item.isTrue+"</div>");
						var btnTd = $("<td><button class='btn btn-info btn-xs AnwserEdit'><span class='fa fa-pencil'></span> 编辑</button>&nbsp;&nbsp;<button class='btn btn-danger btn-xs AnwserDeleter'><span class='fa fa-trash'></span> 删除</button></td>");
						tr.append(checktd).
						append(idTd).
						append(typeTd).
						append(titleTd).
						append(anTd).
						append(trueTd).
						append(btnTd).
						appendTo("#eaxmTable tbody");
					})
					
					maxPage = Math.ceil(subjectCount/showNum);
					var pageNow = current_page;
					//设置分页数据
					var pageHtml = '<span class="fristSpan">共'+subjectCount+'条数据  当前第<span>'+pageNow+'/'+maxPage+'</span>页  跳转到：<input type="number" style="width:52px;"/ id="jumpPage"><button class="btn btn-info btn-sm jump"><span class="fa fa-send-o"></span></button>';
					var button ="";
					var nextPage = parseInt(pageNow)+parseInt(1);
					var prePage = parseInt(pageNow)-parseInt(1);
					if(pageNow==maxPage){
						button = '<div class="fr"><button class="btn btn-info btn-sm pre" pageto='+prePage+'><span class="fa  fa-chevron-left"></span> </button><button class="btn btn-info btn-sm next" style="cursor:not-allowed;" disabled><span class="fa  fa-chevron-right"></span> </button></div>';
					}else if(pageNow==1){
						button = '<div class="fr"><button class="btn btn-info btn-sm pre" style="cursor:not-allowed;disabled" disabled><span class="fa  fa-chevron-left"></span> </button><button class="btn btn-info btn-sm next"  pageto='+nextPage+'><span class="fa  fa-chevron-right"></span> </button></div>';
					}else{
						button = '<div class="fr"><button class="btn btn-info btn-sm pre"  pageto='+prePage+' ><span class="fa  fa-chevron-left"></span> </button><button class="btn btn-info btn-sm next"  pageto='+nextPage+'><span class="fa  fa-chevron-right"></span> </button></div>';
					}
					pageHtml+=button;
					$("#queryPage").empty();
					$("#queryPage").append(pageHtml);
				}else{
					
				}
			}
			
		})
	}
	
	//跳转按钮点击事件
	$(document).on("click",".jump",function(){
		var pageIndex =	$("#jumpPage").val();
		if(pageIndex=="") return;
		if(pageIndex>maxPage){
			pageIndex = maxPage;
		}else if(pageIndex<1){
			pageIndex = 1;
		}
		
		//重新设置当前页
		current_page = pageIndex;
		getSubject(pageIndex);
	});
	
	//上一页按钮点击事件
	$(document).on("click",".pre",function(){
		var pageIndex = $(this).attr("pageto");
		current_page = pageIndex;
		getSubject(pageIndex);
	})
	
	//下一页按钮点击事件
	$(document).on("click",".next",function(){
		var pageIndex = $(this).attr("pageto");
		current_page = pageIndex;
		getSubject(pageIndex);
	})
})

</script>
</body>
</html>