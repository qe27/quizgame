/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.quizgame.servlets;

import java.sql.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import static java.nio.charset.StandardCharsets.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import ru.quizgame.daoclasses.GameDao;
import ru.quizgame.daoclasses.PairDao;
import ru.quizgame.daoclasses.QuestionDao;
import ru.quizgame.daoclasses.UserDao;
import ru.quizgame.entityclasses.Game;
import ru.quizgame.entityclasses.Pair;
import ru.quizgame.entityclasses.Question;
import ru.quizgame.entityclasses.User;


/**
 *
 * @author Борисов
 */
@WebServlet("/rating")
public class RatingServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        //request.setCharacterEncoding("Cp1251");
        System.out.println(request.getParameter("searchString"));
        request.setAttribute("searchString", new String(request.getParameter("searchString").getBytes(ISO_8859_1), UTF_8));
        getServletContext().getRequestDispatcher(
        response.encodeRedirectURL("/rating.jsp")).forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher(
        response.encodeRedirectURL("/rating.jsp")).forward(request, response);
        
    }
 
}
