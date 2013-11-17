/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import com.amazonaws.AmazonClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.ClasspathPropertiesFileCredentialsProvider;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.Upload;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author shafi
 */
@WebServlet(urlPatterns = {"/s3Uploader"})
public class s3Uploader extends HttpServlet {

    private static AWSCredentials credentials;
    private static TransferManager tx;
    private static String bucketName;
    private Upload upload;

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload uploader = new ServletFileUpload(factory);
            //System.out.println(upload.parseRequest(request));    

            AmazonS3 s3 = new AmazonS3Client(credentials = new ClasspathPropertiesFileCredentialsProvider().getCredentials());
            Region usWest2 = Region.getRegion(Regions.US_WEST_2);
            s3.setRegion(usWest2);
            tx = new TransferManager(s3);

            bucketName = "s3-upload-sdk-sample-" + credentials.getAWSAccessKeyId().toLowerCase();
            createAmazonS3Bucket();

            List items = null;
            items = uploader.parseRequest(request);
            Iterator itr = items.iterator();

            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
                //File fname = new File(item.getName());
                if (item.getName() != null) {
                    System.out.println("File Name is :" + item.toString());
                    System.out.println("File Name is :" + item.getName());
                   // File savedFile = new File("C:\\Users\\shafi\\Pictures\\Camera Roll\\picture000.jpg");
                   // Add you local path or Tomcat webapp path
                    File savedFile = new File("E:\\RESEARCH\\"+ item.getName());
                    savedFile.getTotalSpace();
                    item.write(savedFile);  ;
                    PutObjectRequest reqObj = new PutObjectRequest(bucketName, item.getName(), savedFile);
                    System.out.println("File name >>" + item.getName());
                    upload = tx.upload(reqObj);

                    // You can poll your transfer's status to check its progress
                    if (upload.isDone() == false) {
                        //upload.wait(30000);
                        System.out.println(" Transfer: " + upload.getDescription());
                        System.out.println("  - State: " + upload.getState());
                        System.out.println("  - Progress: " + upload.getProgress().getBytesTransferred());
                        //Thread.sleep(3000);
                    }

                    // Transfers also allow you to set a ProgressListener to receive
                    // asynchronous notifications about your transfer's progress.
                    //upload.addProgressListener(myProgressListener);

                    // Or you can block the current thread and wait for your transfer to
                    // to complete.  If the transfer fails, this method will throw an
                    // AmazonClientException or AmazonServiceException detailing the reason.
                    upload.waitForCompletion();
                    
                    if (upload.isDone() == false) {
                        //upload.wait(30000);
                        System.out.println(" Transfer: " + upload.getDescription());
                        System.out.println("  - State: " + upload.getState());
                        System.out.println("  - Progress: " + upload.getProgress().getPercentTransferred());
                        //Thread.sleep(3000);
                    }
                    
                    out.print("<b>File Upload Successfull !!");

                }
            }



        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    private void createAmazonS3Bucket() {
        try {
            if (tx.getAmazonS3Client().doesBucketExist(bucketName) == false) {
                tx.getAmazonS3Client().createBucket(bucketName);
            }
        } catch (AmazonClientException ace) {
            ace.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(s3Uploader.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(s3Uploader.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
