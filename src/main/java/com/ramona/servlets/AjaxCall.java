package com.ramona.servlets;

import DB.DatabaseOperation;
import scala.util.parsing.combinator.testing.Str;

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
            Integer nr = 0;
            if(numarMesaje - 1 >=0)
                nr = numarMesaje-1;
            else
                nr = 0;

            request.getSession().setAttribute("numarMesaje",String.valueOf(nr));
        }

        if(method.equals("replyEmail")){
            String emailSubject   = request.getParameter("emailSubject");
            String emailTo   = request.getParameter("emailTo");
            String emailFrom   = request.getParameter("emailFrom");

            request.getSession().setAttribute("emailSubject",emailSubject);
            request.getSession().setAttribute("emailTo",emailTo);
            request.getSession().setAttribute("emailFrom",emailFrom);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatabaseOperation db = new DatabaseOperation();
        String method= request.getParameter("method");
        if(method.equals("searchHotel")){
         /*   String lat   = request.getParameter("lat");
            String lon   = request.getParameter("long");
            //
            request.getSession().setAttribute("lat",lat);
            request.getSession().setAttribute("lon",lon);
*/            response.sendRedirect("mapsHotel.jsp");

        }
        if(method.equals("searchPlaces")){
            String lat   = request.getParameter("lat");
            String lon   = request.getParameter("long");
            //
            request.getSession().setAttribute("lat",lat);
            request.getSession().setAttribute("lon",lon);
            response.sendRedirect("mapsNearbyplaces.jsp");
        }
    }
}
