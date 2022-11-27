<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%
    if(session.getAttribute("username") == null)
    {
        response.sendRedirect("index.jsp");
    }
%>
<body style="background-color: black; color: white">
<link href="css.css" rel="stylesheet">
<h1>GAME OVER</h1>
<% int i = (Integer)(session.getAttribute("numberOfGames"))+1;
session.setAttribute("numberOfGames", i );
    session.setAttribute("chosen", null);
    session.setAttribute("ball", null);
    session.setAttribute("chair", null);
%>
<form action = first.jsp>
    <input type = "submit" value = "Start again">
</form>
</body>
</html>