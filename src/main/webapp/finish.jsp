
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: DK
  Date: 23.10.2022
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="background-color: black; color: white">
<%
    if(session.getAttribute("username") == null)
    {
        response.sendRedirect("index.jsp");
    }
%>
<link href="css2.css" rel="stylesheet">
    <h1>You did it! This your prize! The painting on the wall is a seed for ether wallet. There is 0.1 ether on it.</br>
        But you need to find the right order for the words to use the waller, cause they are written randomly</h1>
<%
    String user = (String)session.getAttribute("username");
    Date createTime = new Date(session.getCreationTime());
%>
<table border = "1" align = "center">
    <tr bgcolor = "#949494">
        <th>Session info</th>
        <th>Value</th>
    </tr>
    <tr>
        <td>Creation Time</td>
        <td><% out.print(createTime); %></td>
    </tr>
    <tr>
        <td>User ID</td>
        <td><% out.print(user); %></td>
    </tr>
    <tr>
        <td>Number of tries</td>
        <td><% out.println(session.getAttribute("numberOfGames"));%> </td>
    </tr>
</table>
</html>
