

package ru.quizgame.servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet(name = "Ser", urlPatterns = {"/lib"})
public class Ser extends HttpServlet {
  
    protected void forward(String address, HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException{
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }
    
    

  public void doPost(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException {
   PrintWriter out = new PrintWriter(new OutputStreamWriter(new FileOutputStream("D:\\newout.txt")), true);
      if (request.getParameter("addq")!=null){
          out.println("You choose add");
          forward("/index.jsp", request, response);
      } else if (request.getParameter("back")!=null) {
         out.println("You choose back");
         forward("/game.jsp", request, response);
      }
      
   }

  
}