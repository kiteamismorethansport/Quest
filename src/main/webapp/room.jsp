<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: DK
  Date: 02.11.2022
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="background-color: black; color: white">
<%  response.setIntHeader("Refresh", 600);
    if(session.getAttribute("username") == null)
    {
        response.sendRedirect("index.jsp");
    }
%>
<link href="css2.css" rel="stylesheet">

<table border = "1" align = "left">
    <tr>
        <th>What's in your backpack</th>
        <th>Item one</th>
        <th>Item two</th>
        <th>Item three</th>
    </tr>
    <tr>
        <td><h3>Here you store and see </br> the items you found,</br> that can be used in the game</h3></td>
        <td><% out.print((String)session.getAttribute("chosen")); %></td>
        <td><% out.print((String)session.getAttribute("ball")); %></td>
        <td><% out.print((String)session.getAttribute("chair")); %></td>
    </tr>
</table>
</br>
</br>
</br>
</br>
</br>
</br>
</br>

<form action="room.jsp">
    <h1>You are in a black room now. You need to find the exit.</br>
        There are a couple of items in it that you can probably use.</br>
        There is a window but it’s to high to reach by yourself.</br>
        There is a closet, table, chair and one more door. Your next step.</h1>
    <input type="radio" id="one" name="id" value="one">
    <label for="one">Open the closet</label></br>
    <input type="radio" id="two" name="id" value="two">
    <label for="two">Walk back through the door you’ve entered the room</label></br>
    <input type="radio" id="three" name="id" value="three">
    <label for="three">Open another door</label></br>
    <input type="radio" id="four" name="id" value="four">
    <label for="four">Take the chair</label></br>
    <input type="radio" id="five" name="id" value="five">
    <label for="five">Try to reach the window</label>
</br>
    <input type="submit" value="Submit">
</form>

<%
    String s = request.getParameter("id");
    if (s!=null && s.equals("one")){
        response.sendRedirect("closet.jsp");

    }
    if (s!=null && s.equals("two")){
        response.sendRedirect("gameover.jsp");
    }
    if (s!=null && s.equals("three")){
        response.sendRedirect("wc.jsp");
    }
    if (s!=null && s.equals("four")){
        session.setAttribute("chair", "chair");
        response.sendRedirect("room.jsp");
    }
    if (s!= null && s.equals("five")){
        response.sendRedirect("window.jsp");
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
