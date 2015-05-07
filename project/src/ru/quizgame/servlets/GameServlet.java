

package ru.quizgame.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ru.quizgame.daoclasses.*;
import ru.quizgame.entityclasses.*;


@WebServlet(name = "GameServlet", urlPatterns = {"/GameServlet"})
public class GameServlet extends HttpServlet {

    public static int i=0;
    public static int score=0;
    public static int difficulty;
    public static int correct_answer;
    public static int game_id;
    public static int question_id;
    public static int order_number;
    public static boolean is_correct;
    public static int countQuestionsInGame=4;
    
    protected void forward(String address, HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException{
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)     
     throws ServletException, IOException {
        i++;        
        if (request.getParameter("back")!=null) {
            try {
                    PairDao.deletePair(game_id);
                } catch (SQLException ex) {
                    Logger.getLogger(GameServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (NamingException ex) {
                    Logger.getLogger(GameServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            i=0;
            score=0;
            forward("/index.jsp", request, response);
        } else if (request.getParameter("answer")!=null) {
            order_number=i;
            is_correct=false;
            if (Integer.parseInt(request.getParameter("answer"))==correct_answer){
                 score+=difficulty;
                 is_correct=true;
            }            
            Pair pair=new Pair(game_id,question_id,order_number,is_correct);            
            try {
                PairDao.insertPair(pair);
            } catch (NamingException ex) {
                Logger.getLogger(GameServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(GameServlet.class.getName()).log(Level.SEVERE, null, ex);
            }            
            if (i<countQuestionsInGame) {
                forward("/game.jsp", request, response);
            } else {                
                try {
                    GameDao.updateGame(game_id, score);
                } catch (SQLException ex) {
                    Logger.getLogger(GameServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (NamingException ex) {
                    Logger.getLogger(GameServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                i=0;
                score=0;

                // далее, видимо, должна быть страница с сообщением об окончании игры
                //пока её нет
                forward("/index.jsp", request, response);
            }
        }
    }
    
    public static Integer[] getQuestions() throws NamingException, SQLException {
        ArrayList<Integer> numbers = new ArrayList<>();
        int i=1;
        int n;
        int quantity =QuestionDao.getQuantity();
        Random r = new Random();
        while (i<=countQuestionsInGame) {
            n = r.nextInt(quantity) + 1;
            if (!numbers.contains(n)) {
                numbers.add(n);
                i++;
            } 
        }
        Integer a[]=new Integer[numbers.size()];
        a=numbers.toArray(a);
        return a;
    }
               
}
