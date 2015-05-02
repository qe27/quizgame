<%@ page language="java" contentType="text/html; charset=utf-8"
import = "java.io.IOException,
                                    java.sql.DriverManager,
                                    java.sql.Connection,
                                    java.sql.ResultSet,
                                    java.sql.SQLException,
                                    java.sql.Statement,
                                    javax.naming.InitialContext,
                                    javax.servlet.ServletException,
                                    javax.servlet.annotation.WebServlet,
                                    javax.servlet.http.HttpServlet,
                                    javax.servlet.http.HttpServletRequest,
                                    javax.servlet.http.HttpServletResponse,
                                    javax.sql.DataSource"
   
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Игры</title>
</head>
<body>

 <form action="index.jsp">
                      <button type="submit" name="game">
                          <i>
                          <FONT>
                           Главная страница</FONT> 
                          </i>
                      </button> 
            </form>
            
             <form action="NewGame.jsp">
                      <button type="submit" name="game">
                          <i>
                          <FONT>
                           Начать игру</FONT> 
                          </i>
                      </button> 
            </form>
            
                         <form action="rating.jsp">
                      <button type="submit" name="game">
                          <i>
                          <FONT>
                           Рейтинг</FONT> 
                          </i>
                      </button> 
            </form>
<p>Список игр:</p>
<ul>
            <%
        	final Connection c;
    		final Statement stmt;
    		DataSource ds = null;
			InitialContext ic;
			ic = new InitialContext();
		       ds = (DataSource) ic.lookup("java:jboss/datasources/SampleDS");
    			c = ds.getConnection();
    		//	out.println("Connected");
    			stmt = c.createStatement();
    			int i = 0;
    	        ResultSet rs = stmt.executeQuery( "select * from games");
    			//out.println("Created");
    	        while ( rs.next() ) {
    	        	i++;
    	            int gameId = rs.getInt("id");
    	            Boolean finished  = rs.getBoolean("finished");
    	            %>
	<li style="margin-left: 40px;"><%= "Игра " + gameId + ", Закончена: " + finished %></li>
	<% } %>
</ul>

</body>
</html>