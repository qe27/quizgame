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
<form name="test" method="post" action="NewGameServlet">
  <p><b>Ваше имя </b>(не более 20 символов, русские и английские буквы):<br>
   <input type="text" name = "name" size="40">
  </p>
  <p><button type="submit">Создать игру</button>
 </form>

</body>
</html>