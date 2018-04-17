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
        SendGmail e = new SendGmail();
        DatabaseOperation db = new DatabaseOperation();
        //create
        String nameCreate = request.getParameter("nameCreate");
        String passwordCreate= request.getParameter("passwordCreate");
        String emailCreate = request.getParameter("emailCreate");
        //contact
        String nameContact = request.getParameter("name");
        String emailFrom = request.getParameter("emailFrom");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");


        if(nameCreate != null){
            int unique =  db.checkUniqueEmail(emailCreate);
            if(unique == 0){
                getSaltString();
                Utilizator  utilizator = new Utilizator();
                utilizator.setNume(nameCreate);
                utilizator.setEmail(emailCreate);
                utilizator.setParola(passwordCreate);
                utilizator.setCodConfirmare(codUnicDeIndentificare);
                db.insertUtilizator(utilizator);


                e.sendEmail(nameCreate,emailCreate,passwordCreate);

                response.sendRedirect("login.jsp");
            }else{
                PrintWriter out = response.getWriter();
                response.setContentType("text/html");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Email deja folosit');");
                out.println("location='404.jsp';");
                out.println("</script>");
            }
        }else if (nameContact != null){
            e.sendEmailAdmin(nameContact,email,emailFrom,subject,message);
            response.sendRedirect("success.jsp");
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

    }
}
