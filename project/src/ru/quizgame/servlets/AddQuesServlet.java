package ru.quizgame.servlets;

import java.io.IOException;
import static java.nio.charset.StandardCharsets.ISO_8859_1;
import static java.nio.charset.StandardCharsets.UTF_8;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ru.quizgame.daoclasses.QuestionDao;
import ru.quizgame.entityclasses.Question;
import ru.quizgame.auxiliaryclasses.AddQuesAuxiliary;


public class AddQuesServlet extends HttpServlet {

    
    protected void forward(String address, HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException{
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)     
     throws ServletException, IOException{    
        if (request.getParameter("addq")!=null) {
            String question=new String(request.getParameter("ques").getBytes(ISO_8859_1), UTF_8);;
            String a1=new String(request.getParameter("a1").getBytes(ISO_8859_1), UTF_8);
            String a2=new String(request.getParameter("a2").getBytes(ISO_8859_1), UTF_8);
            String a3=new String(request.getParameter("a3").getBytes(ISO_8859_1), UTF_8);
            String a4=new String(request.getParameter("a4").getBytes(ISO_8859_1), UTF_8);
            String correctAnswer=request.getParameter("ta");
            String difficulty=request.getParameter("dif");
            Pattern pat=Pattern.compile(" *");
            Matcher mq=pat.matcher(question);
            Matcher m1=pat.matcher(a1);
            Matcher m2=pat.matcher(a2);
            Matcher m3=pat.matcher(a3);
            Matcher m4=pat.matcher(a4);
            Pattern pat1=Pattern.compile("[1234]");
            Matcher mt=pat1.matcher(correctAnswer);
            Pattern pat2=Pattern.compile("[1-9][0-9]{1}");
            Matcher md=pat2.matcher(difficulty);
            if (mq.matches()|m1.matches()|m2.matches()|m3.matches()|m4.matches()|!mt.matches()|
                    !md.matches()){ 
            	AddQuesAuxiliary.setCorrect(-1);
//correct=-1;
                forward("/addQues.jsp", request, response);                
            } else {
                String answers="1)"+a1+"@2)"+a2+"@3)"+a3+"@4)"+a4+"@"; 
                Question q=new Question(2,question,answers,Integer.parseInt(correctAnswer),
                        Integer.parseInt(difficulty));
                QuestionDao qd=new QuestionDao();
                qd.insertQuestion(q);
                AddQuesAuxiliary.setCorrect(1);
                forward("/addQues.jsp", request, response);        
            }
        } else if (request.getParameter("back")!=null) {      
        	AddQuesAuxiliary.setCorrect(-1);
            forward("/addQues.jsp", request, response);
        }      
    }
        
}