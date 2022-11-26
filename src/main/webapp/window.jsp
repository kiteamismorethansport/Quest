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
<form action="window.jsp">
    <h1>It's to high to reach<br>
    </h1>
    <input type="radio" id="one" name="id" value="one">
    <label for="one">Walk back</label><br>
    <input type="radio" id="two" name="id" value="two">
    <label for="two">No</label><br>
    <% String chairFor = (String)session.getAttribute("chair");
    if (chairFor!= null && chairFor.equals("chair")) {
        out.println("<input type=\"radio\" id=\"three\" name=\"id\" value=\"three\">\n" +
                "    <label for=\"three\">Put the chair under the window</label><br>");
    }
            %>
    <%
        String chairMoved = (String)session.getAttribute("chairUnderTheWindow");
        if (chairMoved!= null && chairMoved.equals("chairUnderTheWindow")) {
            out.println("<input type=\"radio\" id=\"four\" name=\"id\" value=\"four\">\n" +
                    "    <label for=\"three\">Try to reach the window again</label><br>");
        }
    %>
    <input type="submit" value="Submit">
</form>
<%
    String s = request.getParameter("id");
    if (s!=null && s.equals("one")){
        response.sendRedirect("room.jsp");

    }
    if (s!=null && s.equals("two")){
        response.sendRedirect("window.jsp");
    }
    if (s!=null && s.equals("three")){
        session.setAttribute("chairUnderTheWindow", "chairUnderTheWindow");
        response.sendRedirect("window.jsp");
    }
    if (s!=null && s.equals("four")){
        response.sendRedirect("onTheWindow.jsp");
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