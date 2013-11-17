<!DOCTYPE HTML>
<html>

    <head>
        <title>IIT ITM App : Luna </title>
        <meta name="description" content="Scalable Video Rendering application" />
        <meta name="keywords" content="Scalable, Video, Rendering, application" />
        <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
        <link rel="stylesheet" type="text/css" href="style/style.css" />
        <script type="text/javascript" src="/path/to/jquery-latest.js"></script> 
        <script type="text/javascript" src="/path/to/jquery.tablesorter.js"></script> 
    </head>

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
                <div id="menubar">
                    <ul id="menu">
                        <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
                        <li class="selected"><a href="index.jsp">Home</a></li>
                        <li><a href="">Videos</a></li>
                        <li><a href="">Jobs List</a></li>
                        <li><a href="">Analytics</a></li>
                        <li><a href="">Contact Us</a></li>
                    </ul>
                </div>
            </div>
            <div id="content_header"></div>
            <div id="site_content">
                <div id="sidebar_container">
                    <div class="sidebar">
                        <div class="sidebar_top"></div>
                        <div class="sidebar_item">
                            <h3>Search</h3>
                            <form method="post" action="#" id="search_form">
                                <p>
                                    <input class="search" type="text" name="search_field" value="Enter keywords....." />
                                    <input name="search" type="image" style="border: 0; margin: 0 0 -9px 5px;" src="style/search.png" alt="Search" title="Search" />
                                </p>
                            </form>
                        </div>
                        <div class="sidebar_base"></div>
                    </div>
                    <div class="sidebar">
                        <div class="sidebar_top"></div>
                        <div class="sidebar_item">
                            <!-- insert your sidebar items here -->
                            <h3>Latest News</h3>
                            <h4>New Website Launched</h4>
                            <h5>January 1st, 2014</h5>
                            <p>2014 sees the redesign of our website. Take a look around and let us know what you think.<br /><a href="#">Read more</a></p>
                        </div>
                        <div class="sidebar_base"></div>
                    </div>
                    <div class="sidebar">
                        <div class="sidebar_top"></div>
                        <div class="sidebar_item">
                            <h3>Useful Links</h3>
                            <ul>
                                <li><a href="#">link 1</a></li>
                                <li><a href="#">link 2</a></li>
                                <li><a href="#">link 3</a></li>
                                <li><a href="#">link 4</a></li>
                            </ul>
                        </div>
                        <div class="sidebar_base"></div>
                    </div>

                </div>
                <div id="content">
                    <h2>Data Interpretation</h2>
                    <p><a href="population.html">Bar Charts</a><p>
                    <p><a href="tree.html">Tree Charts</a><p>
                    <p><a href="hierarchical-bar.html">Vertical Bars</a><p>
                    <table id="myTable" class="tablesorter"> 
                        <thead> 
                            <tr> 
                                <th>Last Name</th> 
                                <th>First Name</th> 
                                <th>Email</th> 
                                <th>Due</th> 
                                <th>Web Site</th> 
                            </tr> 
                        </thead> 
                        <tbody> 
                            <tr> 
                                <td>Smith</td> 
                                <td>John</td> 
                                <td>jsmith@gmail.com</td> 
                                <td>$50.00</td> 
                                <td>http://www.jsmith.com</td> 
                            </tr> 
                            <tr> 
                                <td>Bach</td> 
                                <td>Frank</td> 
                                <td>fbach@yahoo.com</td> 
                                <td>$50.00</td> 
                                <td>http://www.frank.com</td> 
                            </tr> 
                            <tr> 
                                <td>Doe</td> 
                                <td>Jason</td> 
                                <td>jdoe@hotmail.com</td> 
                                <td>$100.00</td> 
                                <td>http://www.jdoe.com</td> 
                            </tr> 
                            <tr> 
                                <td>Conway</td> 
                                <td>Tim</td> 
                                <td>tconway@earthlink.net</td> 
                                <td>$50.00</td> 
                                <td>http://www.timconway.com</td> 
                            </tr> 
                        </tbody> 
                    </table>     
                </div>
            </div>
            <div id="content_footer"></div>
            <div id="footer">
                <p><a href="index.jsp">Home</a> | <a href="">Videos</a> | <a href="">Jobs List</a> | <a href="Analytics.jsp">Analytics</a> | <a href="">Contact Us</a></p>
                <p>Copyright &copy; Luna | <a href="">HTML5</a> | <a href="">CSS</a> | <a href="">design from sat.iit.edu</a></p>
            </div>
        </div>
    </body>
</html>
