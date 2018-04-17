package com.ramona.servlets;

import DB.DatabaseOperation;
import WTT.Email;
import WTT.Utilizator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Silviu Iancu on 4/2/2018.
 */
@WebServlet("/messages")
public class Message extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     //cum mai fac un jsp si sa fac redirect catre el?
        DatabaseOperation db = new DatabaseOperation();
        String userName =request.getSession().getAttribute("username").toString();
        List<Email> messages = db.getEmail(userName);
        int nrMesaje = 0;
        for(Email e :messages){
            if(e.getEmailRead() == 0)
                nrMesaje++;
        }
        String numarMesaje = String.valueOf(nrMesaje);

        request.getSession().setAttribute("numarMesaje",numarMesaje);
        request.getSession().setAttribute("messages",messages);
        response.sendRedirect("messages.jsp");
    }
}
