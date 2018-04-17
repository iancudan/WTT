package com.ramona.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Silviu Iancu on 4/2/2018.
 */
@WebServlet("/contact")
public class Contact extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("contact.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String emailFrom = request.getSession().getAttribute("emailFrom").toString();
        String emailTo = request.getSession().getAttribute("adminEmail").toString();

        request.getSession().setAttribute("emailFrom",emailFrom);
        request.getSession().setAttribute("emailTo",emailTo);
        request.getSession().setAttribute("emailSubject","Subject");

        response.sendRedirect("contact.jsp");

    }
}
