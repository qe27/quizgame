<%-- 
    Document   : addQues
    Created on : 11.04.2015, 15:29:07
    Author     : Гоша
--%>


<%@page contentType="text/html" import = "ru.quizgame.servlets.AddQuesServlet" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Игра "Викторина"</title>
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
 
        <h1>Добавьте вопрос и варианты ответов</h1>
        <form action="AddQuesServlet" method="post">
            
                <p>Вопрос <br>
                <textarea name="ques" rows="2" cols="45"></textarea><br>
                Варианты ответа<br>
                1) <input type="text" name="a1" size="70"><br>
                2) <input type="text" name="a2" size="70"><br>
                3) <input type="text" name="a3" size="70"><br>
                4) <input type="text" name="a4" size="70"><br>
                Введите № правильного ответа <input type="text" name="ta" size="1"><br>
                Оцените сложность вопроса <input type="text" name="dif" size="2">
                </p>
                
            <br>
            
            <table>
                <tr>                 
                    <button type="submit" name="back">
                        Назад
                    </button> 

                </tr>
                <tr>
                    <button type="submit" name="addq">
                        Добавить
                    </button> 
                </tr>
                <%
                String t = " ";
                int c = AddQuesServlet.getCorrect();
                switch (c) {
                case -1: t=new String("Ошибка. Вопрос не был добавлен!"); break;
                case 1: t=new String("Вопрос был успешно добавлен."); break;
                
                
                }
               	if (c==0) {
                %>  
                   
                <% } else {
                	if (c==1) {
                		
                	%>
                	
                <%} else %>
                <h3><%= t %>
                </h3>
                <%
                	
                }
                AddQuesServlet.setCorrectNull();
                %>
            </table>
        </form>
        
    </body>
</html>