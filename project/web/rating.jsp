<%@page contentType="text/html" pageEncoding="windows-1251" import = "java.util.*, java.io.*, java.sql.*,
        javax.sql.*, javax.naming.InitialContext, 
        ru.quizgame.entityclasses.User, ru.quizgame.daoclasses.UserDao,         
        ru.quizgame.daoclasses.GameDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Рейтинг</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
        <form action="index.jsp">
            <button type="submit" name="game">
                Главная страница
            </button> 
        </form>
         <form action="GameList.jsp">
            <button type="submit" name="game">
                Список игр
            </button> 
        </form>
        <form action="rating">
            <button type="submit" name="game">
                Рейтинг
            </button> 
        </form>   
        <form action="addQues.jsp">
            <button type="submit" name="game">
                Добавить вопрос
            </button> 
        </form>
        <h1>
            Рейтинг
        </h1>
        <form method="POST" action="rating">
            <p>Имя: <input type="text" name="searchString" width="40"></p>
        </form>
        <table border="1" width="600">
        <tr>
            <th>Имя</th>
            <th>Очки</th>
            <th>Правильных ответов</th>
            <th>Сыграно игр</th>
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
    </body>
</html>
