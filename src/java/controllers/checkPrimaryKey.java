/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import database.ConnectToDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/checkPK")
public class checkPrimaryKey extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            //1- get the connection object
            Connection conn = ConnectToDB.ConnectToMySQL();
            //2- get the parameters values
            String type = request.getParameter("UserType");
            String email = request.getParameter("email");
            // 3- Check if the email already exist (the primary key)
            String queryCheck = "SELECT Email from Hospital." + type + " WHERE Email= '" + email + "'";
            // get the statement object
            Statement statement = conn.createStatement();
            // execute the query
            ResultSet result = statement.executeQuery(queryCheck);

            // Put the message answer in a map for JSon format conversion           
            Map<String, Object> resultMap = new HashMap();
            if (result.first()) {
                resultMap.put("alreadyExist", true);
            } else {
                resultMap.put("alreadyExist", false);
            }
              resultMap.put("query", queryCheck);
            // send the result with JSon format           
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            Gson gs = new Gson();
            out.write(gs.toJson(resultMap));
        } catch (SQLException ex) {
            response.getWriter().write(ex.getMessage());
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
