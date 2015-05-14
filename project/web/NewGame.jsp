<%@ page language="java" contentType="text/html"   
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Игры</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <%@include file="/menu.jsp" %>
<form name="test" method="post" action="NewGameServlet">
  <p><b>Ваше имя </b>(не более 20 символов, русские и английские буквы):<br>
   <input type="text" name = "name" size="40">
  </p>
  <p><button type="submit">Создать игру</button>
 </form>

</body>
</html>