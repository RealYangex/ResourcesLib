
/*屏幕适应B*/
$(document).ready(function(){
	adaptiveDisplay();
	function adaptiveDisplay(){
      var w = $(window).width();
      var h=w/6;
      if(w<375){
    	  $(".middle .mid-title").css("font-size","15px");  
      }  
      else{
	      $(".middle .mid-title").css("font-size","38px"); 
     }
      
      var sUserAgent = navigator.userAgent.toLowerCase();
      var pc=sUserAgent.match(/windows/i) == "windows";
      if(pc){
    	  $("#loginModal").css("left","53%");
    	  $(".mid-con-content").css({'width':'70%','height':'400px'});
    	  $(".bottom-top").css('width','70%');
    	  $("body").css('min-width','1360px');
      }else{
    	  $("#loginModal").css("left","61%");
    	  $(".mid-con-content").css({'width':'100%','height':'200px'});
    	  $(".bottom-top").css('width','100%');
    	  $("body").css('min-width','375px');
      }
      
      $('.slides-content').css({"height":h+'px',"background-size":w+'px'});
	}
	
   	  $(window).resize(function() {
    	adaptiveDisplay();
	 });
});
/*屏幕适应B*/

/*轮播图B*/
window.onload= function() 
{
    var box  = document.getElementById("slides-img"); 
    var ul = box.children[0];                      
    var ulLis = ul.children;                        
         
    var timer = null;                                           
    var key = 0;                                                                                           
    timer = setInterval(autoplay,4000); 

    function autoplay() 
	{
        key++;
        if(key == ulLis.length)
        {  
            key = 0;                                                                                        
        }
    	   $("ul li").eq(key).fadeIn(2000).siblings().fadeOut(2000);
    }
  }

/*轮播图E*/


//弹出登录框B
$(document).on('click','#top-login',function(){	
	if($("#top-login").text()=="登录"){
		$('#inputAccount').val('');
		$('#inputPassword').val('');
		$('#loginModal').modal('show');
	}else{
		layer.alert("您已登录！");
	}
	
});
//弹出登录框E






