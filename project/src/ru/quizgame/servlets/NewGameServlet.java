package ru.quizgame.servlets;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import static java.nio.charset.StandardCharsets.ISO_8859_1;
import static java.nio.charset.StandardCharsets.UTF_8;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import ru.quizgame.daoclasses.GameDao;
import ru.quizgame.daoclasses.UserDao;
import ru.quizgame.entityclasses.Game;
import ru.quizgame.entityclasses.User;
public class NewGameServlet extends HttpServlet {
	boolean ok;
	private void CreateGame (HttpServletRequest request, HttpServletResponse response) throws NamingException, 
         SQLException,UnsupportedEncodingException {
		//request.setCharacterEncoding("Cp1251");
                String name = new String(request.getParameter("name").getBytes(ISO_8859_1), UTF_8);
                Pattern pattern = Pattern.compile("\\p{L}+");
                Matcher matcher = pattern.matcher(name);
                ok = matcher.matches() && name.length() <= 20;
		int id = 0;
		if (name != null && ok) {
			try { 
				id = UserDao.getUserByName(name).getId();
			}
			catch (SQLException e) {
					id = findLastUserId();
					User user = new User (id, name);
					
						UserDao.insertUser(user);
			}
			
			int gameId = findLastGameId();
			Game game = new Game (gameId, id, 0, false);
			GameDao.insertGame(game);
		}
		return;
	}
	
	public static int findLastGameId() throws NamingException, SQLException {
		final Connection c;
		final Statement stmt;
		int id;
			DataSource ds = null;
			InitialContext ic;
			ic = new InitialContext();
		       ds = (DataSource) ic.lookup("java:jboss/datasources/SampleDS");
		//	ds = (DataSource) ic.lookup("java:/SampleDS");
		       
			//c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres",
			 //       "admin", "123");
		//	out.println("Connected");
		       c=ds.getConnection();
			stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery( "select count(id) from games");
			rs.next();
			id = rs.getInt("count");
                        rs.close();
			stmt.close();
			c.close();
		return id+1;
	}
	
	private int findLastUserId() throws SQLException, NamingException {
		final Connection c;
		final Statement stmt;
		int id;
			DataSource ds = null;
			InitialContext ic;
			ic = new InitialContext();
		       ds = (DataSource) ic.lookup("java:jboss/datasources/SampleDS");
		//	ds = (DataSource) ic.lookup("java:/SampleDS");
		       
			//c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres",
			 //       "admin", "123");
		//	out.println("Connected");
		       c=ds.getConnection();
			stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery( "select count(id) from users");
			rs.next();
			id = rs.getInt("count");
                        rs.close();
			stmt.close();
			c.close();
		return id+1;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			CreateGame(request, response);
			if (ok) getServletContext().getRequestDispatcher(
			        response.encodeRedirectURL("/game.jsp")).forward(request, response);
                        else getServletContext().getRequestDispatcher(
			        response.encodeRedirectURL("/NewGame.jsp")).forward(request, response);
		} catch (NamingException e) {
			getServletContext().getRequestDispatcher(
			        response.encodeRedirectURL("/nameEx")).forward(request, response);
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			getServletContext().getRequestDispatcher(
			        response.encodeRedirectURL("" + e)).forward(request, response);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return;
	}
	
	
}
