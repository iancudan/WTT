package com.ramona.servlets;

import DB.DatabaseOperation;
import WTT.SendGmail;
import WTT.Utilizator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static WTT.SendGmail.codUnicDeIndentificare;
import static WTT.SendGmail.getSaltString;

/**
 * Created by Silviu Iancu on 4/2/2018.
 */
@WebServlet("/sendemail")
public class SendEmail extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("nameCreate");
        String password= request.getParameter("passwordCreate");
        String email = request.getParameter("emailCreate");

        DatabaseOperation db = new DatabaseOperation();
        int unique =  db.checkUniqueEmail(email);
        if(unique == 0){
            getSaltString();
            Utilizator  utilizator = new Utilizator();
            utilizator.setNume(name);
            utilizator.setEmail(email);
            utilizator.setParola(password);
            utilizator.setCodConfirmare(codUnicDeIndentificare);
            db.insertUtilizator(utilizator);

            SendGmail e = new SendGmail();
            e.sendEmail(name,email,password);

            response.sendRedirect("login.jsp");
        }else{
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Email deja folosit');");
            out.println("location='404.jsp';");
            out.println("</script>");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     //cum mai fac un jsp si sa fac redirect catre el?
    }
}
