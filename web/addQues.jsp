<%-- 
    Document   : addQues
    Created on : 11.04.2015, 15:29:07
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
 
        <h2>Добавьте вопрос и варианты ответов</h2>
        <table border="1" cellpadding=0>

            <td>Вопрос <br>
                &nbsp;  <textarea name="text" rows="2" cols="45"></textarea><br>
            Варианты ответа<br>
            1<input type="text" name="a1" size="70"><br>
            2<input type="text" name="a2" size="70"><br>
            3<input type="text" name="a3" size="70"><br>
            4<input type="text" name="a4" size="70"><br>
            &nbsp; Введите № правильного ответа<br>
            &nbsp;&nbsp;<input type="text" name="ta" size="1">
            </td>
        </table>
        <br>
        
        <form action="Ser" method="post">
        <table>
            <tr>                 
                <button type="submit" name="back">
                          <i>
                          <FONT SIZE=4 COLOR="#6a5acd" FACE="Tempus sans itc" WIDTH="6">Назад</FONT> 
                          </i>
                      </button> 
                
            </tr>
            <tr>
                <button type="submit" name="addq">
                          <i>
                          <FONT SIZE=4 COLOR="#6a5acd" FACE="Arial" WIDTH="6">Добавить</FONT> 
                          </i>
                      </button> 
            </tr>            
        </table>
        </form>
    
    </body>
</html>

