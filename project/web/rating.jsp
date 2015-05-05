<%@page contentType="text/html" pageEncoding="windows-1251" import = "java.util.*, java.io.*, java.sql.*,
        javax.sql.*, javax.naming.InitialContext, 
        ru.quizgame.entityclasses.User, ru.quizgame.daoclasses.UserDao,         
        ru.quizgame.daoclasses.GameDao" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>�������</title>
    </head>
    <body>
        <form action="index.jsp">
                  <button type="submit" name="game">
                      <i>
                      <FONT>
                       ������� ��������</FONT> 
                      </i>
                  </button> 
        </form>

        <form action="GameList.jsp">
                  <button type="submit" name="game">
                      <i>
                      <FONT>
                       ������ ���</FONT> 
                      </i>
                  </button> 
        </form>

        <form action="rating">
                  <button type="submit" name="game">
                      <i>
                      <FONT>
                       �������</FONT> 
                      </i>
                  </button> 
        </form>
        <br>
        <p>
            <b><font size="24" >�������</font></b>
        </p>
        <br>
        <p>
            <form method="POST" action="rating">���: <input type="text" name="searchString" width="40">
            </form>
        </p>
        <br>
        <p>
        <table border="1" width="600">
        <tr>
            <th>���</th>
            <th>����</th>
            <th>���������� �������</th>
            <th>������� ���</th>
        </tr>
        
        <%
            DataSource ds = null;
            Connection con = null;
            Statement stmt = null;
            InitialContext ic;
            String result = new String();
            try {
                ic = new InitialContext();
                ds = (DataSource) ic.lookup("java:jboss/datasources/SampleDS");
                con = ds.getConnection();
                stmt = con.createStatement();
                List<User> list = UserDao.getAllUsers();
                for(User user: list) { 
                    if(request.getAttribute("searchString") == null || 
                    user.getName().startsWith((String)request.getAttribute("searchString"))) {%>
                <tr>
                    <td width="200"><b><%=user.getName()%></b></td>
                    <td width="200"><%=UserDao.getPoints(user.getId())%></td>
                    <td width="200"><%=(int)(10000 * UserDao.getHitRatio(user.getId()))/100.0 + "%"%></td>
                    <td width="200"><%=GameDao.getGameCount(user.getId())%></td>
                </tr>              
                <%  }
                }    
                stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    stmt.close();
                    con.close();
                } catch(SQLException e){
                    e.printStackTrace();
                }
            }
        %>
        </table>
        </p>
    </body>
</html>
