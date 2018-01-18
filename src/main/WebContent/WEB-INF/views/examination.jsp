<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath());%>
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
            <div class="toolBar sui-row-fluid"> 贵州民族大学近代史纲要 
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
                       <span>试卷编号：123</span>
                       <span>试卷类型：111</span>
                       <span>试卷总分：100</span>
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
                   <a id="examValidate" class="sui-btn btn-primary" href="javascript:void(0);">检查</a>             
                   <a id="examSave" class="sui-btn btn-info" href="javascript:void(0);">交卷</a>            
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
	layer.open({
		  type: 1 
		  ,area: 'auto'
		  ,maxWidth :'450px'
	      ,maxHeight:'200px'
		  ,title: '考试须知'
		  ,shade: 0.6 
		  ,maxmin: false 
		  ,anim: 5
		  ,closeBtn: 0
		  ,btn: ['立即考试', '取消考试']
	      ,yes: function(index, layero){
	    	  layer.close(index);
	    	  setCountDown_time();  //开启计时器
	    	  
	       }
	     ,btn2: function(index, layero){
	    	 window.open('${APP_PATH}/View/index','_self');
	     }
		  ,content: '<div style="padding:50px;font-size:20px;">请注意！一旦确人考试,系统即开启计时,请注意答题时间。</div>'
		}); 


});//ready结束

/*时间倒计时B*/
var sec = 60,min = 45;  //考试时间限制
var format = function(str) {
	if(parseInt(str) < 10) {
		return "0" + str;
	}
	return str;
};

function ls() {
	sec--;
	if(sec == 0) {
		min--;
		sec = 59;
	}
	document.getElementById("countdown_time").innerHTML = format(min) + ":" + format(sec);
	if(parseInt(min) == 0 && parseInt(sec) == 0) {
		window.clearInterval(idt);
		layer.alert('考试时间已到，试卷已提交，感谢您的使用！');
	}
}
function setCountDown_time(){
	var idt = window.setInterval("ls();", 1000);
}	
/*时间倒计时E*/

//交卷弹出框B
$(document).on('click','#examSave',function(){	
	layer.confirm('您还有未做的题,是否确认交卷？', {
		  btn: ['确定','取消'] 					  
		}, function(index, layero){
			
		}, function(index, layero){
			layer.close(index);
		}
		);	
});    
//交卷弹出框E


</script>
  
</html>