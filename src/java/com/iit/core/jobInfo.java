/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iit.core;

/**
 *
 * @author shafi
 */
public class jobInfo {
    
    private int jid; 
    private String fname;
    private String upld_date;
    private String bkt_name;  
    private String s3key;    
    private String status;

    public int getJid() {
        return jid;
    }

    public void setJid(int jid) {
        this.jid = jid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getUpld_date() {
        return upld_date;
    }

    public void setUpld_date(String upld_date) {
        this.upld_date = upld_date;
    }

    public String getBkt_name() {
        return bkt_name.toUpperCase();
    }

    public void setBkt_name(String bkt_name) {
        this.bkt_name = bkt_name;
    }

    public String getS3key() {
        return s3key;
    }

    public void setS3key(String s3key) {
        this.s3key = s3key;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
