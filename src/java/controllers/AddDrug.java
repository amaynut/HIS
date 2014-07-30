/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import beans.Drug;
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

/**
 *
 * @author Said
 */
public class AddDrug extends HttpServlet {

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
            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String lab = request.getParameter("lab");

            // build the query
            String query = "INSERT INTO hospital.drug(`Name`,`Price`,`Laboratory`) VALUES "
                    + "('" + name + "'," + price + ",'" + lab + "')";

            try {
                // create the statement
                Statement statement = conn.createStatement();
                // execute the query
                int result = statement.executeUpdate(query);
                
                if(result !=0){
                    // set a new drug bean
                    Drug newDrug = new Drug();
                    newDrug.setLab(lab);
                    newDrug.setName(name);
                    newDrug.setPrice(price);
                    
                    // add the bean ass an attribute 
                   HttpSession session =  request.getSession();
                   session.setAttribute("drug", newDrug);
                    // send to the success message

                response.sendRedirect(request.getContextPath()+"/jsp/drug_added.jsp");
                }
            } catch (SQLException ex) {
                out.print(query);
               out.print("<br>"+ex.getMessage());
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
