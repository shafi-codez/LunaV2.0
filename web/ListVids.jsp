<%@page import="java.util.ArrayList"%>
<%@page import="com.iit.aws.awsInit"%>
<!DOCTYPE HTML>
<html>
<%@ include file="jspf/head.jspf" %>
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet">
        <script src="http://vjs.zencdn.net/c/video.js"></script>
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

      <div id="content">
       <center>
            <% ArrayList<String> pubURLs = awsInit.listObjs();
                for(String url : pubURLs ) { %>
                    
        <div class="container">
            Note : Best Played & Viewed in Google Chrome<br><br>
   
            <center>  <h1> Video that demostrates Elastic Load Balancing </h1> </center>
            <video id="my_video_1" class="video-js vjs-default-skin" controls
                   preload="auto" width="600" height="400" poster="my_video_poster.png"
                   data-setup="{}">
                <source src="<%out.println(url);%>" type="video/mp4">
            </video> 
            <p>Here we have using S3Fox addon which measure downloading using S3 & Cloud Front Cloud distributed URL.
                There many other extension such as Firebug, S3 extension for chrome can also be used to measure the download time.
            </p>
        <% } %>
            <br>Above video are made using snagit software for windows.
            <div class="divider"></div>
        <div class="footer">
            <div class="left">
                &copy; 2012 Shafi@hawk.iit.edu 
            </div>
        </div>
        </div>
        </center>
      </div>
    </div>
    <%@ include file="jspf/footer.jspf" %>
  </div>
</body>
</html>
