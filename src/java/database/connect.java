package database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.ResultSet;
import java.sql.Statement;

import beans.*;

/**
 * Servlet implementation class Connect
 */
@WebServlet("/Connect")
public class connect extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public connect() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            out.println("Can't load database driver");
            //e.printStackTrace();
            String strClassPath = System.getProperty("java.class.path");

            System.out.println("Classpath is " + strClassPath);
            return;
        }

        Connection conn;

        try {
            user user = new user();

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "penpony46");

            Statement statment = conn.createStatement();
            // String query = "SELECT * FROM doctor WHERE email='" + request.getParameter("email") + "'AND password ='" + request.getParameter("password") + "'";
            String query = "SELECT * FROM doctor limit 10";

            ResultSet result = statment.executeQuery(query);
            
            out.print(query);
            /*
              out.print("<style type='text/css'>table * {border:solid blue 1px;}</style>");
            out.print("<table>");
            out.print("<thead>");
            out.print("<tr> "
                    + "<th>First Name</th>"
                    + "<th>Last Name</th>"
                    + "<th>Email</th>"
                    + "<th>Specialty</th>"
                    + "<th>Phone</th>"
                    + "</tr>");
            out.print("</thead>");
            out.print("<tbody>");
            while (result.next()) {
                out.print("<tr>");
                    out.print("<td>" + result.getString("FirstName") + "</td>");
                    out.print("<td>" + result.getString("LastName") + "</td>");
                    out.print("<td>" + result.getString("email") + "</td>");
                    out.print("<td>" + result.getString("specialty") + "</td>");
                    out.print("<td>" + result.getString("phone") + "</td>");
                out.print("</tr>");
            }
            out.print("</tbody>");
            out.print("</table>");
            */
//request.getRequestDispatcher("/login.jsp").forward(request, response);

        } catch (SQLException e) {
            out.println("Can't connect to database. <br>");
            out.println(e.getMessage() + "<br>");
            return;
        }

        try {
            conn.close();
        } catch (SQLException e) {

        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }

}
