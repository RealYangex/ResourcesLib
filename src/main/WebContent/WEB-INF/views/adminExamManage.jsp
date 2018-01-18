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
  	}
  	#eaxmTable thead{
  		background-color:#CC6600;
  	}
  	#eaxmTable thead td{
  		color:#fff;
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
									<td style='padding-left:18px;'><input type="checkbox" /></td>
									<td>序 号</td>
									<td>试题类型</td>
									<td>题目</td>
									<td>试题答案</td>
									<td>正确答案</td>
									<td>添加时间</td>
									<td>操 作</td>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
						<div id="queryPage">
							<span class="fristSpan">共520条数据  当前第<span>8/16</span>页  跳转到：<input type="number" style="width:52px;"/ ><button class="btn btn-info btn-sm jump"><span class='fa fa-send-o'></span></button> <div class="fr"><button class="btn btn-info btn-sm"><span class='fa  fa-chevron-left'></span> </button><button class="btn btn-info btn-sm next"><span class='fa  fa-chevron-right'></span> </button></div>
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
	
	
</script>
</body>
</html>