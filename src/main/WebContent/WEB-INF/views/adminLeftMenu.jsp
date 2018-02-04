<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath());
  pageContext.setAttribute("UserId",request.getSession().getAttribute("userid"));
  pageContext.setAttribute("UserName",request.getSession().getAttribute("username"));
  pageContext.setAttribute("RealName",request.getSession().getAttribute("realname"));
  pageContext.setAttribute("UserPassword",request.getSession().getAttribute("password"));
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="spanl fl"  id="span1">
	<ul style="background-color:#2D2B32;border-radius:2px;">
		<a href="${APP_PATH}/View/adminIndex" ><li class="line"><span class="fa fa-paper-plane-o"></span>系统概览</li></a>
		<a href="${APP_PATH}/View/adminResource" ><li class="line"><span class="fa fa-tachometer"></span>资源管理</li></a>
		<a href="${APP_PATH}/View/adminCoustomer" ><li class="line"><span class="fa fa-user-o"></span>会员管理</li></a>
		<c:choose> 
		<c:when test="${sessionScope.systemMessage==0}"> 
			<a href="${APP_PATH}/View/adminSystemMessge" ><li ><span class="fa fa-bullhorn"></span>系统消息</li></a>
		</c:when> 
		<c:otherwise> 
			<a href="${APP_PATH}/View/adminSystemMessge" ><li ><span class="fa fa-bullhorn"></span>系统消息<span class="badge" id="systemMessageBadge">${sessionScope.systemMessage}</span></li></a> 
		</c:otherwise> 
		</c:choose> 
	</ul>
	<ul style="background-color:#2D2B32;border-radius:2px;">
		<a href="${APP_PATH}/View/adminExamManage" ><li class="line"><span class="fa fa-file-text-o"></span>考试管理</li></a>
		<a href="${APP_PATH}/View/adminGradeManage" ><li class="line"><span class="fa fa-vcard-o"></span>成绩管理</li></a>
		<c:choose> 
		<c:when test="${sessionScope.examMessage==0}"> 
			<a href="${APP_PATH}/View/adminExamMessage" ><li ><span class="fa fa-bullhorn"></span>考试消息 </li></a>
		</c:when> 
		<c:otherwise> 
			<a href="${APP_PATH}/View/adminExamMessage" ><li ><span class="fa fa-bullhorn"></span>考试消息 <span class="badge badge2" id="examMessageBadge">${sessionScope.examMessage}</span></li></a> 
		</c:otherwise> 
		</c:choose> 
	</ul>

	<ul class="accordion-group" style="background-color:#2D2B32;border-radius:2px;">
		<a class="accordion-heading" >
			<a class="accordion-toggle" id="selectBtn" href="#collapse1" data-toggle="collapse" data-parent="#accordion"><li  class="line"><span class="fa fa-cog"></span>设置 <span class="fa fa-chevron-down pull-right"  id="selectMenuDown" statu="down" style="margin-top:6px;"></span></li></a>
		</a>
		<ul class="collapse  items " id="collapse1"  statu= "out" style="background-color: #EFEFEF" >
			<a href="#" id="updatePassword"><li><span class="fa fa-key"></span>账户修改</li></a>
			<a href="#" id="visitSet"><li><span class="fa fa-lock"></span>访问设置</li></a>
			<a href="#" id="messageSet"><li><span class="fa fa-volume-up"></span>消息设置</li></a>
		</ul>
		<a href="${APP_PATH}/AdmLogin/exit" ><li ><span class="fa fa-power-off"></span>退出</li></a>
	</ul>
	<script type="text/javascript">
		$("#selectBtn").click(function(){
			var tagert = $("#selectMenuDown");
			var statu = $("#selectMenuDown").attr("statu");
			if(statu=="down"){
				$(tagert).attr("statu","up");
				$(tagert).removeClass("fa-chevron-down");
				$(tagert).addClass("fa-chevron-up");
			}else{
				$(tagert).attr("statu","down");
				$(tagert).removeClass("fa-chevron-up");
				$(tagert).addClass("fa-chevron-down");
			}
		})
		$("#messageSet").click(function(){
			
		})
	</script>
</div>

    <!-- 账户修改B -->
    <script type="text/javascript">
       $(document).on("click","#updatePassword",function(){
    	   layer.open({
				  type: 1 
				  ,area: ['480px', '285px']
    	          ,title:'账户修改'
				  ,shade: 0.2
				  ,anim: 1 
				  ,content:'<div id="mod_modal" class="modal-content" style="border-radius: 0px; width: 480px;background-color:#F8F8F8;border-color:#F8F8F8">'+				  
			      '<div class="modal-body">'+
			        	'<form class="form-horizontal" id="form_add_confirm">'+	        	    
							  '<div class="form-group">'+
							    '<label for="Name" class="col-sm-2 control-label" >用户名</label>'+
							   ' <div class="col-sm-10">'+
							      '<input style="width: 70%" type="text" value="${UserName}" class="fl form-control Name"  name="Name" placeholder="用户名" maxlength="12">'+
							     ' <span  class="help-block fr"></span>'+
							    '</div>'+
							  '</div>'+
							  '<div class="form-group">'+
							    '<label for="realName" class="col-sm-2 control-label">实&nbsp;&nbsp;&nbsp;&nbsp;名</label>'+
							   ' <div class="col-sm-10">'+
							     ' <input style="width: 70%" type="text" value="${RealName}"  class="fl form-control realName" name ="realName" placeholder="真实姓名" maxlength="12">'+
							     ' <span  class="help-block fr"></span>'+
							   ' </div>'+
							 ' </div>'+						 
							 ' <div class="form-group">'+
							    '<label for="password" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>'+
							    '<div class="col-sm-10">'+
							      '<input style="width: 70%" type="text" value="${UserPassword}"  class="fl form-control password" name ="password" placeholder="密码" maxlength="8">'+
							     ' <span  class="help-block fr"></span>'+
							    '</div>'+
							  '</div>'	+				  
						'</form>'+
			     ' </div>'+
			     ' <div class="modal-footer">'+
			        '<button type="button" class="btn btn-default btn-sm layui-layer-close" style="position: relative;" data-dismiss="modal"> 关  闭 </button>'+
			       ' <button type="button" class="btn btn-info btn-sm" id="modSave"  > 保  存 </button>'+
			     ' </div>'+
			   ' </div>'
				}); 
       });
       $(document).on("click","#modSave",function(){
    	   var name=$('#mod_modal .Name').val();
    	   var realName=$('#mod_modal .realName').val();
    	   var password=$('#mod_modal .password').val();
    	   if(name==""){
    		   $('#mod_modal .Name').focus();
    		   $('#mod_modal .Name').parents("div").children(".help-block").text("请填写用户名").css("color","#FF0000");
    			return;
    		}else{
    			 $('#mod_modal .Name').parents("div").children(".help-block").text("");
    		}
    	   if(realName==""){
    		   $('#mod_modal .realName').focus();
    		   $('#mod_modal .realName').parents("div").children(".help-block").text("请填写真实姓名").css("color","#FF0000");
    			return;
    		}else{
    			$('#mod_modal .realName').parents("div").children(".help-block").text("");
    		}
    	   if(password==""){
    		   $('#mod_modal .password').focus();
    		   $('#mod_modal .password').parents("div").children(".help-block").text("请填写密码").css("color","#FF0000");
    			return;
    		}else{
    			$('#mod_modal .password').parents("div").children(".help-block").text("");
    		}
    	   
    	   var load = layer.msg("正在保存,请稍后!",{icon:16,shade:0.05,time:38*1000});
       	$.ajax({
    			url:'${APP_PATH}/AdmLogin/modefiyAdminInfo',       //传到控制器controller
    			data:{"userid":"${UserId}","username":name,"realname":realName,"password":password},
    			type:'post',
    			success:function(data){
    				setTimeout(function(){layer.close(load)}, 500);
    				if(data.code==200){
    					layer.confirm('保存成功！', {
    						  btn: ['确定'] 					  
    						}, function(index, layero){
    							$("#add_modal").modal("hide");
    							layer.close(index);
    						}
    						);	
    				}
    				else{
    					layer.alert("保存失败！");
    				}
    			}
    		});
       });
       
    </script>
     <!-- 账户修改E -->
     
     <!-- 消息设置B -->
    <script type="text/javascript">
       var msgLayer = "";
       $(document).on("click","#messageSet",function(){
    	   msgLayer = layer.open({
				  type: 1 
				  ,area: ['380px', '243px']
 	          ,title:'消息设置'
				  ,shade: 0.2
				  ,anim: 1 
				  ,content:'<div id="msgSeting_modal" class="modal-content" style="border-radius: 0px; width: 380px;background-color:#F8F8F8;border-color:#F8F8F8">'+				  
			      '<div class="modal-body">'+
			           '<form id="formMsg">'+
                           '<label style="font-weight: normal;display: block;"><input name="MSG" type="checkbox"  value="1"/>屏蔽访问消息 </label><label style="font-weight: normal;display: block;"><input name="MSG" type="checkbox"  value="2"/>屏蔽下载消息</label><label style="font-weight: normal;display: block;"><input name="MSG"  type="checkbox" value="4"/>屏蔽授权消息 </label><label style="font-weight: normal;display: block;"><input name="MSG" type="checkbox" value="8"/>屏蔽考试消息</label></form>'+
			     ' </div>'+
			     ' <div class="modal-footer">'+
			        '<button type="button" class="btn btn-default btn-sm layui-layer-close" style="position: relative;" data-dismiss="modal"> 关  闭 </button>'+
			       ' <button type="button" class="btn btn-info btn-sm" id="msgSetingSave"  > 保  存 </button>'+
			     ' </div>'+
			   ' </div>'
				}); 
    	   
    	   //获取数据
    	   var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
           $.ajax({
 				url:'${APP_PATH}/AdminSeting/getMsgSeting',
 				type:'get',
 				success:function(data){
 					setTimeout(function(){layer.close(load)}, 500);
 					if(data.code==200){
 						var value=data.extend.value;
 						
 						//把值换成2进制为
 						var binary = value.toString(2);
 						
 						//不足4位补零
 						var valueStr = ("0000"+binary).slice(-4);
 						
 						//根据位数设置消息
 						if(valueStr.slice(0,1)=="1"){
 							$("#formMsg input:eq(3)").prop("checked",true);
 						}
 						if(valueStr.slice(1,2)=="1"){
 							$("#formMsg input:eq(2)").prop("checked",true);
 						}
						if(valueStr.slice(2,3)=="1"){
							$("#formMsg input:eq(1)").prop("checked",true);
 						}
						if(valueStr.slice(3,4)=="1"){
							$("#formMsg input:eq(0)").prop("checked",true);
 						}
 					}else{
 						
 					}							
 				}					
 			})
       });
       $(document).on("click","#msgSetingSave",function(){
    	  var value=0;  
          $("#formMsg input:checked").each(function() { 
        	value=value+parseInt($(this).val());
          }); 
          
          var load = layer.msg("正在保存,请稍后!",{icon:16,shade:0.05,time:38*1000});
          $.ajax({
				url:'${APP_PATH}/AdminSeting/msgSeting',
				data:'value='+value,
				type:'post',
				success:function(data){
					setTimeout(function(){layer.close(load)}, 500);
					if(data.code==200){
						 layer.close(msgLayer);
						 layer.alert("保存成功！");				 
					}else{
						layer.alert("请求超时！");
					}							
				}					
			})
       });
      
    </script>
     <!-- 消息设置E -->
 
     <!-- 访问设置B -->
    <script type="text/javascript">
       var visitLayer = "";
       $(document).on("click","#visitSet",function(){
    	   visitLayer  = layer.open({
				  type: 1 
				  ,area: ['380px', '217px']
	          ,title:'访问设置'
				  ,shade: 0.2
				  ,anim: 1 
				  ,content:'<div id="vistSeting_modal" class="modal-content" style="border-radius: 0px; width: 380px;background-color:#F8F8F8;border-color:#F8F8F8">'+				  
			      '<div class="modal-body">'+
			           '<form id="formViste">'+
                        '<label style="font-weight: normal;display: block;"><input name="MSG" type="radio"  value="2"/>所有人可访问</label><label style="font-weight: normal;display: block;"><input name="MSG" type="radio"  value="1"/>仅会员可访问</label><label style="font-weight: normal;display: block;"><input name="MSG"  type="radio" value="0"/>仅自己可访问</label></form>'+
			     ' </div>'+
			     ' <div class="modal-footer">'+
			        '<button type="button" class="btn btn-default btn-sm layui-layer-close" style="position: relative;" data-dismiss="modal"> 关  闭 </button>'+
			       ' <button type="button" class="btn btn-info btn-sm" id="visitSetingSave"  > 保  存 </button>'+
			     ' </div>'+
			   ' </div>'
				}); 
    	   var load = layer.msg("请稍后!",{icon:16,shade:0.05,time:58*1000});
    	   $.ajax({
				url:'${APP_PATH}/AdminSeting/getVistSeting',
				type:'get',
				success:function(data){
					setTimeout(function(){layer.close(load)}, 500);
					 var value=data.extend.value;
					 if(value==0){
						 $("#formViste").find("input:eq(2)").attr("checked","checked");
					 }else if(value==1){
						 $("#formViste").find("input:eq(1)").attr("checked","checked");
					 }else if(value==2){
						 $("#formViste").find("input:eq(0)").attr("checked","checked");
					 }
				}					
			})
       });
       $(document).on("click","#visitSetingSave",function(){
    
    	 var value=$("#formViste input:checked").val();
    	 if(value==null){
    		 console.log("未定义");
    		 return;
    	 }
    	 
    	  var load = layer.msg("请稍后!",{icon:16,shade:0.05,time:58*1000});
          $.ajax({
				url:'${APP_PATH}/AdminSeting/vistSeting',
				data:'value='+value,
				type:'post',
				success:function(data){
					setTimeout(function(){layer.close(load)}, 500);
					if(data.code==200){
						 layer.close(visitLayer);
						 layer.alert("保存成功！");				 
					}else{ 
						layer.alert("请求超时！");
					}							
				}					
			})
       });
      
    </script>
     <!-- 访问设置E -->