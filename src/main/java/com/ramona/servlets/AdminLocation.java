package com.ramona.servlets;

import DB.DatabaseOperation;
import WTT.Locatii;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Silviu Iancu on 4/2/2018.
 */
@WebServlet("/adminlocation")
public class AdminLocation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     //cum mai fac un jsp si sa fac redirect catre el?
        DatabaseOperation db = new DatabaseOperation();
        List<Locatii> listaLocatii = db.getLocation();

        request.getSession().setAttribute("listaLocatii",listaLocatii);


        response.sendRedirect("adminLocation.jsp");
    }
}
