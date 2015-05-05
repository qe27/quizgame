package ru.quizgame.daoclasses;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import ru.quizgame.entityclasses.User;

public class UserDao {

	static public List<User> getAllUsers() throws SQLException, NamingException {
		Connection c;
		Statement stmt;
		DataSource ds = null;
		InitialContext ic;
		ic = new InitialContext();
	        ds = (DataSource) ic.lookup("java:jboss/datasources/SampleDS");
		       c = ds.getConnection();
			stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery( "select * from users ");
                        List<User> list = new ArrayList<User>();
			while (rs.next()) {
                            User user = new User();
                            int Id1 = rs.getInt("id");
                            String name = rs.getString("name");
                            user.setId(Id1);
                            user.setName(name);
                            list.add(user);
                        }
                        rs.close();
			stmt.close();
			c.close();
			return list;
	}
        
        static public User getUserById (int id) throws SQLException, NamingException {
		Connection c;
		Statement stmt;
		DataSource ds = null;
		InitialContext ic;
		ic = new InitialContext();
	       ds = (DataSource) ic.lookup("java:jboss/datasources/SampleDS");
		       c = ds.getConnection();
			stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery( "select * from users where (id  = " + id + ")");
			User user = new User();
			rs.next();
			int Id1 = rs.getInt("id");
			String name = rs.getString("name");
			user.setId(Id1);
			user.setName(name);
                        rs.close();
			stmt.close();
			c.close();
			return user;
	}
        
        static public User getUserByName (String name) throws SQLException, NamingException {
    		Connection c;
    		Statement stmt;
    		DataSource ds = null;
    		InitialContext ic;
    		ic = new InitialContext();
    	       ds = (DataSource) ic.lookup("java:jboss/datasources/SampleDS");
    		       c = ds.getConnection();
    			stmt = c.createStatement();
    			ResultSet rs = stmt.executeQuery( "select * from users where (name  = '" + name + "')");
    			User user = new User();
    			rs.next();
    			int Id1 = rs.getInt("id");
    			String name1 = rs.getString("name");
    			user.setId(Id1);
    			user.setName(name1);
                        rs.close();
    			stmt.close();
    			c.close();
    			return user;
    	}
        
        static public int getPoints (int id) throws SQLException, NamingException {
		Connection c;
		Statement stmt;
		DataSource ds = null;
		InitialContext ic;
		ic = new InitialContext();
	       ds = (DataSource) ic.lookup("java:jboss/datasources/SampleDS");
		       c = ds.getConnection();
			stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery(
                                "select sum(score) points from users, games "
                                + "where users.id = " + id + 
                                " and users.id = games.player_id");
			User user = new User();
			rs.next();
			int result = rs.getInt("points");
                        rs.close();
			stmt.close();
			c.close();
			return result;
	}
	
        static public int getTotalAnswers (int id) throws SQLException, NamingException {
		Connection c;
		Statement stmt;
		DataSource ds = null;
		InitialContext ic;
		ic = new InitialContext();
	       ds = (DataSource) ic.lookup("java:jboss/datasources/SampleDS");
		       c = ds.getConnection();
			stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery(
                        "select count(*) ans from users, games, pairs " + 
                        "where users.id = " + id + 
                        " and users.id = games.player_id " + 
                        "and games.id = pairs.game_id");
			rs.next();
			int result = rs.getInt("ans");
                        rs.close();
			stmt.close();
			c.close();
			return result;
	}
        
        static public int getCorrectAnswers (int id) throws SQLException, NamingException {
		Connection c;
		Statement stmt;
		DataSource ds = null;
		InitialContext ic;
		ic = new InitialContext();
	       ds = (DataSource) ic.lookup("java:jboss/datasources/SampleDS");
		       c = ds.getConnection();
			stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery(
                        "select count(*) ans from users, games, pairs "
                        + "where users.id = " + id + 
                        " and users.id = games.player_id and games.id = pairs.game_id" + 
                        " and is_correct");
			rs.next();
			int result = rs.getInt("ans");
                        rs.close();
			stmt.close();
			c.close();
			return result;
	}
        
        static public double getHitRatio (int id) throws SQLException, NamingException {
            return (double) getCorrectAnswers(id) / getTotalAnswers(id);
        }
        
	static public void updateUser (User user) throws NamingException, SQLException {
		Connection c;
		Statement stmt;
		DataSource ds = null;
		InitialContext ic;
		ic = new InitialContext();
		ds = (DataSource) ic.lookup("java:jboss/datasources/SampleDS");
	       c = ds.getConnection();
			stmt = c.createStatement();
			stmt.executeUpdate( "update users set name = '" + user.getName() + "' where (id = " + user.getId() + ")");
			stmt.close();
			c.close();
		
	}
	
	static public void insertUser (User user) throws NamingException, SQLException {
		Connection c;
		Statement stmt;
		DataSource ds = null;
		InitialContext ic;
		ic = new InitialContext();
	       ds = (DataSource) ic.lookup("java:jboss/datasources/SampleDS");
		       c = ds.getConnection();
			stmt = c.createStatement();
			stmt.executeUpdate( "insert into users values (" + user.getId() + ", '" + user.getName() + "')");
			stmt.close();
			c.close();
	}
	
	
}