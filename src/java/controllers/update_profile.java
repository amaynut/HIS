/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import database.ConnectToDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.user;

/**
 *
 * @author Said
 */
public class update_profile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // get the connection object
            Connection conn = ConnectToDB.ConnectToMySQL();
            // get the parameters values
            String type = request.getParameter("userType");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String birthday = request.getParameter("birthday");
            String phone = request.getParameter("phone");
            String street = request.getParameter("street");
            String zipCode = request.getParameter("zipCode");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String country = request.getParameter("Country");

            //form the query
            String query = "UPDATE hospital." + type + " SET email='" + email + "',password='" + password + "', firstName='" + firstName + "',lastName= '" + lastName
                    + "',DateOfBirth= '" + birthday + "',phone ='" + phone + "',street= '" + street + "',zipCode= '" + zipCode + "', city='" + city
                    + "', state='" + state + "',country='" + country + "' WHERE email ='" + email + "'";
            int result = 0;
            try {
                // make the statment
                Statement statement = conn.createStatement();
                // execute the query
                result = statement.executeUpdate(query);

            } catch (SQLException ex) {
                out.write(ex.getMessage());
            }
            try {
                conn.close();
            } catch (SQLException ex) {
                out.write("The connexion the the DB couldn't be closed. <br>");
                out.write(ex.getMessage());
            }
            if (result != 0) {
                 // Update the user bean for the current user
                // get the user bean from the session
                user u = (user) request.getSession().getAttribute("user");
                u.setFirstName(firstName);
                u.setLastName(lastName);
                u.setEmail(email);
                u.setPassword(password);
                u.setPhone(phone);
                u.setBirthday(birthday);
                u.setStreet(street);
                u.setCity(city);
                u.setZipCode(zipCode);
                u.setState(state);
                u.setCountry(country);
                // send the success message as answer
                out.write("Your profile was updated");
            }
            else {
                out.write("Warning: You profile was not updated");
                out.write("<br>"+query);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
