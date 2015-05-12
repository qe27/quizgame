

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
                Введите № правильного ответа(от 1 до 4) <input type="text" name="ta" size="1"><br>
                Оцените сложность вопроса(от 10 до 100)  <input type="text" name="dif" size="2">
                </p>
               
                <button type="submit" name="addq">
                    Добавить
                </button> 
                
                <%
                String t ="";
                String s1="";
                String s2="";
                String s3="";
                String s4="";                  
                int c = AddQuesServlet.correct;              
                if (c==1) {
                    t="Вопрос был успешно добавлен.";
                } else if (c==-1) { 
                    if (AddQuesServlet.er1==-1) 
                        s1="Ошибка.Поле для вопроса не заполнено.";
                    if (AddQuesServlet.er2==-1) 
                        s2="Ошибка.Необходимо заполнить все поля для вариантов ответа.";
                    if (AddQuesServlet.er3==-1) 
                        s3="Ошибка.Не заполнено или неверно указано поле для правильного ответа.";
                    if (AddQuesServlet.er4==-1) 
                        s4="Ошибка.Не заполнено или неверно указано поле для сложности вопроса.";
                } %>
                
                <h3><%=t %>
                </h3>
                <h3><%=s1 %>
                </h3>
                <h3><%=s2 %>
                </h3>
                <h3><%=s3 %>
                </h3>
                <h3><%=s4 %>
                </h3>           
                
                <%
                t ="";
                s1="";
                s2="";
                s3="";
                s4="";            
                if (c==-1) {
                    AddQuesServlet.er1=1;
                    AddQuesServlet.er2=1;
                    AddQuesServlet.er3=1;
                    AddQuesServlet.er4=1;
                }                   
                AddQuesServlet.correct=0;%>
                        
        </form>
        
    </body>
</html>