package com.quest.quest;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/hello")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "GAME OVER";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body style=\"background-color: black; color: white\"><link href=\"css.css\" rel=\"stylesheet\">");
        out.println("<h1>" + message + "</h1>");
        out.println("<button type=\"submit\" formaction=\"/index.jsp\">START AGAIN</button>");
        out.println("</body></html>");

    }
    public void destroy() {
    }
}