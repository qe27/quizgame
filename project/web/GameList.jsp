<%@ page language="java" contentType="text/html"
import = "java.io.IOException,                                   
                                    java.util.Iterator,
                                    java.util.List,
                                    ru.quizgame.daoclasses.*,
                                    ru.quizgame.entityclasses.*"
                             
    pageEncoding="Windows-1251"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>����</title>
</head>
<body>
    <form action="index.jsp">
        <button type="submit" name="game">
            ������� ��������
        </button> 
    </form>
     <form action="NewGame.jsp">
        <button type="submit" name="game">
            ������ ����
        </button> 
    </form>
    <form action="rating">
        <button type="submit" name="game">
            �������
        </button> 
    </form>
<p>������ ���:</p>
<ul>
            <%
            List<Game> Games = GameDao.getAllGames();
            for (int i = 0; i<Games.size(); i++)
            {
            	Game temp = Games.get(i);
    	            %>
	<li><%= "���� " + temp.getId() + ", ���������: " + temp.getFinished() + ". ����� �������: " + temp.getScore() +". ��������: " + UserDao.getUserById(temp.getPlayer_id()).getName() + ". (id = " + temp.getPlayer_id() +")." %></li>
	<% } %>
</ul>

</body>
</html>