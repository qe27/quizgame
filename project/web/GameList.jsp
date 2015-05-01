<%@ page language="java" contentType="text/html; charset=utf-8"   
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Игры</title>
</head>
<body>

 <form action="index.jsp">
                      <button type="submit" name="game">
                          <i>
                          <FONT>
                           Главная страница</FONT> 
                          </i>
                      </button> 
            </form>
            
             <form action="NewGame.jsp">
                      <button type="submit" name="game">
                          <i>
                          <FONT>
                           Начать игру</FONT> 
                          </i>
                      </button> 
            </form>
            
                         <form action="rating.jsp">
                      <button type="submit" name="game">
                          <i>
                          <FONT>
                           Рейтинг</FONT> 
                          </i>
                      </button> 
            </form>
<p>Список игр:</p>
<ul>
	<li style="margin-left: 40px;">Игра 1</li>
	<li style="margin-left: 40px;">Игра 2</li>
	<li style="margin-left: 40px;">...</li>
	<li style="margin-left: 40px;">Игра n</li>
</ul>

</body>
</html>