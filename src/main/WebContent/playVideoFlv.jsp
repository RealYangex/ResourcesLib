<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page buffer="16kb"%>
    <% request.setAttribute("APP_PATH", request.getContextPath()); request.setAttribute("SRC", request.getSession().getAttribute("videoAdress")); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<object  class id="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="600" height="400">
  <param name="movie" value="${APP_PATH}/static/Upload/swf/Flvplayer.swf?autostart=true">
  <param name="quality" value="high">
  <param name="autostart" value="true">
  <param name="allowFullScreen" value="true">
  <param name="FlashVars" value="vcastr_file=${APP_PATH}/${SRC}">
  <embed src="flvplayer.swf" allowfullscreen="true" flashvars="vcastr_file=${APP_PATH}/${SRC}" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="600" height="400"></embed>
</object>
</body>
</html>