<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.iit.db.DBManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-us">
    <head>
        <title>jQuery plugin: Tablesorter 2.0</title>
        <link rel="stylesheet" href="css/styletbl.css" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.tablesorter.js"></script>
        <script type="text/javascript" src="js/jquery.tablesorter.pager.js"></script>
    </head>
    <body>
        <table id="insured_list" class="tablesorter"> 
            <thead> 
                <tr> 
                    <th>Course ID</th> 
                    <th>Course Name</th> 
                    <th>Author</th> 
                    <th>Term</th> 
                </tr> 
            </thead> 
            <tbody> 
                <%
                    Connection con = DBManager.getConn();
                    ResultSet rs = null;
                    Statement st = con.createStatement();
                    String qr = "SELECT * FROM COURSE";
                    rs = st.executeQuery(qr);
                    while (rs.next()) {
                        //Thread.sleep(3000);
                %>
                <tr> 
                    <td><%=rs.getString(1)%></td> 
                    <td><%=rs.getString(2)%></td> 
                    <td><%=rs.getString(3)%></td> 
                    <td><%=rs.getString(4)%></td> 
                </tr> 
                <%
                    }
                %>


            </tbody> 
        </table> 
        <div id="pager" class="pager">
            <form>
                <img src="images/first.png" class="first"/>
                <img src="images/prev.png" class="prev"/>
                <input type="text" class="pagedisplay"/>
                <img src="images/next.png" class="next"/>
                <img src="images/last.png" class="last"/>
                <select class="pagesize">
                    <option value="">LIMIT</option>
                    <option value="10">10 per page</option>
                    <option value="20">20 per page</option>
                    <option value="30">30 per page</option>
                </select>
            </form>
        </div>
        <script defer="defer">
            $(document).ready(function()
            {
                $("#insured_list")
                        .tablesorter({widthFixed: true, widgets: ['zebra']})
                        .tablesorterPager({container: $("#pager")});
            }
            );
        </script>
    </body>
</html>