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
@WebServlet("/userSecurity")
public class UserSecurity extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatabaseOperation db = new DatabaseOperation();
        String email = request.getParameter("emailProfile").toString();
        String pass = request.getParameter("passProfile").toString();
        String repeatPass = request.getParameter("repeatPassProfile").toString();
        String newPass = request.getParameter("newPassProfile").toString();

        if (pass.equals(repeatPass)){
            //update user
            db.updateUserPass(email,newPass,pass);
            response.sendRedirect("userProfile.jsp");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("userProfile.jsp");
    }
}
