package com.ramona.servlets;

import DB.DatabaseOperation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Silviu Iancu on 4/2/2018.
 */
@WebServlet("/checkCode")
public class CheckCode extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("codeV");
        String email = request.getParameter("emailV");
        DatabaseOperation db = new DatabaseOperation();
        String confirmationCode = db.checkConfirmationCode(email);
        if(confirmationCode.equals(code)) {
            db.activateUser(email);
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('your code is correct and your account is active');");
            out.println("location='login.jsp';");
            out.println("</script>");
        }else{
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Code incorrect');");
            out.println("location='404.jsp';");
            out.println("</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
