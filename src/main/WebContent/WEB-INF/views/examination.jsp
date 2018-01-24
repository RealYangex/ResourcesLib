<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath());
  pageContext.setAttribute("UserId",request.getSession().getAttribute("UserId"));
  pageContext.setAttribute("schTime",request.getSession().getAttribute("schTime"));
  pageContext.setAttribute("examId",request.getSession().getAttribute("examId"));
  
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>在线考试</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css"> 
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/sui.min.css">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/examination.css">
    
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
     <script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/js/sui.min.js"></script>
   
    <script type="text/javascript" src="${APP_PATH}/static/js/examination.js"></script>

</head>
<body class="sui-row-fluid" style="margin: 0 auto;">
    <div id="desk" class="examDesk grid-demo">
        <!-- 顶部导航条B -->
        <div class="topBar sui-row-fluid">
            <div class="navTitle fl"></div>
            <span class="naviState fl"> 马克思主义理论类马克思主义基本原理概论试卷</span>
        </div>  
        <!-- 顶部导航条E -->
        
        <!-- 试卷部分B -->
        <div class="testPaper sui-row-fluid">
            <!-- 工具栏B -->
            <div class="toolBar sui-row-fluid"> 红色资源库题目测试 
                 <div class="countdown">
                      <div class="countdown-top">倒计时</div>
                      <div class="countdown-bottom">
                          <span id="countdown_time" class="timeContent fl"></span>
                          <span class="countdown_text fr">分钟</span>
                      </div>                   
                   </div>
            </div>
            <!-- 工具栏B -->
            
            <!-- 试卷内容B -->
            <div class="paperContent">
               <div class="paperTop">
                   <div class="describe">
                       <span></span>
                   </div>                 
               </div>
               <!-- 题目B -->
               <div class="paperTopic">
                 
               </div>
               <!-- 题目E -->
            </div>
            <!-- 试卷内容E -->
            
            <!-- 控制栏B -->
            <div class="controlPane sui-row-fluid">
                <div id="controlBar">
                   <a id="examine" class="sui-btn btn-primary" href="javascript:void(0);">检查</a>             
                   <a id="examSave" class="sui-btn btn-info" href="javascript:void(0);">交卷</a> 
                   <a id="returnIndex" class="sui-btn btn-info" href="javascript:void(0);">主页</a>            
                </div>
                <div id="timerBar">
                    <div class="hellotime"></div>		
                </div>
            </div>
            <!-- 控制栏E -->
        </div>
        <!-- 试卷部分E -->
    </div>  
</body>

<script type="text/javascript">

$(document).ready(function(){
	$("#returnIndex").attr("disabled", true);
	//禁止右键菜单
	 $(document).bind("contextmenu",function(e) {  
		//return false; 
	});  
	
	layer.open({
		  type: 1 
	      ,height:'350px'
	      ,width:'600px'
		  ,title: '考试须知'
		  ,shade: 0.6 
		  ,anim: 5
		  ,closeBtn: 0
		  ,btn: ['立即考试', '取消考试']
	      ,yes: function(index, layero){
	    	  
	    	  layer.close(index);
	    	 var load = layer.msg("正在加载题目,请稍后!",{icon:16,shade:0.05,time:38*1000});
	    	 var query = location.search.substring(1);
	         var schId = query.substring(query.indexOf('=') + 1);
	     
	      	$.ajax({
	  			url:'${APP_PATH}/Exam/getExamSubject',       //传到控制器controller
	  			data:{"UserId":'${UserId}',"schId":schId},
	  			type:'post',
	  			success:function(data){
	  				layer.close(load);
	  				
	  				$(".describe span").append("总分："+data.extend.subTotalScore+"分");
	  				var subList=data.extend.subExamList;
	  			
	  				  $.each(subList,function(index,item){
	  					  var addDiv=$('<div class="addDiv"></div>').attr("subId",item.id);
	  					  var titleDiv=$('<div></div>').append($('<i class="queNumber"></i>').append(index+1+".")).append($('<i class="queTile"></i>').append(item.title));
	                      addDiv.append(titleDiv);
	                      var istrue=item.isTrue.replace(/(^\s*)|(\s*$)/g, "");
	  					  for(var i=0;i<item.anwser.length;i++){
	  						  if((item.anwser[i]).replace(/(^\s*)|(\s*$)/g, "")==istrue){
	  							var label= $('<label><input name='+index+' value="  " type="radio" /></label>').append(item.anwser[i]);
	  						  }else{
	  							var label= $('<label><input name='+index+' value=" " type="radio" /></label>').append(item.anwser[i]);
	  						  }
	  						addDiv.append(label); 
	  					  }
	                     addDiv.appendTo(".paperTopic");	                     
					  });  
	  				  
	  				setCountDown_time(parseInt('${schTime}')-1,60, handpaper); //开启计时器
	  				
	  			}
	  		});
	          
	       }
	     ,btn2: function(index, layero){
	    	 window.open('${APP_PATH}/View/index','_self');
	     }
		  ,content: '<div style="padding:50px;font-size:18px;"><p>请注意！做题过程中请勿退出全屏或刷新网页</p><p>避免题目重新加载,影响你的考试。</p></div>'
		}); 
	
	$("#layui-layer1").css("width","460px");
	$(document).on("click",".layui-layer-btn",function(){
	    var el = document.documentElement; 
		var rfs = el.requestFullScreen || el.webkitRequestFullScreen || el.mozRequestFullScreen || el.msRequestFullScreen; 
		 
		if (typeof rfs != "undefined" && rfs) { 
		rfs.call(el); 
		} else if (typeof window.ActiveXObject != "undefined") { 
		 
		var wscript = new ActiveXObject("<a class='baidu-highlight' href='https://www.baidu.com/s?wd=WScript.Shell&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1Y3mHmkuhPhn1T4ryc4uHcY0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3En1mzP1R1njD1rH6dPHRdnjDz' target='_blank'>WScript.Shell</a>"); 
		if (wscript != null) { 
		wscript.SendKeys("{F11}"); 
		} 
		}   
	}); 
  	 
});//ready结束

/*时间倒计时B*/
function format(str) {
	if(parseInt(str) < 10) {
		return "0" + str;
	}
	return str;
};
var ts=null;
function setCountDown_time(min,sec, handpaper) {
	  ts = setInterval(function (){ 
	  sec--;
	  if(sec==0 && min!=0) {
		min--;
		sec = 59;
	  }
	   $("#countdown_time").text(format(min) + ":" + format(sec));
	  if(min==0&&sec==0){ 
	    handpaper();
	  }
   },1000)
}
/*时间倒计时E*/

//错题函数B
function checkmistakes(){
	var addDivS=$(".paperTopic").find(".addDiv");
	for(var i=0;i<addDivS.length;i++){
		var inputS=$(addDivS[i]).find("input");
		var queNumber=$(addDivS[i]).find(".queNumber");
		var input=$(addDivS[i]).find("input:checked");
		if($(input).val()==" "){
			$(queNumber).css("background-color","#E82734");
			for(var j=0;j<inputS.length;j++){
				if($(inputS[j]).val()=="  "){
					   $(inputS[j]).parents("label").css("color","#FF7735");
				}
			}
		}else if(input.length==0){
			$(queNumber).css("background-color","#0078D7");
			for(var j=0;j<inputS.length;j++){
				if($(inputS[j]).val()=="  "){
					   $(inputS[j]).parents("label").css("color","#FF7735");
				}
			}
		}
	}
}
//错题函数E

//交卷函数B
function handpaper(){
	 clearInterval(ts);
	$("#examine").attr("disabled", true);
	$("#examSave").attr("disabled", true);
	$("#returnIndex").attr("disabled", false);
	$("#countdown_time").text("00:00");
	submit=false;
	var subIds=new Array();        //题目数组
	
	var addDivS=$(".paperTopic").find(".addDiv");
	for(var i=0;i<addDivS.length;i++){
		subIds[i]=new Array();
		var queNumber=$(addDivS[i]).find(".queNumber");
		 $(queNumber).css("background-color","#FFFFFF");
		var inputS=$(addDivS[i]).find("input:checked");
		var schId=$(addDivS[i]).attr("subid");
		if(inputS.length==0){
			subIds[i][0]=schId;
			subIds[i][1]="0";  
			subIds[i][2]="0";
		}else if($(inputS).val()==" "){
			subIds[i][0]=schId;
			subIds[i][1]="1";  
			subIds[i][2]="0";  
		}else{
			subIds[i][0]=schId;
			subIds[i][1]="1";  
			subIds[i][2]="1";  
		}
		subIds[i][3]="#";  
	}
	 var load = layer.msg("正在批改,请稍后!",{icon:16,shade:0.05,time:38*1000});
	$.ajax({
			url:'${APP_PATH}/Exam/disposeExamResult',       //传到控制器controller
			data:"subIds="+subIds,
			type:'post',
			success:function(data){
				var totalScore=data.extend.totalScore;
				layer.close(load);
				
				layer.alert("批改完成,您的分数为"+totalScore+"分！,系统已标出您做错的或未做的题并给出了正确选项,快去看看吧。");
				checkmistakes();
			}
		});
}
//交卷函数B

//交卷弹出框B
var submit=true;
$(document).on('click','#examSave',function(){	
	if(submit==false)return;
	
	layer.confirm('您确定要交卷吗？', {
		  btn: ['是','否'] 					  
		}, function(index, layero){
			layer.close(index);
			handpaper();		
		}, function(index, layero){
			layer.close(index);
		}
		);	
});    
//交卷弹出框E

//检查弹出框B
$(document).on('click','#examine',function(){
	if(submit==false)return;
	var addDivS=$(".paperTopic").find(".addDiv");
	var flag=true;
	
	for(var i=0;i<addDivS.length;i++){
		var queNumber=$(addDivS[i]).find(".queNumber");
		var inputS=$(addDivS[i]).find("input:checked");
		if(inputS.length==0){
			flag=false;
			$(queNumber).css("background-color","#E82734");
		}else{
			$(queNumber).css("background-color","#FFFFFF");
		}
	}
   if(flag==true){
	   layer.alert("您已做完所有题目！");
   }else if(flag==false){
	   layer.alert("已为您标记出未做题目！");
   }
});    
//检查弹出框E

//返回主页B
$(document).on("click","#returnIndex",function(){
	if(submit==true)return;
	layer.confirm("确定要回到主页吗？", {
		  btn: ['是','否'] 					  
		}, function(index, layero){	
			window.open('${APP_PATH}/View/index','_self'); 
			layer.close(index);
		}, function(index, layero){						
			layer.close(index);	
		});
})

</script>
  
</html>