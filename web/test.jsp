<%@ page import="java.io.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="rs" dataSource="jdbc/itm411db">
SELECT CRNID, CNAME, AUTHOR, TERM FROM COURSE
</sql:query>

<html>
    <head>
    <h2> Sample File Reading through Jsp </h2></head>

<%
    try {

        BufferedReader input = new BufferedReader(new FileReader("E:\\RESEARCH\\LunaV2.0\\samp")); 
        if (true) {
            String line = input.readLine();
            if(line !=null){
                out.println(line+"<br>");
                Thread.sleep(1000);
                out.flush();
            }
        }

       // input.close();
    } catch (Exception e) {
        out.println(e);
    }
%>

<c:forEach var="row" items="${rs.rows}">
    Foo ${row.CRNID}<br/>
    Bar ${row.CNAME}<br/>
</c:forEach>

</html>

