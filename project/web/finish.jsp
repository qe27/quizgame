<%@ page language="java" contentType="text/html; charset=utf-8"   
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>QuizGame - Главная</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <form action="index.jsp">
        <button type="submit" name="game">
            Главная страница
        </button> 
    </form>
     <form action="GameList.jsp">
        <button type="submit" name="game">
            Список игр
        </button> 
    </form>
    <form action="rating">
        <button type="submit" name="game">
            Рейтинг
        </button> 
    </form>   
    <form action="addQues.jsp">
        <button type="submit" name="game">
            Добавить вопрос
        </button> 
    </form>
    <h1>
        Игра окончена
    </h1>
    <p>
        <% Integer points = (Integer) request.getAttribute("points"); %>
        <% if (points == null) {%> Зачем вы сюда зашли? Возвращайтесь в игру! <%}%>
        <% if (points != null) {%> Вы набрали <%=points%> очков <%}%>
    </p>
</body>
</html>