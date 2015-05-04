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
    <br><br><br>
    <h1>
        <b><font size="5" >Добро пожаловать в QuizGame!</font></b>
    </h1>
    <font size="4" >
    <br>
    <p>
        QuizGame - это уникальная возможность проверить свой интеллект и <br>
        померяться силами с другими игроками земного шара. Примите участие <br>
        в увлекательной викторине, стараясь давать как можно больше правильных <br>
        ответов, и следите за своим положением в рейтинге!<br>
    </p>
    <p>
        Правила предельно просты: вам будет предложено несколько вопросов, <br>
        на каждый из которых необходимо дать ответ за ограниченное время. <br>
        Чем больше правильных ответов, тем больше очков вы заработаете!
    </p>
    </font>
</body>
</html>