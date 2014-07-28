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
import javax.servlet.http.HttpSession;

public class AddUser extends HttpServlet {

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
            //1- get the connection object
            Connection conn = ConnectToDB.ConnectToMySQL();
            //2- get the parameters values
            String type = request.getParameter("UserType");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String gender = request.getParameter("gender");
            String birthday = request.getParameter("birthday");
            String phone = request.getParameter("phone");
            String street = request.getParameter("street");
            String zipCode = request.getParameter("zipCode");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String country = request.getParameter("Country");
            String specialty = request.getParameter("specialty");
            String admissionDate = request.getParameter("checkIn");
            String checkOutDate = request.getParameter("checkOut");
                             
            String query = "";
            switch (type) {
                case "doctor":
                    query = "INSERT INTO `hospital`.`doctor`(`Email`,`Password`,`FirstName`,`LastName`,`DateOfBirth`,`Phone`,`Street`,`City`,`ZipCode`,`State`,"
                            + "`Country`,`Specialty`, `Picture`,`Gender`) VALUES"
                            + "('"+email+"'"
                            + ",'"+password+"'"
                            + ",'"+firstName+"'"
                            + ",'"+lastName +"'"
                            + ",'"+birthday +"'"
                            + ",'"+phone +"'"
                            + ",'"+street +"'"
                            + ",'"+city+"'"
                            + ",'"+zipCode +"'"
                            + ",'"+state +"'"
                            + ",'"+country +"'"
                            +",'"+specialty+"'"
                            + ", null"
                            + ",'"+gender +"')";
                    break;
                case "patient":
                    query = "INSERT INTO `hospital`.`patient`(`Email`,`Password`,`FirstName`,`LastName`,`DateOfBirth`,`Phone`,`Street`,`City`,`ZipCode`,`State`,"
                            + "`Country`,`AdmissionDate`,`CheckOutDate`,`Picture`,`Gender`) VALUES"
                            + "('"+email+"'"
                            + ",'"+password+"'"
                            + ",'"+firstName+"'"
                            + ",'"+lastName +"'"
                            + ",'"+birthday +"'"
                            + ",'"+phone +"'"
                            + ",'"+street +"'"
                            + ",'"+city+"'"
                            + ",'"+zipCode +"'"
                            + ",'"+state +"'"
                            + ",'"+country +"'"
                            + ",'"+admissionDate +"'"
                            + ",'"+checkOutDate +"'"
                            + ", null"
                            + ",'"+gender +"')";
                    break;
                default:
                    query = "INSERT INTO `hospital`."+type+"(`Email`,`Password`,`FirstName`,`LastName`,`DateOfBirth`,`Phone`,`Street`,`City`,`ZipCode`,`State`,"
                            + "`Country`,`Picture`,`Gender`) VALUES"
                            + "('"+email+"'"
                            + ",'"+password+"'"
                            + ",'"+firstName+"'"
                            + ",'"+lastName +"'"
                            + ",'"+birthday +"'"
                            + ",'"+phone +"'"
                            + ",'"+street +"'"
                            + ",'"+city+"'"
                            + ",'"+zipCode +"'"
                            + ",'"+state +"'"
                            + ",'"+country +"'"
                            + ", null"
                            + ",'"+gender +"')";
                    break;
            }
             out.print("<br>"+query);
            int result = 0;
            try {
                // make the statment
                Statement statement = conn.createStatement();
                // execute the query
                result = statement.executeUpdate(query);
                HttpSession session;   
                session = request.getSession(true); 
                if(result==1){
                    session.setAttribute("type", type);
                    session.setAttribute("email", email);
                    session.setAttribute("lastName", lastName);
                    session.setAttribute("firstName", firstName);
                    session.setAttribute("gender", gender);

                    response.sendRedirect(request.getContextPath()+"/jsp/user_added_successfuly.jsp");
                }
                else {
                    response.sendError(500, "Error: The user could not be added");
                }
            

            } catch (SQLException ex) {
                out.write(ex.getMessage());
            }
            try {
                conn.close();
            } catch (SQLException ex) {
                out.write("The connexion the the DB couldn't be closed. <br>");
                out.write(ex.getMessage());
            }

        }
        catch(NullPointerException nul) {
            response.getWriter().print("Null pointer exception"+ nul.getMessage());
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
