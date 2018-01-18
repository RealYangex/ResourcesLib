<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page buffer="16kb"%>
    <% request.setAttribute("APP_PATH", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/adminIndex.css">
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/echarts.common.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>
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
			
			<!-- 右侧内容展示 -->
			<div class="spanr fr" id="span2">
				<!-- 次右侧 Begin-->
				<div id="span2l">
					<div class="range fl">
						<div class="showIconDiv" >
							<center>
								<span class=" fa fa-tasks" style="font-size:50px;"></span>
								<label style="color:#333333">1200</label><br>
								<span style="color:#333333" class="title">资源总数</span>
							</center>
						</div>
					</div>
					<div class="range fr" style="margin-right:10px;">
						<div class="showIconDiv" >
							<center>
								<span class=" fa fa-user" style="font-size:52px;"></span>
								<label style="color:#333333">800</label><br>
								<span style="color:#333333" class="title">用户数量</span>
							</center>
						</div>
					</div>
					<div class="showSpan">
						<center>
							<span class="fa fa-envelope-o"  ></span><br>
							<span style="color:#333333" class="title1">消息</span>
						</center>
					</div>
					<div class="showSpan">
						<center>
							<span class="fa fa-users"  ></span><br>
							<span style="color:#333333" class="title1">用户管理</span>
						</center>
					</div>
					<div class="showSpan">
						<center>
							<span class="fa fa-bullhorn"  ></span><br>
							<span style="color:#333333" class="title1">注册消息</span>
						</center>
					</div>
					<div class="showSpan" >
						<center>
							<span class="fa fa-save"  ></span><br>
							<span style="color:#333333" class="title1">文件</span>
						</center>
					</div>
					<div class="showSpan">
						<center>
							<span class="fa fa-cogs"  ></span><br>
							<span style="color:#333333" class="title1">设置</span>
						</center>
					</div>
					<div class="showSpan">
						<center>
							<span class="fa fa-envelope-o"  ></span><br>
							<span style="color:#333333" class="title1">消息</span>
						</center>
					</div>
				</div>
				
				<!-- 次右侧 Begin-->
				
				<!-- 最右侧Begin -->
				<div id="span2r">
					<div class="range2">
						<div class="showIconDiv" >
							<center>
								<span class=" fa fa-eye" style="font-size:52px;"></span>
								<label style="color:#333333">800</label><br>
								<span style="color:#333333" class="title">总浏览量</span>
							</center>
						</div>
						
					</div>
					<div class="fileType fileTypeFrist fileLine" >
						<span>视频文件</span>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="number fr" >60%</span>
						<div class="progress" style="height:10px;">
						  <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 60%;height:12px;">
						  </div>
						</div>
					</div>
					<div class="fileType fileLine">
						<span>音频文件</span>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="number fr" >88%</span>
						<div class="progress" style="height:10px;">
						  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 88%;height:12px;">
						  </div>
						</div>
					</div>
					<div class="fileType fileLine">
						<span>图片文件</span>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="number fr" >70%</span>
						<div class="progress" style="height:10px;">
						  <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 70%;height:12px;">
						  </div>
						</div>
					</div>
					<div class="fileType fileTypeLast ">
						<span>文本文件</span>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="number fr" >80%</span>
						<div class="progress" style="height:10px;">
						  <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 80%;height:12px;">
						  </div>
						</div>
					</div>
				</div>
				<!-- 最右侧END -->
			
				<!-- 可视化 Begin -->
				<div id="chart"></div>
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
		
		
		var ct=[];
		var ld=[];
		var dn="";
		var cd=[];
		function chart(){
			
			var chartDataTime = ct.length==0?["2017-12-21", "2017-12-22", "2017-12-23", "2017-12-24", "2017-12-25", "2017-12-26", "2017-12-27", "2017-12-28", "2017-12-29", "2017-12-30", "2017-12-31", "2018-01-01"]:ct;
			if(dn==""){
				var dataName = '2017-12-21~2018-1-1访问量';
			}else{
				var dataName = dn;
			}
			console.log(chartDataTime)
			ld.push(dataName)
			var legendData = ld;
			var charData = cd.length==0?[3, 5, 11, 18, 48, 69, 261, 46, 55, 18, 10, 0]:cd;
			//var colors = ['#5793f3', '#d14a61', '#675bba'];
			var colors = ['#40CFE5', '#d14a61', '#675bba'];
			option = {
			    color: colors,
			    tooltip: {
			        trigger: 'none',
			        axisPointer: {
			            type: 'cross'
			        }
			    },
			    legend: {
			        data:legendData
			    },
			    grid: {
			    	
			    	left:29,
			    	right:28,
			        top: 32,
			        bottom: 28
			    },
			    xAxis: [
			        {
			            type: 'category',
			            axisTick: {
			                alignWithLabel: true
			            },
			            axisLine: {
			                onZero: false,
			                lineStyle: {
			                    color: colors[1]
			                }
			            },
			            axisPointer: {
			                label: {
			                    formatter: function (params) {
			                        return '访问量 ' + params.value
			                            + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
			                    }
			                }
			            },
			            data: chartDataTime
			        }
			    ],
			    yAxis: [
			        {
			            type: 'value'
			        }
			    ],
			    series: [
			        {
			            name:dataName,
			            type:'line',
			            smooth: true,
			            data: charData
			        }
			    ]
			};
			var myChart = echarts.init(document.getElementById('chart'));
			myChart.setOption(option);														
		}
		chart();
	})
</script>
</body>
</html>