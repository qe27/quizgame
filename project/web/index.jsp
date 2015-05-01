<%-- 
    Document   : index
    Created on : 11.04.2015, 15:23:52
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
        <center>
            <form action="game.jsp">
                      <button type="submit" name="game">
                          <i>
                          <FONT SIZE=12 COLOR="#4876FF" FACE="Comic Sans" WIDTH="30" >
                           &nbsp;&nbsp; &nbsp;&nbsp;Новая игра &nbsp;&nbsp; &nbsp;&nbsp;</FONT> 
                          </i>
                      </button> 
            </form>
                     
        </center> 
        <center>
            <form action="stat.jsp">
                      <button type="submit" name="stat">
                          <i>
                          <FONT SIZE=12 COLOR="#9A32CD" FACE="Comic Sans" WIDTH="30" >Статистика игр</FONT> 
                          </i>
                      </button> 
            </form>
        </center>

        <center>
            <form action="addQues.jsp" >
                <button type="submit" name="addq">
                          <i>
                          <FONT SIZE=12 COLOR="#6a5acd" FACE="Comic Sans" WIDTH="30">Добавить вопрос</FONT> 
                          </i>
                      </button> 
            </form>
        </center>
        
       
    </body>
</html>
