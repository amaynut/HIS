
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:directive.page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" >    
</jsp:directive.page>
<!DOCTYPE html>
<html>
    <head>
		<meta name="description" content="Not Found Page" />
                <title>Hospital Information System: Not Found Page</title>
                <%@include file="/WEB-INF/jspf/common_head.jspf" %>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        
        <div id="main-wrapper">
            <div class="container">
                <h1 style="text-align: center; color: red; font-size: 400%">The page is not found :)</h1>
            </div>
        </div>
                  <%@include file="/WEB-INF/jspf/footer.jspf" %>
      
        
    </body>
</html>
