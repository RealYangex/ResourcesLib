<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page buffer="16kb"%>
    <% request.setAttribute("APP_PATH", request.getContextPath()); request.setAttribute("SRC", request.getSession().getAttribute("videoAdress")); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<video width="600" height="400" controls="controls" autoplay="true">
  <source src="${APP_PATH}/${SRC}" type="video/mp4" />
  <source src="${APP_PATH}/${SRC}" type="video/ogg" />
  <source src="${APP_PATH}/${SRC}" type="video/webm" />
  <object data="${APP_PATH}/${SRC}" width="600" height="400">
    <embed src="${APP_PATH}/${SRC}" width="600" height="400" />
  </object>
</video>
</body>
</html>