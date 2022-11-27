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
    response.setIntHeader("Refresh", 600);
    if(session.getAttribute("username") == null)
    {
        response.sendRedirect("index.jsp");
    }
%>
<link href="css2.css" rel="stylesheet">
<form action="first.jsp">
    <h1>Once you open the door, you start the game.<br>
        In case you want to get out through the same door,  you lose.<br>
        Remember this rule. So do you want to open the door to get in and start?</h1>
    <input type="radio" id="one" name="id" value="one">
    <label for="one">Yes</label><br>
    <input type="radio" id="two" name="id" value="two">
    <label for="two">No</label><br>
    <input type="radio" id="three" name="id" value="three">
    <label for="three">I don't know</label></br>
    <input type="radio" id="four" name = "id" value="four">
    <label for = "four">I don't want to open the door</label></br>
    <input type="submit" value="Submit">

</form>
<%
    String s = request.getParameter("id");

     if (s!=null && s.equals("one")){

        response.sendRedirect("room.jsp");

    }
    if (s!=null && s.equals("two")){
        response.sendRedirect("first.jsp");
    }
    if (s!=null && s.equals("three")){
        response.sendRedirect("gameover.jsp");
    }
    if (s!=null && s.equals("four")){
        response.sendRedirect("gameover.jsp");
    }
    %>
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