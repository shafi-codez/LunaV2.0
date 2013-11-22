<%@page import="com.amazonaws.auth.AWSCredentials"%>
<%@page import="com.amazonaws.services.s3.AmazonS3Client"%>
<%@page import="com.amazonaws.auth.ClasspathPropertiesFileCredentialsProvider"%>
<%@page import="com.amazonaws.regions.Regions"%>
<%@page import="com.amazonaws.regions.Region"%>
<%@page import="com.amazonaws.services.s3.AmazonS3"%>
<%@page import="com.amazonaws.services.s3.transfer.TransferManager"%>
<%@page import="com.amazonaws.services.s3.transfer.Upload"%>
<%@page import="com.amazonaws.services.s3.model.PutObjectRequest"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*,java.util.UUID"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<center>
    <table border="2">

        <%
            Upload uploader;
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            //System.out.println(upload.parseRequest(request));    
            List items = null;
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            Iterator itr = items.iterator();
            Thread.sleep(5000);
            while (itr.hasNext()) {
                FileItem item = (FileItem) (itr.next());
                //out.println("itr");
                if (!item.isFormField()) {
                    try {
                        String field = item.getFieldName();
                        String value = item.getString();
                        System.out.println("field=" + value);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else {
                    try {

                        UUID uuid = UUID.randomUUID();
                        String itemName = item.getName();
                        String tempName = uuid.toString();
                        File savedFile = new File("E:\\RESEARCH\\" + itemName);
                        item.write(savedFile);
                        Thread.sleep(500);

                        PutObjectRequest reqObj = new PutObjectRequest("Shafi", itemName, savedFile);
                        System.out.println("File name >>" + item.getName());
                        TransferManager tx;
                        AWSCredentials credentials;
                        AmazonS3 s3 = new AmazonS3Client(credentials = new ClasspathPropertiesFileCredentialsProvider().getCredentials());
                        Region usWest2 = Region.getRegion(Regions.US_WEST_2);
                        s3.setRegion(usWest2);
                        tx = new TransferManager(s3);
                        uploader = tx.upload(reqObj);
                        Thread.sleep(30000);
                        // You can poll your transfer's status to check its progress
                        while (uploader.isDone() == false) {
                            //upload.wait(30000);
                            System.out.println(" Transfer: " + uploader.getDescription());
                            System.out.println("  - State: " + uploader.getState());
                            System.out.println("  - Progress: " + uploader.getProgress().getBytesTransferred());
                            Thread.sleep(30000);
                        }

                        out.println("done");
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }

        %>
    </table>
</center>
