<%@ page language="java" contentType="text/html" pageEncoding="windows-1251"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>����</title>
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

 <form name="test" method="post" action="NewGameServlet">
  <p><b>���� ���:</b><br>
   <input type="text" name = "name" size="40">
  </p>
  <p><input type="submit" value="������� ����">
 </form>

</body>
</html>