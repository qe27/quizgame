<%@ page language="java" contentType="text/html; charset=utf-8"
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
   
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<p>Список игр:</p>
<ul>
            <%
            List<Game> Games = GameDao.getAllGames();
            for (int i = 0; i<Games.size(); i++)
            {
            	Game temp = Games.get(i);
    	            %>
	<li style="margin-left: 40px;"><%= "Игра " + temp.getId() + ", Закончена: " + temp.getFinished() + ". Очков набрано: " + temp.getScore() +". Игравший: " + UserDao.getUserById(temp.getPlayer_id()).getName() + ". (id = " + temp.getPlayer_id() +")." %></li>
	<% } %>
</ul>

</body>
</html>