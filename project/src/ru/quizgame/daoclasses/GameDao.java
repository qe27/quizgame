package ru.quizgame.daoclasses;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import ru.quizgame.entityclasses.Game;


public class GameDao {
    private static Connection c;
    private static DataSource ds;
    private static Statement stmt;
    private static InitialContext ic;
    
    public static void connectToDatabase() throws  SQLException, NamingException { 
        ic = new InitialContext();
        ds = (DataSource) ic.lookup("java:jboss/datasources/SampleDS");
        c = ds.getConnection();
    }
    
   
    public static Game getGame(int id) throws SQLException, NamingException {    
        connectToDatabase();
        stmt = c.createStatement();
        ResultSet rs = stmt.executeQuery("select * from games where id=" + id);
        rs.next();
        int player_id=rs.getInt("player_id");
        int score=rs.getInt("score");
        boolean finished=rs.getBoolean("finished");  
        rs.close();
        stmt.close();
        c.close();
        return new Game(id, player_id,score,finished);          
    }
    
    public static int getGameCount(int player_id) throws SQLException, NamingException {    
        connectToDatabase();
        stmt = c.createStatement();
        ResultSet rs = stmt.executeQuery("select count(*) as cnt from games,users " + 
                "where users.id = games.player_id and users.id=" + player_id);
        rs.next();
        int count=rs.getInt("cnt");
        rs.close();
        stmt.close();
        c.close();
        return count;          
    }
    
    
    public static void insertGame (Game game) throws NamingException, SQLException {     
        connectToDatabase();
        stmt = c.createStatement();
        stmt.executeUpdate("insert into games values(" +
               game.getId() + ", "+ game.getPlayer_id()+","+game.getScore()+", "+game.getFinished()+")");
        stmt.close();
        c.close();  
    }
    
    public static void updateGame (Game game) throws NamingException, SQLException {    
        connectToDatabase();
        stmt = c.createStatement();
        stmt.executeUpdate("update games set player_id="+game.getPlayer_id()+",score="+
                game.getScore()+",finished="+game.getFinished()+" where id="+game.getId());
        stmt.close();
        c.close();
    }
      
}