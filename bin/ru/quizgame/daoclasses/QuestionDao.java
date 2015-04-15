/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.quizgame.daoclasses;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import ru.quizgame.entityclasses.QuestionEntity;

/**
 *
 * @author artve_000
 */
public class QuestionDao {
    private static Connection connection;
    private static DataSource ds;
    private static Statement statement;
    private static InitialContext ic;
    
    public static void connectToDatabase() throws NamingException, SQLException { 
        try {
           Class.forName("org.postgresql.Driver");
           connection = DriverManager
              .getConnection("jdbc:postgresql://localhost:5432/postgres",
              "postgres", "38183818");
           connection.setAutoCommit(true);
        } catch (Exception e) {
           e.printStackTrace();
           System.err.println(e.getClass().getName()+": "+e.getMessage());
           System.exit(0);
        }
        
    }
    public void updateQuestion(QuestionEntity question) {
        try {
            connectToDatabase();
            statement = connection.createStatement();
            System.out.println(statement.executeUpdate("update questions " +
                "set question = '" + question.getQuestion() + "', " + 
                "answers = '" + question.getAnswers() + "', " + 
                "correct_answer = " + question.getCorrectAnswer() + ", " + 
                "difficulty = " + question.getDifficulty() + 
                " where id = " + question.getId()));
            statement.close();
        } catch (Exception ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            try {
                if(connection != null) 
                    connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    public void insertQuestion(QuestionEntity question) {
        try {
            connectToDatabase();
            statement = connection.createStatement();
            System.out.println(statement.executeUpdate("insert into questions " +
                "values (default, " +
                "'" + question.getQuestion() + "', " + 
                "'" + question.getAnswers() + "', " + 
                question.getCorrectAnswer() + ", " + 
                question.getDifficulty() + ")"));
        } catch (Exception ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            try {
                statement.close();
                if(connection != null) 
                    connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    public QuestionEntity getQuestion(int id) {
        try {
            connectToDatabase();
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * " + 
                "from questions " + "where id = " + id);
            resultSet.next();
            String question = resultSet.getString("question");
            String answers = resultSet.getString("answers");
            int correctAnswer = resultSet.getInt("correct_answer");
            int difficulty = resultSet.getInt("difficulty");
            return new QuestionEntity(id, question, answers, correctAnswer, difficulty);
            //connection.commit();
        } catch (Exception ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        finally {
            try {
                statement.close();
                if(connection != null) 
                    connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
