$(document).ready(function(){
	/*屏幕适应B*/
	adaptiveDisplay();
	function adaptiveDisplay(){
      var w = $(window).width();
      var h=$(window).height(); 
  
     $(".examDesk").css("height",h-30);
      if(w<768){
    	  $("#body").css({"padding-left":"0","padding-right":"0"}); 
    	  $(".paperContent").css("height","86%"); 
      }  
      else{
	      $("#body").css({"padding-left":"20%","padding-right":"20%"});
	      $(".paperContent").css("height","83.5%");
      }
      var sUserAgent = navigator.userAgent.toLowerCase();
      var pc=sUserAgent.match(/windows/i) == "windows";
      if(pc){
    	  $(".sui-modal").css("left","53%");
    	  $(".examDesk").css("margin-top","1%");
    	  $("body").css("width","1366px");  
      }
      else{
    	  $(".sui-modal").css("left","61%");
    	  $(".examDesk").css("margin-top","0");
    	  $("body").css("width","100%");
      }
	}
   	  $(window).resize(function() {
    	adaptiveDisplay();
	  });
  
   	/*屏幕适应E*/
   	  
	
	
})//redy结束
   
	 /*控制栏时间显示B*/
   	function helloTime(){
   		function p(s) {
   	   	    return s < 10 ? '0' + s: s;
   	   	}
   	    var myDate = new Date();         //获取当前年
   	    var year=myDate.getFullYear();   //获取当前月
   	    var month=myDate.getMonth()+1;  //获取当前日
   	    var date=myDate.getDate(); 
   	    var h=myDate.getHours();       //获取当前小时数(0-23)
        var hello="";
   	    if(h < 6)hello='凌晨好! '
   	    else if(h < 9)hello='早上好! '
   	    else if(h< 12)hello='上午好! '
   	    else if(h < 14)hello='中午好! '
   	    else if(h < 17)hello='下午好! '
   	    else if(h < 19)hello='傍晚好! '
   	    else if(h< 22)hello='晚上好! '
   	    else {hello='夜深了! '}
   	    
   	    var now=year+'-'+p(month)+"-"+p(date);
   	    var helloTime=hello+now;
   	   $(".hellotime").text(helloTime);
   	}
	     window.setInterval(helloTime,1000);
    /*控制栏时间显示E*/	


			
    

	
   	 



