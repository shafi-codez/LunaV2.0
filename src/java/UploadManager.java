/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import com.amazonaws.services.s3.model.AccessControlList;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.GroupGrantee;
import com.amazonaws.services.s3.model.Permission;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.Upload;
import com.iit.core.jobInfo;
import com.iit.db.DBManager;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.iit.util.Constants;
import com.iit.util.Utility;

/**
 *
 * @author shafi
 */
public class UploadManager extends HttpServlet {
    
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload uploader = new ServletFileUpload(factory);
            uploader.setSizeMax(500000000);
            
            List items = null;
            items = uploader.parseRequest(request);
            Iterator itr = items.iterator();
            TransferManager tx = awsInit.initS3();
            String bucketName = null;

            //AccessControlList acl = new AccessControlList();
            //acl.grantAllPermissions(GroupGrantee.AllUsers, Permission.Read);
            jobInfo jbI = new jobInfo();
            
            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();                
                String fDate = "11/21/2013";
                String formDt = "11/21/2013";
                if (item.isFormField()) {
                    System.out.println("FieldName : " + item.getFieldName() + "  FieldValue : " + item.getString());
                    if (item.getFieldName().equalsIgnoreCase("cname")) {
                        bucketName = item.getString().toLowerCase();
                        awsInit.createS3Bucket(bucketName);
                    }
                    if (item.getFieldName().trim().equals("dt")) {
                        formDt = item.getString();
                        fDate = item.getString().replace("/", "_");
                        System.out.println("File date : " + fDate);
                    }
                }
                System.out.println("Constants.tmpDir  is : " + Constants.tmpDir);
                System.out.println("item.getName() is : " + item.getName());
                if (item.getName() != null) {
                    System.out.println("File MetaData is : " + item.toString());
                    System.out.println("File Name is : " + item.getName());
                   
                    File savedFile = new File(Constants.tmpDir + item.getName());
                    item.write(savedFile);

                    // File Naming convention needed
                    String objName = Utility.getStdName(item.getName(), fDate);
                    System.out.println("File name >>" + item.getName());
                    System.out.println("Obj File name >>" + objName);
                    
                    jbI.setFname(item.getName());
                    jbI.setUpld_date(fDate);
                    jbI.setBkt_name(bucketName);
                    jbI.setS3key(objName);
                    jbI.setStatus("TRANSFERRING");
                    
                    PutObjectRequest reqObj = new PutObjectRequest(bucketName, objName, savedFile);
                    reqObj.setCannedAcl(CannedAccessControlList.PublicRead);
                    /*
                     upload = tx.upload(reqObj);
                                
                     // You can poll your transfer's status to check its progress
                     while (upload.isDone() == false) {
                     Thread.sleep(3000);
                     System.out.println(" Transfer: " + upload.getDescription());
                     System.out.println("  - State: " + upload.getState());
                     System.out.println("  - Progress: " + upload.getProgress().getBytesTransferred());
                     }
                     */
                    jbI.setStatus("TRANSFERED");
                    
                    DBManager.updateJobInfo(jbI);
                    
                }
            }
            out.print("<b>File Upload Successfull !!");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
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
        processRequest(request, response);
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
        processRequest(request, response);
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
