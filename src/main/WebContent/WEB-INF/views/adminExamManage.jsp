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
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/layui.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/adminIndex.css">
  
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/echarts.common.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/laydate/laydate.js"></script>
  
  <style>
    #examScheduleTable td, th {
	word-break: keep-all; /* 不换行 */
	white-space: nowrap; /* 不换行 */
	overflow: hidden; /* 内容超出宽度时隐藏超出部分的内容 */
	text-overflow: ellipsis;
	text-align: center;
 }
 #examScheduleTable>thead>tr>th{
 text-align: center;
 }
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
						<center id="examSchedule" style="cursor: pointer;">
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
	
	/**
	 * 获取题目和答案函数
	 */
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
	/**获取题目答案函数结束/
	
	//考试安排B
	 /*时间转换B*/
	function getNowFormatDate(str) {
	    var date = new Date(str);
	    var seperator1 = "-";
	    var seperator2 = ":";
	    var month = date.getMonth() + 1;
	    var strDate = date.getDate();
	    if (month >= 1 && month <= 9) {
	        month = "0" + month;
	    }
	    if (strDate >= 0 && strDate <= 9) {
	        strDate = "0" + strDate;
	    }
	    var hour=date.getHours();
	    if(parseInt(hour)<10){
	    	hour="0"+hour;
	    }
	    var minute=date.getMinutes();
	    if(parseInt(minute)<10){
	    	minute="0"+minute;
	    }
	    var second=date.getSeconds();
	    if(parseInt(second)<10){
	    	second="0"+second;
	    }
	    
	    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
	            + " " + hour + seperator2 + minute + seperator2 +second;
	    return currentdate;
	} 
	/*时间转换E*/
	//function getExamSchedule(pn)B
	function getExamSchedule(){
		 var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
		 $.ajax({
			url:'${APP_PATH}/Exam/getExamSchedule',
			type:"get",
			success:function(data){
				layer.close(load);
				
				$("#examScheduleTable tbody").empty();
				
				var schList = data.extend.schList;
				var i=schList.length;
				$.each(schList,function(index,item){
	                var Stime=getNowFormatDate(item.examStartDate);
	                var Etime=getNowFormatDate(item.examEndDate);
	                var curDate=Date.parse(new Date());
	                var eDate=item.examEndDate;
	                
	                var isUse=null;
	                var cls=null;
	                var dsab="";
	                if(item.isUse==0){
	                	isUse="开启";
	                	cls="btn-info";
	                }else if(item.isUse==1){
	                	isUse="关闭";
	                	cls="btn-warning";
	                }
	                if(curDate>=eDate){
	                	dsab="disabled";
	                	isUse="过期";
	                	cls="btn-secondary";
	                }
	                
					var tr = $("<tr ></tr>");
					tr.append($("<td style='padding-left:18px;'></td>").append(i--));
					tr.append($("<td></td>").append(Stime));
					tr.append($("<td></td>").append(Etime));
					tr.append($("<td></td>").append(item.examTime+"分钟"));
					tr.append($("<td></td>").append(item.examType));
					tr.append($("<td></td>").append(item.examSubjectNum)); 
					tr.append($("<td></td>").append(item.examAllScore+"分")); 
					tr.append($("<td></td>").append("<button class='btn "+cls+" "+dsab+"  btn-xs isUse'><span class='fa fa-pencil'></span>&nbsp;"+isUse+"</button>&nbsp;&nbsp;<button class='btn btn-danger btn-xs sxhDelete'><span class='fa fa-trash'></span>&nbsp;删 除</button>"));
					tr.append($("<td></td>").append(item.id).css("display","none"));				
					tr.prependTo($("#examScheduleTable tbody"));
				});
			},error:function(){
				
			}
		});
	}
	//function getExamSchedule(pn)E

	/*考试安排表B*/
	$(document).on("click","#examSchedule",function(){
		layer.open({
			  type: 1 
			  ,area: ['1000px', '543px']
	          ,title:'考试安排'
			  ,shade: 0.2
			  ,anim: 5 
			  ,content:'<div style="height:450px;overflow-y:auto">'+
				       '<table id="examScheduleTable" class="layui-table table" lay-skin="line">'+
	                      '<thead>'+
	                         '<tr>'+
	                            '<th width="5%">序号</th>'+
	                            '<th width="20%">开始时间</th>'+
	                            '<th width="20%">结束时间</th>'+
	                            '<th width="5%">考试时长</th>'+
	                            '<th width="5%">试题类型</th>'+
	                            '<th width="10%">试题数量</th>'+
	                            '<th width="10%">试题总分</th>'+
	                            '<th width="20%">操作</th>'+
	                            '<th width="5%" style="display:none;">ID</th>'+
	                         '</tr>'+
	                      '</thead>'+
	                      '<tbody>'+
	                      '</tbody>'+
	                   '</table>'+
	                   '</div>'+
	                   '<button id="addExamScheduleBtn" class="layui-btn layui-btn-normal" style="margin-left:50px;">添加</button>'+
	                   '<button class="layui-btn layui-btn-normal layui-layer-close" style="margin-left:50px;">关闭</button>'
			}); 
		getExamSchedule();
	});
	/*考试安排表E*/
	 
	 /*考试安排删除B*/
	$(document).on("click",".sxhDelete",function(){
		var id=$(this).parents("td").parents("tr").find("td:eq(8)").text();
		 layer.confirm("是否删除", {
			  btn: ['确定','取消'] 					  
			}, function(index, layero){
				layer.close(index);
				var load = layer.msg("正在删除,请稍后!",{icon:16,shade:0.05,time:38*1000});
				 $.ajax({
					url:'${APP_PATH}/Exam/delExamSchedule',
					type:"post",
					data:"id="+id,
					success:function(data){
						layer.close(load);
						layer.confirm('删除成功！', {
							  btn: ['确定'] 					  
							}, function(index, layero){
								layer.close(index);
								getExamSchedule();
							}
							);	
					}
				});
			}, function(index, layero){
				return;
			}
			);
	});
		 /*考试安排删除E*/
	
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
	
	/*添加考试保存B*/
$(document).on("click","#addExamSave",function(){
	var startTime=$("#startTime").val();
	var endTime=$("#endTime").val();
	var examTotalTime=$("#examTotalTime").val();
	var topicType=$("#topicType option:selected").val();
	var topicNum=$("#topicNum").val();
	var topicScore=$("#topicScore").val();
  
	var Sdate=startTime.substr(0,10).replace(/\-/g,"");
	var Edate=endTime.substr(0,10).replace(/\-/g,"");
	var Stime=startTime.substr(10).replace(/\:/g,"");
	var Etime=endTime.substr(10).replace(/\:/g,"");
	
	console.log(parseInt(Stime)>=parseInt(Etime));
	if(parseInt(Sdate)>parseInt(Edate)){
		layer.alert("请填写正确的时间!");
		return;
	}else if(parseInt(Sdate)==parseInt(Edate)&&parseInt(Stime)>=parseInt(Etime)){
		layer.alert("请填写正确的时间!");
		return;
	}

	if(startTime==""||endTime==""||topicType==""||topicNum==""||topicScore==""||examTotalTime==""){
		layer.alert("请填写完整!");
		return;
	}
	
	var load = layer.msg("正在保存数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
	$.ajax({
		url:'${APP_PATH}/Exam/addExamSchedule',       //传到控制器controller
		data:{"startTime":startTime,"endTime":endTime,"examTotalTime":examTotalTime,"topicType":topicType,"topicNum":topicNum,"topicScore":topicScore},
		type:'post',
		success:function(data){
			layer.close(load);
			if(data.code==200){
				layer.confirm('保存成功！', {
					  btn: ['确定'] 					  
					}, function(index, layero){
						layer.close(index);
						layer.close(addExammodal);
						getExamSchedule();
					}
					);	
			}
			else{
				layer.alert("保存失败！");
			}
		}
	});
	
	
});
/*添加考试保存E*/
//考试安排E

	 /*考试安排开启与关闭B*/
	$(document).on("click",".isUse",function(){
		var id=$(this).parents("td").parents("tr").find("td:eq(8)").text();
		var state=$(this).text().replace(/(^\s*)|(\s*$)/g, "");
		
		var hint=null;
		var Hint=null;
		if(state=="开启"){
			state="0";
			hint="正在开启考试！";
			Hint="是否开启考试！"
		}else if(state=="关闭"){
			state="1";
			hint="正在关闭考试！";
			Hint="是否关闭考试！"
		}else{
			return;
		}
		layer.confirm(Hint, {
			  btn: ['确定','取消'] 					  
			}, function(index, layero){
				layer.close(index);
				var load = layer.msg(hint,{icon:16,shade:0.05,time:38*1000});
				 $.ajax({
					url:'${APP_PATH}/Exam/isUseExamSchedule',
					type:"post",
					data:{"id":id,"state":state},
					success:function(data){
						layer.close(load);
						layer.confirm('设置成功！', {
							  btn: ['确定'] 					  
							}, function(index, layero){
								layer.close(index);
								getExamSchedule();
							}
							);	
					}
				});
			}, function(index, layero){
				return;
			}
			);
		
	});
	/*考试安排开启与关闭E*/
	
	/*添加考试安排B*/
	var addExammodal=null;
	$(document).on("click","#addExamScheduleBtn",function(){
	addExammodal=layer.open({
			  type: 1 
			  ,area: ['550px', '450px']
	        ,title:'添加考试安排'
			  ,shade: 0.2
			  ,anim: 5 
			  ,content:'<form class="layui-form" action="">'+
			              '<div class="layui-form-item" style="margin-top:10px;margin-bottom:10px">'+
			                  '<label class="layui-form-label" style="width:90px">开始时间</label>'+
			                  '<div class="layui-input-block">'+
			                     '<input type="text" class="layui-input" id="startTime" style="width:70%" placeholder="开始时间">'+
			                  '</div>'+
			              '</div>'+
			              '<div class="layui-form-item" style="margin-bottom:10px">'+
		                      '<label class="layui-form-label" style="width:90px">结束时间</label>'+
		                      '<div class="layui-input-block">'+
		                         '<input type="text" class="layui-input" id="endTime" style="width:70%" placeholder="结束时间">'+
		                      '</div>'+
		                  '</div>'+
		                  '<div class="layui-form-item" style="margin-bottom:10px">'+
	                          '<label class="layui-form-label" style="width:90px">考试时长</label>'+
	                          '<div class="layui-input-block">'+
	                              '<input type="number" class="layui-input" id="examTotalTime" style="width:70%" placeholder="考试时长/分钟">'+
	                          '</div>'+
	                      '</div>'+
		                  '<div class="layui-form-item" style="margin-bottom:10px">'+
	                          '<label class="layui-form-label" style="width:90px">试题类型</label>'+
	                          '<div class="layui-input-block layui-input" style="width:56%;padding-left:5px;">'+
	                              '<select id="topicType" name="topicType" lay-ignore style="width: 100%;height:100%; border:none;color: #757575;">'+
	                                '<option value="">请选择题目类型</option>'+
	                                '<option value="0">单选</option>'+
	                                '<option value="1">多选</option>'+
	                                '<option value="2">判断</option>'+
	                              '</select>'+ 
	                          '</div>'+
	                     '</div>'+
	                     '<div class="layui-form-item" style="margin-bottom:10px">'+
	                         '<label class="layui-form-label" style="width:90px">试题数量</label>'+
	                         '<div class="layui-input-block">'+
	                            '<input type="number" class="layui-input" id="topicNum" style="width:70%" placeholder="试题数量">'+
	                         '</div>'+
	                     '</div>'+
	                     '<div class="layui-form-item" style="margin-bottom:10px">'+
	                         '<label class="layui-form-label" style="width:90px">试题总分</label>'+
	                         '<div class="layui-input-block">'+
	                            '<input type="number" class="layui-input" id="topicScore" style="width:70%" placeholder="试题总分">'+
	                         '</div>'+
	                     '</div>'+                  
			           '</form>'+
			           '<button class="fr layui-btn layui-btn-normal layui-layer-close" style="margin-right:50px;margin-top:10px;position: relative;">关闭</button>'+
	                   '<button id="addExamSave" class="fr layui-btn layui-btn-normal" style="margin-right:50px;margin-top:10px;">保存</button>'
	                   
			}); 
		
			laydate.render({
				  elem: '#startTime' //指定元素
				  ,type: 'datetime'
			});
			laydate.render({
				  elem: '#endTime' //指定元素
				  ,type: 'datetime'
			});	 
	});
	/*添加考试安排E*/
	
})
// function end	

</script>
</body>
</html>