<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath());
  pageContext.setAttribute("UserId",request.getSession().getAttribute("userid"));
  pageContext.setAttribute("UserName",request.getSession().getAttribute("username"));
  pageContext.setAttribute("RealName",request.getSession().getAttribute("realname"));
  pageContext.setAttribute("UserPassword",request.getSession().getAttribute("password"));
%>

<div class="spanl fl"  id="span1">
	<ul style="background-color:#2D2B32;border-radius:2px;">
		<a href="${APP_PATH}/View/adminIndex" ><li class="line"><span class="fa fa-paper-plane-o"></span>系统概览</li></a>
		<a href="${APP_PATH}/View/adminResource" ><li class="line"><span class="fa fa-tachometer"></span>资源管理</li></a>
		<a href="${APP_PATH}/View/adminCoustomer" ><li class="line"><span class="fa fa-user-o"></span>会员管理</li></a>
		<a href="${APP_PATH}/View/adminSystemMessge" ><li ><span class="fa fa-bullhorn"></span>系统消息<span class="badge" >12</span></li></a>
	</ul>
	<ul style="background-color:#2D2B32;border-radius:2px;">
		<a href="${APP_PATH}/View/adminExamManage" ><li class="line"><span class="fa fa-file-text-o"></span>考试管理</li></a>
		<a href="${APP_PATH}/View/adminGradeManage" ><li class="line"><span class="fa fa-vcard-o"></span>成绩管理</li></a>
		<a href="${APP_PATH}/View/adminExamMessage" ><li ><span class="fa fa-bullhorn"></span>考试消息 <span class="badge badge2" >16</span></li></a>
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
		<a href="${APP_PATH}/View/AdmLogin/exit" ><li ><span class="fa fa-power-off"></span>退出</li></a>
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
				  ,anim: 5 
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
    				layer.close(load);
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
       $(document).on("click","#messageSet",function(){
    	   layer.open({
				  type: 1 
				  ,area: ['380px', '243px']
 	          ,title:'消息设置'
				  ,shade: 0.2
				  ,anim: 5 
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
       });
       $(document).on("click","#msgSetingSave",function(){
    	  var value=0;  
          $("#formMsg input:checked").each(function() { 
        	value=value+parseInt($(this).val());
          }); 
          
          $.ajax({
				url:'${APP_PATH}/AdminSeting/msgSeting',
				data:'value='+value,
				type:'post',
				success:function(data){
					layer.close(load);
					if(data.code==200){
						 layer.alert("保存成功！");				 
					}else{
						layer.alert("操作失败！");
					}							
				}					
			})
       });
      
    </script>
     <!-- 消息设置E -->
 
     <!-- 访问设置B -->
    <script type="text/javascript">
       $(document).on("click","#visitSet",function(){
    	   layer.open({
				  type: 1 
				  ,area: ['380px', '217px']
	          ,title:'访问设置'
				  ,shade: 0.2
				  ,anim: 5 
				  ,content:'<div id="vistSeting_modal" class="modal-content" style="border-radius: 0px; width: 380px;background-color:#F8F8F8;border-color:#F8F8F8">'+				  
			      '<div class="modal-body">'+
			           '<form id="formViste">'+
                        '<label style="font-weight: normal;display: block;"><input name="MSG" type="radio"  value="0"/>所有人可访问</label><label style="font-weight: normal;display: block;"><input name="MSG" type="radio"  value="1"/>仅会员可访问</label><label style="font-weight: normal;display: block;"><input name="MSG"  type="radio" value="2"/>仅自己可访问</label></form>'+
			     ' </div>'+
			     ' <div class="modal-footer">'+
			        '<button type="button" class="btn btn-default btn-sm layui-layer-close" style="position: relative;" data-dismiss="modal"> 关  闭 </button>'+
			       ' <button type="button" class="btn btn-info btn-sm" id="visitSetingSave"  > 保  存 </button>'+
			     ' </div>'+
			   ' </div>'
				}); 
       });
       $(document).on("click","#visitSetingSave",function(){
    
    	  var value=$("#formViste input:checked").val();
    	 if(value==null){
    		 console.log("未定义");
    		 return;
    	 }
         
          $.ajax({
				url:'${APP_PATH}/AdminSeting/vistSeting',
				data:'value='+value,
				type:'post',
				success:function(data){
					layer.close(load);
					if(data.code==200){
						 layer.alert("保存成功！");				 
					}else{
						layer.alert("操作失败！");
					}							
				}					
			})
       });
      
    </script>
     <!-- 访问设置E -->