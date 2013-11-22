<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head><title>Upload page</title>
        <script type="text/javascript" src="assets/js/jquery-1.4.4.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.uploadify-3.1.min.js"></script>
        <script type="text/javascript">
            $(function() {
                $('#file_upload').uploadify({
                    'swf': 'uploadify.swf',
                    'uploader': '/MutiUploader',
                    barColor: "green",
                    allowedExt: "*.mp4; *.jpg; *.jpeg; *.png",
                    allowedExtDescr: "Images and movies (*.mp4; *.jpg; *.jpeg; *.png)"
                    // Put your options here
                });
            });
        </script> 
        <link rel="stylesheet" type="text/css" href="css/uploadify.css"/>
    </head></p> <p><body>
    <input type="file" name="file_upload" id="file_upload" />
</body>
</html>