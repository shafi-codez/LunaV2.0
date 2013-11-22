package com.iit.util;

import com.iit.db.DBManager;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author shafi
 */
public class Utility {

    public static void main(String s[]) {
        //System.out.println(" >> " +getStdName("test.sql", "09_25_2013"));
        popCourse();
    }

    public static String getStdName(String fName, String date) {
        System.out.println(fName);
        String tmpNm = fName.substring(0, fName.lastIndexOf('.')).toUpperCase();
        String tmpExt = fName.substring(fName.indexOf('.'));
        String retNm = tmpNm + "_" + date.replace("/", "_") + tmpExt;
        System.out.println(retNm);
        //String fname = tmp[0]+ "_" +date+ "." +tmp[1];
        return retNm;
    }

    public static void popCourse() {
        String csvFile = "E:\\Dropbox\\CloudWorks\\course_report.csv";
        BufferedReader br = null;
        String line = "";
        String cvsSplitBy = ",";

        try {
            Connection cnx = DBManager.getConn();
            Statement st = cnx.createStatement();
            String qr = "insert into course values (";
            br = new BufferedReader(new FileReader(csvFile));
            ArrayList<String> CourseID = new ArrayList<String>();
            while ((line = br.readLine()) != null) {
                String values = "";
                String[] row = line.split(cvsSplitBy);
                //System.out.println("row size :"+row.length);
                if (row[0].replace("\"", "").equalsIgnoreCase("open")) {
                    //System.out.println(">> " + row[2] + " " + row[3] + " " + row[14] + "," + row[15]);
                    String[] cID = row[2].split("-");
                    if (!CourseID.contains(cID[0])) {
                        CourseID.add(cID[0]);
                        values = qr + cID[0] + "\"," + row[3] + "," + row[14] + "," + row[15] + ",\"fall 2013\")";
                        System.out.println(values);
                        st.execute(values);
                    }

                }
            }
            //System.out.println(" List :" + CourseID.toString());
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException ex) {
            Logger.getLogger(Utility.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        System.out.println("Done");
    }
}
