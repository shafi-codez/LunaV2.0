<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head><title>Upload page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="assets/css/style.css"/>
        <script type="text/javascript" src="assets/js/jquery-1.4.4.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.flash.js"></script>
        <script type="text/javascript" src="assets/js/jquery.jqUploader.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $('#example1').jqUploader({
                    debug:0
                    ,background:'FFFFDF'
                    ,barColor:'#5EFF19'
                    ,allowedExt:'*.avi; *.jpg; *.jpeg; *.png'
                    ,allowedExtDescr: 'what you want'
                    ,validFileMessage: 'now hit Upload!'
                    ,endMessage: 'and don\'t you come back ;)'
                    ,hideSubmit: false
                });
                $("#example2").jqUploader({
                    afterScript:	"index.jsp",
                    background:	"FFFFDF",
                    barColor:	"green",
                    allowedExt:     "*.avi; *.jpg; *.jpeg; *.png",
                    allowedExtDescr: "Images and movies (*.avi; *.jpg; *.jpeg; *.png)"
                });

                $("#example3").jqUploader({background:	"FFFFDF",barColor:	"FF00FF"});
            });
        </script>

    </head></p> <p><body>
    <form enctype="multipart/form-data" action="upload.jsp" method="POST" class="a_form">
                <fieldset>
                    <legend>Upload your file</legend>
                    <ol>
                        <li id="example1">
                            <label for="example3_field">Choose a file to upload:</label>
                            <input name="myFile3" id="example3_field"  type="file" />
                        </li>
                    </ol>
                     <ol>
                        <li id="example2">
                            <label for="example2_field">Choose a file to upload:</label>
                            <input name="myFile4" id="example2_field"  type="file" />
                        </li>
                    </ol>
                     <ol>
                        <li id="example3">
                            <label for="example1_field">Choose a file to upload:</label>
                            <input name="myFile5" id="example1_field"  type="file" />
                        </li>
                    </ol>
                </fieldset>
                <input type="submit" name="submit" value="Upload File" />
      </form>
</body>
</html>