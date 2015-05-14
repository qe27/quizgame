<%@ page pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Меню</title>
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
                Новая игра
            </button> 
        </form>
        <form action="GameList.jsp">
            <button type="submit" name="game">
                Прошедшие игры
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
    </body>
</html>
