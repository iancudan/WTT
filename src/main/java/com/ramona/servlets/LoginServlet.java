package com.ramona.servlets;

import DB.DatabaseOperation;
import WTT.Email;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Silviu Iancu on 4/2/2018.
 */
@WebServlet("/userlogin")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //email
        int nrMesaje = 0;
        DatabaseOperation db = new DatabaseOperation();
        List<Email> messages = db.getEmail();
        for(Email e :messages){
            if(e.getEmailRead() == 0)
                nrMesaje++;
        }
        String numarMesaje = String.valueOf(nrMesaje);


        //login

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userRole = db.logIn(username,password);
        String adminEmail = "admin@email.com";
        //session


        //
        if(userRole.equals("utilizator") || userRole.equals("ADMIN")) {
            //seteaza variabile
            request.getSession().setAttribute("adminEmail",adminEmail);
            request.getSession().setAttribute("emailFrom",username);
            request.getSession().setAttribute("messages",messages);
            request.getSession().setAttribute("numarMesaje",numarMesaje);
            request.getSession().setAttribute("userRole",userRole);
            request.getSession().setAttribute("username",username);
            response.sendRedirect("dashboard.jsp");
            return;
        }
        else {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Utilizator or password incorrect');");
            out.println("location='404.jsp';");
            out.println("</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}
