/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import beans.user;
import database.ConnectToDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Said
 */
public class AddPrescription extends HttpServlet {

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

            // get the parameters 
            String patientEmail = request.getParameter("patientEmail");

            // get the drug list
            String[] drugs = request.getParameterValues("drugItem");

            HttpSession session = request.getSession(false);
            user doctor = (user) session.getAttribute("user");

            session.setAttribute("patientEmail", patientEmail);
            session.setAttribute("drugs", drugs);

            // retrieve the patient information
            String patientQuery = "Select * from hospital.patient where email ='" + patientEmail + "'";
            // instantiate a new userBean corresponding to the patient 
            user patient = new user();

            Statement statement;
            try {
                statement = conn.createStatement();
                ResultSet patientInfo = statement.executeQuery(patientQuery);

                while (patientInfo.next()) {
                    patient.setFirstName(patientInfo.getString("FirstName"));
                    patient.setLastName(patientInfo.getString("LastName"));
                    patient.setBirthday(patientInfo.getString("DateOfBirth"));
                }
                session.setAttribute("patient", patient);

            } catch (SQLException ex) {
                out.print("Error code: " + ex.getErrorCode() + "<br> Error message: " + ex.getMessage());

            }

            String addPrescription = "INSERT INTO hospital.prescription(patient_email, doctor_email) "
                    + "VALUES ('" + patientEmail + "','" + doctor.getEmail() + "')";
            try {
                // add the prescription to the table pprescription
                statement = conn.createStatement();
                statement.executeUpdate(addPrescription);

                // find the latest record corresponding to the current doctor and patient email
                String findPrescriptionID = "SELECT id FROM prescription WHERE "
                        + "patient_email='" + patientEmail + "' "
                        + "AND doctor_email='" + doctor.getEmail() + "'"
                        + "ORDER BY Date LIMIT 1";

                Statement st_findPrescriptionID = conn.createStatement();
                ResultSet rs = st_findPrescriptionID.executeQuery(findPrescriptionID);

                String prescID = null;
                if (rs.first()) {
                    prescID = rs.getString(1);
                }

                //add the list of drugs to the table prescription-details
                // make a query for each drug
                Statement st;
                String query;
                for (String drug : drugs) {
                    st = conn.createStatement();
                    query = "INSERT INTO hospital.prescription_details VALUES"
                            + "((SELECT id FROM hospital.drug WHERE Name ='" + drug.trim() + "') ," + prescID + ");";
                    out.print(query + "<br>");
                    st.executeUpdate(query);
                }
                // redirect to the success message page
                response.sendRedirect(request.getContextPath() + "/jsp/prescription_added.jsp");
                out.printf("<br>Congratulation! The data was added into the database successfully!!!");
            } catch (SQLException | NullPointerException ex) {
                out.print(ex.getMessage() + "<br>");
                out.print(ex.toString());
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
