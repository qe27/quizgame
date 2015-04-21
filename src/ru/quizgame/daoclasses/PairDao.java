package ru.quizgame.daoclasses;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import ru.quizgame.entityclasses.Pair;

public class PairDao {
	
	static public Pair getPairById (int gameId, int questionId) throws SQLException, NamingException {
		Connection c;
		Statement stmt;
		DataSource ds = null;
		InitialContext ic;
		ic = new InitialContext();
	       ds = (DataSource) ic.lookup("java:jboss/datasources/SampleDS");
	       c = ds.getConnection();
			stmt = c.createStatement();
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
			stmt.close();
			c.close();
			return pair;
	}
	
	static public void insertPair (Pair pair) throws NamingException, SQLException {
		
		Connection c;
		Statement stmt;
		DataSource ds = null;
		InitialContext ic;
		ic = new InitialContext();
	       ds = (DataSource) ic.lookup("java:jboss/datasources/SampleDS");
	       c = ds.getConnection();
			stmt = c.createStatement();
			stmt.executeUpdate( "insert into pairs values (" + pair.getGameId() + "," + pair.getQuestionId() + "," + pair.getOrderNumber() +"," + pair.getIsCorrect() + ")");
			stmt.close();
			c.close();
		
	}
	
	static public void updatePair (Pair pair) throws NamingException, SQLException {
		
		Connection c;
		Statement stmt;
		DataSource ds = null;
		InitialContext ic;
		ic = new InitialContext();
	       ds = (DataSource) ic.lookup("java:jboss/datasources/SampleDS");
	       c = ds.getConnection();
			stmt = c.createStatement();
			stmt.executeUpdate( "update pairs set order_number = " + pair.getOrderNumber() + ", is_correct = "+ pair.getIsCorrect() + " + where (game_id = " + pair.getGameId() + " and question_id = " + pair.getQuestionId() + ")");
			stmt.close();
			c.close();
		
	}

}

