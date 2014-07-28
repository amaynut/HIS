<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>jQuery UI Autocomplete - Default functionality</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
        <%@page import="java.sql.*"%>
        <%@page import="java.util.*"%>
        <%@page import="database.ConnectToDB"%>
        <%!  List<String> arrayList;%>
<!-- Get the data from the data base for auto-complete -->
        <%
            try {
                Connection conn = ConnectToDB.ConnectToMySQL();
                Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

                String sql = "select Distinct(Specialty) from Hospital.Doctor";
                ResultSet rs = st.executeQuery(sql);

                response.setHeader("Content-Type", "text/html");
                arrayList = new ArrayList<>();
                while (rs.next()) {
                    arrayList.add("'" + rs.getString("Specialty") + "'");
                }

            } catch (Exception e) {
                out.print(e.getMessage());
            }

        %>     
        <script>
            $(function() {
                var availableTags = eval(<%=arrayList%>);
                $("#tags").autocomplete({
                    source: availableTags
                });
            });
        </script>
    </head>
    <body>

        <div class="ui-widget">
            <label for="tags">Tags: </label>
            <input id="tags">
        </div>


    </body>
</html>