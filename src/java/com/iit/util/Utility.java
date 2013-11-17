package com.iit.util;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author shafi
 */
public class Utility {
    
    public static void main(String s[]){
        System.out.println(" >> " +getStdName("test.sql", "09_25_2013"));
    }
    
    public static String getStdName(String fName, String date ){
        System.out.println(fName);
        String tmpNm = fName.substring(0, fName.lastIndexOf('.')).toUpperCase();
        String tmpExt = fName.substring(fName.indexOf('.'));
        String retNm = tmpNm + "_" + date.replace("/", "_") + tmpExt;
        System.out.println(retNm);
        //String fname = tmp[0]+ "_" +date+ "." +tmp[1];
        return retNm;        
    }
    
}
