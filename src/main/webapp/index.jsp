<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Questgame</title>
</head>

<link href="css.css" rel="stylesheet">
<body style="background-color: black; color: white">
<img src="images/intro.jpg" alt="introImage">
</br>
<h1><%= "WELCOME TO THE MYSTERIOUS QUEST"%>
</h1>
<br/>
<form  action="index.jsp">
    Enter nickname: <input type="text" name="firstname"/>
</br>
</br>
    <input type = "submit" value = "Submit">
</form>
</br>
<h1>
<%
    String uname =request.getParameter("firstname");
    Integer entries = 0;
    Integer game = 1;
    session.setAttribute("username", uname);
    session.setAttribute("numberOfEntries", entries);
    session.setAttribute("numberOfGames", game);
    String s[] = request.getParameterValues("firstname");
    if (s != null && s.length != 0) {
        out.println("Welcome: ");
        for (int i = 0; i < s.length; i++) {
            out.println(s[i]);
        }


            out.println("If you ready to start, press the button: </br>");
            out.println("<button name=\"button\" value=\"OK\" type=\"button\" onclick=\"document.location.href='first.jsp';\">\n" +
                    "    Lets go </button>");

    }
%>
</h1>
</br>

</body>
</html>