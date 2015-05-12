
<%@page import = "java.util.*, java.io.*, java.sql.*,
        javax.sql.*, javax.naming.InitialContext, 
        ru.quizgame.entityclasses.Question, ru.quizgame.daoclasses.QuestionDao,
        ru.quizgame.servlets.GameServlet,ru.quizgame.daoclasses.GameDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%! int quantity=GameServlet.countQuestionsInGame;%> 
    <%! Integer q[]=new Integer[quantity];%>
    <%
    int numberQ = GameServlet.i+1;
    if (numberQ==1)
         q=GameServlet.getQuestions();    
    int game_id=GameDao.findLastGameId()-1;
    %>
     
    <%
    int difficulty=0;
    String question="";
    String answers[]=new String[4];
    int correct_answer=0;
    Question ques;
    int question_id=q[numberQ-1]; 
    QuestionDao qd=new QuestionDao();
    ques=qd.getQuestion(question_id);
    question=ques.getQuestion();
    answers=ques.getAnswers().split("@");
    correct_answer=ques.getCorrectAnswer();
    difficulty=ques.getDifficulty();%>
       
    <% 
    GameServlet.difficulty=difficulty; 
    GameServlet.correct_answer=correct_answer;
    GameServlet.question_id=question_id;
    GameServlet.game_id=game_id;%>
                

    <body>   
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Игра "Викторина"</title>
            <link rel="stylesheet" type="text/css" href="style.css" />
        </head>
        <h3>
            Игра #<%=game_id%> <br><br> 
        </h3>
        <h1> Вопрос <%=numberQ%> </h1>
        <h3>
            <%=question%>
        </h3>
   
            <form action="GameServlet" method="post">
                
                <p><input type="radio" name="answer" value="1" checked/><%=answers[0]%><br>
                    <input type="radio" name="answer" value="2"/><%=answers[1]%> <br>
                    <input type="radio" name="answer" value="3"/><%=answers[2]%><br>
                    <input type="radio" name="answer" value="4"/><%=answers[3]%> <br>
                </p>
                <button type="submit" name="next">
                      Далее
                </button>
                <br>
                <button type="submit" name="back">
                    Прервать игру
                </button> 

            </form>
                                              
    </body>
        
</html>