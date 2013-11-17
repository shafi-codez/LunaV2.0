<!DOCTYPE html>
<html>
    <head>
        <title>Luna : Video Rendering Application</title>
    </head>
    <body>
        <h2>File Uploader</h2>
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
    </body>
</html>
