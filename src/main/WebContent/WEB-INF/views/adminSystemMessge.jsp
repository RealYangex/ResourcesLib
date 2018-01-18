<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page buffer="16kb"%>
    <% request.setAttribute("APP_PATH", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>系统消息-资源建设平台</title>
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
  		color:#F0AD4E;
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
  	#greenAll{
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
						<span id="topMsgTitle">所有系统消息</span>
					</div>
					
					<div style="width:100%;height:44px;padding:10px 0 10px 20px; border-bottom:1px solid #5BC0DE">
						<span style="display:inline">按类型选择:</span>
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
							</ul>
						</div>
						<button class='btn btn-warning btn-sm fr' id="greenAll">授权所有注册</button>
					</div>
					<!-- 阴影Begin -->
					<div id="shadowDiv">
					</div>
					<!-- 阴影End -->
					
					<!-- 消息B -->
					<div id="showContentDiv">
					    <div id="messageContainer">	
					    </div>
					 
					    <!-- 导航-分页B -->
						<div id="queryPage"></div>
					    <!-- 导航-分页E -->
					</div>
					<!-- 消息E -->
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
	getAllSupplipes(1,0);
	 dropdownMenu();
})
//$(function()结束
 
//单个授权B
$(document).on("click",".singleAgree",function(){
	var msgId=$(this).attr("id");
	var btn=$(this);
	
	 layer.confirm("是否授权?", {
		  btn: ['确定','取消'] 					  
		}, function(index, layero){
			layer.close(index);
			var load = layer.msg("正在授权,请稍后!",{icon:16,shade:0.05,time:38*1000});
			$.ajax({
				url:'${APP_PATH}/Customer/greenOneLoginCustomer',
				data:'msgId='+msgId,
				type:'post',
				success:function(data){
					if(data.code==200){
						$(btn).text("");
						$(btn).html("<span class='fa fa-unlock '></span>已经授权");
						$(btn).removeClass("btn-warning").addClass("btn-success");
						$(btn).attr("disabled","true");
						layer.alert("授权成功！");
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
//单个授权E


//授权所有注册B
$("#greenAll").click(function(){
	  layer.confirm("是否授权所有用户登录?", {
		  btn: ['确定','取消'] 					  
		}, function(index, layero){
			layer.close(index);
			var load = layer.msg("正在授权,请稍后!",{icon:16,shade:0.05,time:38*1000});
			$.ajax({
				url:'${APP_PATH}/Customer/greenAllLoginCustomer',
				type:'post',
				success:function(data){
					if(data.code==200){
						$("#greenAll");
						layer.alert("全部授权成功！");
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
//授权所有注册B
	
		
	
   //下拉菜单B
   var MsgTypeSel=0;
	function dropdownMenu(){
		var li=$("#dropMenu").find("li");

		$(li[0]).click(function(){
			var txt=$(li[0]).text().replace(/(^\s*)|(\s*$)/g, "");
			$("#dropdownMenu1").empty();
			$("#dropdownMenu1").html(txt+"<span class='caret'></span>");	
			MsgTypeSel=0;
			getAllSupplipes(1,0);
		});
		$(li[1]).click(function(){
			var txt=$(li[1]).text().replace(/(^\s*)|(\s*$)/g, "");
			$("#dropdownMenu1").empty();
			$("#dropdownMenu1").html(txt+"<span class='caret'></span>");
			MsgTypeSel=1;
			getAllSupplipes(1,1);
	    })
		$(li[2]).click(function(){
			var txt=$(li[2]).text().replace(/(^\s*)|(\s*$)/g, "");
			$("#dropdownMenu1").empty();
			$("#dropdownMenu1").html(txt+"<span class='caret'></span>");	
			MsgTypeSel=2;
			getAllSupplipes(1,2);
		})
		$(li[3]).click(function(){
			var txt=$(li[3]).text().replace(/(^\s*)|(\s*$)/g, "");
			$("#dropdownMenu1").empty();
			$("#dropdownMenu1").html(txt+"<span class='caret'></span>");
			MsgTypeSel=3;
			getAllSupplipes(1,3);
		})
	}
   //下拉菜单E

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
						layer.close(load);
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
	
	//消息类型处理函数B	
	function messageZero(item){
	  var date=new Date(item.time).toLocaleString();
	  var span= $("<span class='fa fa-lightbulb-o messageType'>资源访问</span>");
	  var pdel=$("<p></p><button id="+item.id+" class='btn btn-xs btn-danger fr msgDel'><span class='fa fa-trash messageDelete'></span> 删除</button>");
      var pcnt=$("<p>"+item.content+"</p>");
      var pdat=$("<p>"+date+"</p>");
      
      var msgDiv= $("<div id='messageDiv' class='margin-top20'></div>").append(span).append(pdel).append(pcnt).append(pdat);
      $("#messageContainer").append(msgDiv);
    }
	function messageFirst(item){
		var date=new Date(item.time).toLocaleString();
	    var span= $("<span class='fa fa-lightbulb-o messageType'>资源下载</span>");
		var pdel=$("<p></p><button id="+item.id+" class='btn btn-xs btn-danger fr msgDel'><span class='fa fa-trash messageDelete'></span> 删除</button>");
	    var pcnt=$("<p>"+item.content+"</p>");
	    var pdat=$("<p>"+date+"</p>");
	      
	    var msgDiv= $("<div id='messageDiv' class='margin-top20'></div>").append(span).append(pdel).append(pcnt).append(pdat);
	    $("#messageContainer").append(msgDiv);
    }
	function messageTwo(item){
		//var start=item.content.indexof("注册信息如下");
		var conpre="用户请求授权";
		//var conpre=item.content.substring(0,start);
		//var connex=item.content.substring(start+5);
	    var date=new Date(item.time).toLocaleString();
	    var agree=getAgreeState(item.customerId);
	    if(agree=="已经授权"){
	    	cls="btn-success";
	    	ds="disabled";
	    }
	    else{
	    	cls="btn-warning";
	    	ds="";
	    }
	    var span=$("<span class='fa fa-lightbulb-o messageType'> 请求授权</span>");
	    var pdel=$("<p></p><button id="+item.id+" class='btn btn-xs btn-danger fr msgDel'><span class='fa fa-trash messageDelete'></span> 删除</button>");
	    var spnCntOne=$("<span>"+conpre+"</span><br>");
	    var spnCntTwo=$("<span>"+item.content+"</span>");
	    var btn=$("<button id="+item.customerId+" class='btn btn-xs "+cls+" fr  messageAgreen  singleAgree' "+ds+" ><span class='fa fa-unlock '></span> "+agree+"</button>");
	    var p=$("<p></p>");
	    var pdat=$("<p>"+date+"</p>");
	  
	    var msgDiv=$("<div id='messageDiv' class='margin-top20'></div>").append(span).append(pdel).append(spnCntOne).append(spnCntTwo).append(btn).append(p).append(pdat);
	    $("#messageContainer").append(msgDiv);
    }
	
	//消息类型处理函数E
	
	
	
//改变消息授权状态B
function getAgreeState(Id){
	var state="";
	 $.ajax({
		url:'${APP_PATH}/Customer/getAgreeState',
		data:'msgId='+Id,
		async: false,
		type:'get',
		success:function(data){
			if(data.code==200){
				state=data.extend.state.toString();	
			}else{
			}							
		}					
	});
	return state;
}
//改变消息授权状态E
  //function getAllSupplipes(pn)B
		function getAllSupplipes(pn,msgTypeSel){
			 
			 var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
			$.ajax({
				url:'${APP_PATH}/SystemMessge/getAllSystemMessge',
				type:"get",
				data:{"pn":pn,"msgTypeSel":msgTypeSel},
				success:function(data){
					layer.close(load);
					var msg = data.extend.msgList.list;
					$("#messageContainer").empty();
					$.each(msg,function(index,item){
						switch(item.type){
						case 0:messageZero(item);break;
						case 1:messageFirst(item);break;
						case 2:messageTwo(item);break;
						}
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
					 getAllSupplipes(num,MsgTypeSel); 
				 } 
			});
			 
			 //上一页
			 $(".prev").unbind('click').click(function(){
				 if(data.extend.msgList.hasPreviousPage==true){
					 getAllSupplipes(data.extend.msgList.pageNum-1,MsgTypeSel);
				 }
			 });
			 //下一页
			 $(".next").unbind('click').click(function(){
				 if(data.extend.msgList.hasNextPage==true){
					 getAllSupplipes(data.extend.msgList.pageNum+1,MsgTypeSel); 
				 } 
			 });
			 
		}
		//分页信息和导航E
		
		
</script>
</body>
</html>