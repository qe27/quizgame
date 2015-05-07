<%@page import="ru.quizgame.daoclasses.GameDao"%>
<%@ page language="java" contentType="text/html;"
import = "java.io.IOException,
                                    java.sql.DriverManager,
                                    java.sql.Connection,
                                    java.sql.ResultSet,
                                    java.sql.SQLException,
                                    java.sql.Statement,
                                    javax.naming.InitialContext,
                                    javax.servlet.ServletException,
                                    javax.servlet.annotation.WebServlet,
                                    javax.servlet.http.HttpServlet,
                                    javax.servlet.http.HttpServletRequest,
                                    javax.servlet.http.HttpServletResponse,
                                    java.util.Iterator,
                                    java.util.List,
                                    ru.quizgame.daoclasses.*,
                                    ru.quizgame.entityclasses.*,
                                    javax.sql.DataSource"
   
pageEncoding="windows-1251"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Игры</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <form action="index.jsp">
        <button type="submit" name="game">
            Главная страница
        </button> 
    </form>
     <form action="NewGame.jsp">
        <button type="submit" name="game">
            Начать игру
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
<h1>Список игр</h1>
<ul>
            <%
            List<Game> Games = GameDao.getAllGames();
            for (int i = 0; i<Games.size(); i++)
            {
            	Game temp = Games.get(i);
    	            %>
                    <li style="margin-left: 40px;">
                    <b><%=UserDao.getUserById(temp.getPlayer_id()).getName()%></b><br>
                    <%=temp.getScore()%> очков <br>
                    <% if (temp.getFinished()) %> <font color="green"> закончена </font>
                    <% ; %>
                    <% if (!temp.getFinished()) %> не закончена
                    <% ; %>
                    </li>
	<% } %>
</ul>

</body>
</html>