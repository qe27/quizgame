<%-- 
    Document   : game
    Created on : 11.04.2015, 19:00:10
    Author     : Гоша
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Игра "Викторина"</title>
    </head>
    
    <body>
         

        
        <br><br><br><br><br><br><br><br>
        <h2> Вопрос 1</h2>
    <li><FONT SIZE=7 COLOR="#7A67EE" FACE="Comic Sans" WIDTH="2">Сколько материков на Земле?
        </FONT>
    </li>

        <p><input type="radio" name="v1"/>4</p>

        <p><input type="radio" name="v2"/>5</p>

	<p><input type="radio" name="v3"/>6</p>

        <p><input type="radio" name="v4"/>7 </p>
       
        <table>
            <tr>   
                <form action="index.jsp" >
                <button type="submit" name="addq">
                          <i>
                          <FONT SIZE=4 COLOR="#1E90FF" FACE="Arial" WIDTH="2">Прервать игру</FONT> 
                          </i>
                      </button> 
                </form>
            </tr>
            <tr>
                <form action="index.jsp" >
                <button type="submit" name="addq">
                          <i>
                          <FONT SIZE=4 COLOR="#6a5acd" FACE="Arial" WIDTH="2">Далее</FONT> 
                          </i>
                      </button> 
                </form>
            </tr>            
        </table>
        
    </body>
</html>