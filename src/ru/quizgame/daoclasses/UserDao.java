package ru.quizgame.daoclasses;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import ru.quizgame.entityclasses.User;

public class UserDao {

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
			stmt.close();
			c.close();
			return user;
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


