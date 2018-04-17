package com.ramona.servlets;

import DB.DatabaseOperation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Silviu Iancu on 4/2/2018.
 */
@WebServlet("/ajaxcall")
public class AjaxCall extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DatabaseOperation db = new DatabaseOperation();
        String method= request.getParameter("method");

        if(method.equals("readEmail")){
            String idEmail   = request.getParameter("id");
            db.readEmail(idEmail);
            Integer numarMesaje= Integer.parseInt(request.getSession().getAttribute("numarMesaje").toString());
            request.getSession().setAttribute("numarMesaje",numarMesaje--);


        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
