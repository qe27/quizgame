<%@ page language="java" contentType="text/html"   
    pageEncoding="windows-1251"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>����</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <form action="index.jsp">
        <button type="submit" name="game">
            ������� ��������
        </button> 
    </form>
     <form action="GameList.jsp">
        <button type="submit" name="game">
            ������ ���
        </button> 
    </form>
    <form action="rating">
        <button type="submit" name="game">
            �������
        </button> 
    </form>   
    <form action="addQues.jsp">
        <button type="submit" name="game">
            �������� ������
        </button> 
    </form>
<form name="test" method="post" action="NewGameServlet">
  <p><b>���� ��� </b>(�� ����� 20 ��������, ������� � ���������� �����):<br>
   <input type="text" name = "name" size="40">
  </p>
  <p><button type="submit">������� ����</button>
 </form>

</body>
</html>