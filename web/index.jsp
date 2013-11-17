<!DOCTYPE HTML>
<html>
<%@ include file="jspf/head.jspf" %>
<body>
  <div id="main">
    <div id="header">
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <h1><a href="index.html">Luna : <span class="logo_colour">Transcoder</span></a></h1>
          <h2>Elastic & AutoScalable Video Rendering App</h2>
        </div>
      </div>
      <%@ include file="jspf/menu.jspf" %>
    </div>
    <div id="content_header"></div>
    <div id="site_content">
      <%@ include file="jspf/sidebar.jspf" %>
      <div id="content">
        <h2>Welcome to Luna</h2>
        <h1>Technologies used</h1>
        <p>Amazon Web Services : SQS, RDS</p>
        <p>Eucalyptus : S3, EC2</p>
        <p>JSP, HTML5, CSS, Jquery</p>
        <p>Analytics : d3.js</p> 
        <h2> Single File Uploader </h2>
        <p>
            <form action="UploadManager" method="post" enctype="multipart/form-data">
            <center><table border="0" cellspacing="1" cellpadding="1">
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Email : </td>
                            <td><input type="text" name="email" placeholder="abc@domain.com" required></td>
                        </tr>
                        <tr>
                            <td>Cell Number :</td>
                            <td><input type="text" name="phone" placeholder="1XXX-XXX-XXXX"></td>
                        </tr>
                        <tr>
                            <td>Date : </td>
                            <td><input type="text" name="dt" placeholder="MM/DD/YYYY" required></td>
                        </tr>
                        <tr>
                            <td>Class Name : </td>
                            <td><input type="text" name="cname" placeholder="ITMXXX"></td>
                        </tr>
                        <tr>
                            <td>Choose File :</td>
                            <td><input type="file" name="uploaded_file" id="uploaded_file" required></td>
                        </tr>
                        <tr>
                            <td><input type="reset"  value="Clear" ></td>
                            <td><input type="submit"  value="Upload" ></td>
                        </tr>
                    </tbody>
                </table>
            <center>
        </form>
        </p>
        <p>Other MultiUploader Options<br>
            <a href="multiUpldr.jsp">Option 1 : MultiPart</a><br>
            <a href="multiUpldr.jsp">Option 2 : SWF Method</a><br>
        </p>
      </div>
    </div>
    <%@ include file="jspf/footer.jspf" %>
  </div>
</body>
</html>
