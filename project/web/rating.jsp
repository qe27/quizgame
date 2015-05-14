<%@page language="java" contentType="text/html" pageEncoding="UTF-8" import = "java.util.*, java.io.*, java.sql.*,
        javax.sql.*, javax.naming.InitialContext, 
        ru.quizgame.entityclasses.User, ru.quizgame.daoclasses.UserDao,         
        ru.quizgame.daoclasses.GameDao, ru.quizgame.auxiliaryclasses.TableSort" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Рейтинг</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
        <%@include file="/menu.jsp" %>
        <h1>
            Рейтинг
        </h1>
        <form method="POST" action="rating">
            <p>Искать имя: <input type="text" name="searchString" width="40">          
            <button type="submit" name="game">
                Искать
            </button> 
            </p>
        </form>
        <form action="rating" method="POST">
            <p>Упорядочить по: <select name="order" type="text">
             <option value="SCORE">Числу очков</option>
             <option value="HIT_RATIO">Точности ответов</option>
             <option value="GAMES">Числу игр</option>
            </select>
            <button type="submit" value="OK">OK</button>
            </p>
       </form>
        
        
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
                TableSort sorting = new TableSort();
                String order = (String) request.getAttribute("order");
                if(order == null) order = "SCORE";%>
                <table border="1" width="600">
                <tr>
                    <th>Имя</th>
                    <th><% if(TableSort.Order.valueOf(order) == TableSort.Order.SCORE) %> <font color="#8F8"><%;%>
                            Очки <% if(TableSort.Order.valueOf(order) == TableSort.Order.SCORE) %> </font> <%;%>
                    </th>
                    <th><% if(TableSort.Order.valueOf(order) == TableSort.Order.HIT_RATIO) %> <font color="#8F8"><%;%>
                            Точность ответов <% if(TableSort.Order.valueOf(order) == TableSort.Order.HIT_RATIO) %> </font> <%;%>
                    </th>
                    <th><% if(TableSort.Order.valueOf(order) == TableSort.Order.GAMES) %> <font color="#8F8"><%;%>
                            Сыграно игр <% if(TableSort.Order.valueOf(order) == TableSort.Order.GAMES) %> </font> <%;%>
                    </th>
                </tr>
                <% sorting.setOrder(TableSort.Order.valueOf(order));
                sorting.sort(list);
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
