<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page buffer="16kb"%>
    <% request.setAttribute("APP_PATH", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>考试消息-资源建设平台</title>
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
  	
  	#shadowDiv{
  		width:100%;height:20px;background-color: #F6F6F6;padding:10px 0 0 20px;
  	}
  	#showContentDiv{
  		width:100%;height:100%;background-color: #FFFFFF;padding:20px 20px 0 20px;
  	}
  	#messageDiv{
  		width:100%;height:110px;border-bottom:1px dotted #5BC0DE;
  	}
  	#messageDiv p{

  	}
  	.messageType{
  		color:#FF6633;
  		font-size:18px;
  		font-weight:bold;
  	}
  	.messageAgreen{
  		clear:both;
  		margin-top:8px;
  	}
  	#queryPage{
  		margin-top:20px;
  	}
  	.jump{
  		margin-left:6px;
  	}
  	#deletenAll{
  		margin-right:20px;
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
				<div style="width:100%;height:100%;background-color: #FFFFFF">
					<div style="width:100%;height:40px;background-color: #F6F6F6;padding:10px 0 0 20px;">
						<span>所有考试消息</span>
					</div>
					
					<div style="width:100%;height:44px;padding:8px 0 8px 20px; border-bottom:1px solid #5BC0DE">
						<button class='btn btn-danger btn-sm fr' id="deletenAll">删除所有消息</button>
					</div>
					<!-- 阴影Begin -->
					<div id="shadowDiv">
					</div>
					<!-- 阴影End -->
					
					<div id="showContentDiv">
					    <div id="messageContainer">	
					    </div>
										
						<!-- 导航与分页B -->
						<div id="queryPage"></div>
						<!-- 导航与分页E -->
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
	getAllSupplipes(1,4);
})
//$(function()结束

		
		
//消息类型函数B
 function messageThree(item){
	 var date=new Date(item.time).toLocaleString();
	  var span= $("<span class='fa fa-lightbulb-o messageType'>考试消息</span>");
	  var pdel=$("<p></p><button id="+item.id+" class='btn btn-xs btn-danger fr msgDel'><span class='fa fa-trash messageDelete'></span> 删除</button>");
     var pcnt=$("<p>"+item.content+"</p>");
     var pdat=$("<p>"+date+"</p>");
     
     var msgDiv= $("<div id='messageDiv' class='margin-top20'></div>").append(span).append(pdel).append(pcnt).append(pdat);
     $("#messageContainer").append(msgDiv);
}
//消息类型函数E

//function getAllSupplipes(pn)B
		function getAllSupplipes(pn,msgTypeSel){
			 
			 var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
			$.ajax({
				url:'${APP_PATH}/SystemMessge/getAllSystemMessge',
				type:"get",
				data:{"pn":pn,"msgTypeSel":msgTypeSel},
				success:function(data){
					setTimeout(function(){layer.close(load)}, 500);
					var msg = data.extend.msgList.list;
					$("#messageContainer").empty();
					$.each(msg,function(index,item){
                         messageThree(item);
					});
					// 分页信息显示和导航
					makePageInfo(data);
				},error:function(){
					
				}
			});
		}
		//function getAllSupplipes(pn)E
	var currentPage="";     //当前页
		var lastPages="";
		//分页信息和导航B
		function makePageInfo(data){         
			$("#queryPage").empty();
			currentPage=data.extend.msgList.pageNum;
			 lastPages=data.extend.msgList.pages;
			var pageInfoAndNav = $("<span class='fristSpan'></span>").append(" 共"+data.extend.msgList.total+"条数据  当前第<span>"+data.extend.msgList.pageNum+"/"+data.extend.msgList.pages+"</span>页  跳转到：<input type='number' id='navInput' style='width:52px;'><button id='navButton' class='btn btn-info btn-sm jump'><span class='fa fa-send-o'></span></button> ")
			                                       .append("<div class='fr'><button class='btn btn-info btn-sm prev'><span class='fa  fa-chevron-left'></span> </button><button class='btn btn-info btn-sm next'><span class='fa  fa-chevron-right'></span> </button></div>");
			 pageInfoAndNav.appendTo("#queryPage");
			 
			 //跳到指定页
			$("#navButton").unbind('click').click(function(){
				 var num= $("#navInput").val();$("#navInput").val("");
				 if(num>0&&$("#navInput").val()<=data.extend.msgList.pages){
					 getAllSupplipes(num,4); 
				 } 
			});
			 
			 //上一页
			 $(".prev").unbind('click').click(function(){
				 if(data.extend.msgList.hasPreviousPage==true){
					 getAllSupplipes(data.extend.msgList.pageNum-1,4);
				 }
			 });
			 //下一页
			 $(".next").unbind('click').click(function(){
				 if(data.extend.msgList.hasNextPage==true){
					 getAllSupplipes(data.extend.msgList.pageNum+1,4); 
				 } 
			 });
			 
		}
		//分页信息和导航E
		
	//删除B
	$(document).on("click",".msgDel",function(){
		var msgId=$(this).attr("id");
		var msgDiv=$(this).parents("#messageDiv");
	
		layer.confirm("是否删除此条消息?",{icon:3},function(index){
			var load = layer.msg("正在删除数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
			$.ajax({
				url:'${APP_PATH}/SystemMessge/deleteOneMessge',
				data:'msgId='+msgId,
				type:'post',
				success:function(data){
					if(data.code==200){
						setTimeout(function(){layer.close(load)}, 500);
						$(msgDiv).remove();
						layer.confirm('删除成功！', {
							  btn: ['确定'] 					  
							}, function(index, layero){						
								layer.close(index);
								getAllSupplipes(currentPage,MsgTypeSel);
							});
					}else{
						layer.alert("操作失败，请检查");
					}							
				}					
			})
		})
	})
	//删除E	
	
	//删除所有消息B
$("#deletenAll").click(function(){
	var length=$("#messageContainer").find("#messageDiv").length;
	if(length==0){
		layer.alert("没有消息！");
		return;
	}
	  layer.confirm("是否删除所有考试消息?", {
		  btn: ['确定','取消'] 					  
		}, function(index, layero){
			layer.close(index);
			var load = layer.msg("正在删除,请稍后!",{icon:16,shade:0.05,time:38*1000});
			$.ajax({
				url:'${APP_PATH}/SystemMessge/deleteAllExmMessge',
				data:'msgType='+3,
				type:'post',
				success:function(data){
					if(data.code==200){
						setTimeout(function(){layer.close(load)}, 500);
						layer.confirm('全部删除成功！', {
							  btn: ['确定'] 					  
							}, function(index, layero){						
								layer.close(index);
								getAllSupplipes(currentPage,4);
							});
					}else{
						layer.alert("操作失败！");
					}							
				}					
			});
		}, function(index, layero){
			return;
		}
		);
});
//删除所有消息E
</script>
</body>
</html>