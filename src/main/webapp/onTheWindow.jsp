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
<form action="onTheWindow.jsp">
  <h1>
      <% String dog = (String)session.getAttribute("dogIsPlaying");
    if (dog!= null && dog.equals("dogIsPlaying")) {
        out.println("Welldone, dog is playing now!");
        out.println("Your next step is?");
    }
    %>

  <br>Congrat's, you're almost there! You are on the window now. It's too high to jump of to get out.</br>
      And there is one more problem. The big agressive dog is barking in front of the house!
      Your next move will be?
    </br>
  </h1>
  <input type="radio" id="one" name="id" value="one">
  <label for="one">Jump of anyway</label><br>
  <input type="radio" id="two" name="id" value="two">
  <label for="two">Get back to the room</label><br>
  <% String ball = (String)session.getAttribute("ball");
    if (ball!= null && ball.equals("ball")) {
      out.println("<input type=\"radio\" id=\"three\" name=\"id\" value=\"three\">\n" +
              "    <label for=\"three\">Throw the ball to the dog</label><br>");
    }
  %>
  <%
    String rope = (String)session.getAttribute("chosen");
    if (rope!= null && rope.equals("rope")) {
      out.println("<input type=\"radio\" id=\"four\" name=\"id\" value=\"four\">\n" +
              "    <label for=\"three\">Attach rope to the window, throw it down and escape</label><br>");
    }
  %>
  <input type="submit" value="Submit">
</form>
<%
  String s = request.getParameter("id");
  if (s!=null && s.equals("one")){
    response.sendRedirect("gameover.jsp");

  }
  if (s!=null && s.equals("two")){
    response.sendRedirect("room.jsp");
  }
  if (s!=null && s.equals("three")){
    session.setAttribute("dogIsPlaying", "dogIsPlaying");
    response.sendRedirect("dogIsPlaying.jsp");
  }
  if (s!=null && s.equals("four")){
    if (dog!= null && dog.equals("dogIsPlaying")) {
      response.sendRedirect("finish.jsp");
    }
    else response.sendRedirect("hello");
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