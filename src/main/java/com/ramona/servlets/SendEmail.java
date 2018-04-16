package com.ramona.servlets;

import WTT.SendGmail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Silviu Iancu on 4/2/2018.
 */
@WebServlet("/sendemail")
public class SendEmail extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SendGmail e = new SendGmail();
        String nume = request.getParameter("nameCreate");
        String email = request.getParameter("passwordCreate");
        String password = request.getParameter("emailCreate");
        e.sendEmail(nume,email,password);
        response.sendRedirect("login.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     //cum mai fac un jsp si sa fac redirect catre el?
    }
}
