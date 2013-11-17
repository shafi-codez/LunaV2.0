<%@ page import="java.io.*" %>
<html>
    <head>
    <h2> Sample File Reading through Jsp </h2></head>

<%
    try {

        BufferedReader input = new BufferedReader(new FileReader("E:\\RESEARCH\\LunaV2.0\\samp")); 
        while (true) {
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
</html>

