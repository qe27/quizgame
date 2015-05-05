package ru.quizgame.daoclasses;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import ru.quizgame.entityclasses.Pair;

public class PairDao {
    private static Connection connection;
    private static DataSource ds;
    private static Statement stmt;
    private static InitialContext ic;
    
    public static void connectToDatabase() throws NamingException, SQLException { 
        ic = new InitialContext();
        ds = (DataSource) ic.lookup("java:jboss/datasources/SampleDS");
        connection = ds.getConnection();
    }
    	
    public static Pair getPairById (int gameId, int questionId) throws SQLException, NamingException {
        connectToDatabase();
        stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery( "select * from pairs where (game_id = " + gameId + ") AND (question_id =" + questionId + ") ");
        Pair pair = new Pair();
        rs.next();
        int gameId1 = rs.getInt("game_id");
        int questionId1 = rs.getInt("question_id");
        int orderNum = rs.getInt("order_number");
        Boolean is_correct = rs.getBoolean("is_correct");
        pair.setGameId(gameId1);
        pair.setIsCorrect(is_correct);
        pair.setOrderNumber(orderNum);
        pair.setQuestionId(questionId1);
        rs.close();
        stmt.close();
        connection.close();
        return pair;
    }
	
    static public void insertPair (Pair pair) throws NamingException, SQLException {
        connectToDatabase();
        stmt = connection.createStatement();
        stmt.executeUpdate( "insert into pairs values (" + pair.getGameId() + "," +
                pair.getQuestionId() 
                + "," + pair.getOrderNumber() +"," + pair.getIsCorrect() + ")");
        stmt.close();
        connection.close();	
    }
	
    static public void updatePair (Pair pair) throws NamingException, SQLException {
        connectToDatabase();
        stmt = connection.createStatement();
        stmt.executeUpdate( "update pairs set order_number = " + pair.getOrderNumber() +
                ", is_correct = "+ pair.getIsCorrect() + " where (game_id = " + 
                pair.getGameId() + " and question_id = " + pair.getQuestionId() + ")");
        stmt.close();
        connection.close();	
    }
        
    public static void deletePair(int game_id) throws SQLException, NamingException{
        connectToDatabase();
        stmt = connection.createStatement();
        stmt.executeUpdate("delete from pairs where game_id="+game_id);
        stmt.close();
        connection.close();
    }

}

