<%-- 
    Document   : addQues
    Created on : 11.04.2015, 15:29:07
    Author     : ����
--%>


<%@page contentType="text/html" pageEncoding="windows-1251"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>���� "���������"</title>
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
 
        <h2>�������� ������ � �������� �������</h2>
        <form action="AddQuesServlet" method="post">
            <table border="1" cellpadding=0>

                <td>������ <br>
                    &nbsp;  <textarea name="ques" rows="2" cols="45"></textarea><br>
                �������� ������<br>
                1<input type="text" name="a1" size="70"><br>
                2<input type="text" name="a2" size="70"><br>
                3<input type="text" name="a3" size="70"><br>
                4<input type="text" name="a4" size="70"><br>
                &nbsp; ������� � ����������� ������ <input type="text" name="ta" size="1"><br>
                &nbsp;&nbsp;������� ��������� ������� <input type="text" name="dif" size="2">
                &nbsp;&nbsp;
                </td>
            </table>
            <br>
            
            <table>
                <tr>                 
                    <button type="submit" name="back">
                              <i>
                              <FONT SIZE=4 FACE="Arial" WIDTH="5">�����</FONT> 
                              </i>
                    </button> 

                </tr>
                <tr>
                    <button type="submit" name="addq">
                              <i>
                              <FONT SIZE=4 FACE="Arial" WIDTH="5">��������</FONT> 
                              </i>
                    </button> 
                </tr>            
            </table>
        </form>
        
    </body>
</html>

