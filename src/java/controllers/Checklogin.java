/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.*;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import beans.*;

/**
 *
 * @author Said
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class Checklogin extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        // get the connection object
        Connection conn = ConnectToDB.ConnectToMySQL();

        try (PrintWriter out = response.getWriter()) {
            // get the Checklogin paramaters
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            // the list of users type
            String userTypeList[] = {"Doctor", "MedicalOfficer", "MedicalAssistant", "Patient"};
            // Create the statment    
            Statement statment = conn.createStatement();
            boolean connected = false;
            // excute the statment in a loop of all users type
            for (String userType : userTypeList) {
                String query = "SELECT * FROM " + "hospital." + userType
                        + " WHERE email='" + email + "'"
                        + "AND password='" + password + "'";
                ResultSet result = statment.executeQuery(query);

                // check the result
                if (result.first()) {
                    // set the user bean
                    user currentUser = new user();
                    currentUser.setFirstName(result.getString("FirstName"));
                    currentUser.setLastName(result.getString("LastName"));
                    currentUser.setEmail(result.getString("email"));
                    currentUser.setPassword(result.getString("password"));
                    currentUser.setPhone(result.getString("phone"));
                    currentUser.setBirthday(result.getString("DateOfBirth"));
                    currentUser.setStreet(result.getString("street"));
                    currentUser.setCity(result.getString("City"));
                    currentUser.setZipCode(result.getString("ZipCode"));
                    currentUser.setState(result.getString("State"));
                    currentUser.setCountry(result.getString("Country"));
                    currentUser.setType(userType);
                    currentUser.setPicture(result.getString("picture"));
                    currentUser.setLogedIn(true);
                    // store bean in session
                    request.getSession().setAttribute("user", currentUser);     
                    response.sendRedirect("jsp/home.jsp");
                        return; // stop the for loop

                }

            }
            if (!connected) {
                response.sendRedirect("login.jsp");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Checklogin.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Checklogin.class.getName()).log(Level.SEVERE, null, ex);
        }
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
