<%@page import="java.util.ArrayList"%>
<%@page import="com.iit.aws.awsInit"%>

<html>
    <head>
        <link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet">
        <script src="http://vjs.zencdn.net/c/video.js"></script>
    </head>

    <body>
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
    </body>
</html>
