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

  	#ExcelBtn{
  		padding:20px 0 10px 20px;
  	}
  	#ExcelBtn button{
  		border:1px solid #1E9FFF;
  		border-radius:3px;
  		background-color:#fff;
  		padding:6px;
  		color:#1E9FFF;
  	}
  	#ExcelBtn button:hover{
  		cursor:pointer;
  		background-color:#1E9FFF;
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
						</div>
						<button class='btn btn-info  fr' id="btnAdd" ><span class="fa  fa-plus-circle" > 按分数排名</button>
					</div>
					<div style="width:100%;height:100%;background-color: #FFFFFF;padding:10px 0 0 0;">
						<table class="table table-striped table-hover table-bordered" id="customerTable">
							<thead>
								<tr>
									<td style='padding-left:18px;'><input type="checkbox" /></td>
									<td>序 号</td>
									<td>用户名</td>
									<td>真实姓名</td>
									<td>考试类型</td>
									<td>考试结束时间</td>
									<td>考试开始时间</td>
									<td>考试成绩</td>
									<td>总分</td>
									<td>操 作</td>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
						<div id="queryPage">
							<span class="fristSpan">共520条数据  当前第<span>8/16</span>页  跳转到：<input type="number" style="width:52px;"/ ><button class="btn btn-info btn-sm jump"><span class='fa fa-send-o'></span></button> <div class="fr"><button class="btn btn-info btn-sm"><span class='fa  fa-chevron-left'></span> </button><button class="btn btn-info btn-sm next"><span class='fa  fa-chevron-right'></span> </button></div>
						</div>
						<div id="ExcelBtn">
							<button id="AllToExcel">全导出Excel表</button>
							<button id="ToExcel">导出Excel表</button>
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
		
		
		
		$.ajax({
			url:'http://localhost:3000/grade',
			type:"get",
			success:function(data){
				var customer = data;
				var tb = "";
				$.each(customer,function(index,item){
					var tr = $("<tr ></tr>");
					tr.append($("<td style='padding-left:18px;'></td>").append("<input type='checkbox'  >"));
					tr.append($("<td ></td>").append(index+1));
					tr.append($("<td></td>").append(item.username));
					tr.append($("<td></td>").append(item.realName));
					tr.append($("<td></td>").append(item.examType));
					tr.append($("<td></td>").append(item.startTime));
					tr.append($("<td></td>").append(item.endTime));
					tr.append($("<td></td>").append(item.grade));
					tr.append($("<td></td>").append(item.allGrade));
					tr.append($("<td></td>").append("<button class='btn btn-info btn-xs'><span class='fa fa-file-video-o'></span> 详情</button>&nbsp;&nbsp;<button class='btn btn-danger btn-xs'><span class='fa fa-trash'></span> 删 除</button>"));

					tr.appendTo($("#customerTable tbody"))
				})
			},error:function(){
				
			}
		})
		
		
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