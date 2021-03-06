DROP TABLE COURSE;

CREATE TABLE COURSE
(
    CRID VARCHAR(50),
    CNAME VARCHAR(50),
    AUTHOR VARCHAR(50),
    TERM VARCHAR(50),
    PRIMARY KEY(CRID)
);


DROP TABLE JOBS;

CREATE TABLE REQUEST
(
    JID INT NOT NULL AUTO_INCREMENT,
    FNAME VARCHAR(50),
    UPLD_DATE DATE,
    BKT_NM VARCHAR(50),
    S3KEY VARCHAR(50),
    STATUS VARCHAR(25),
    PRIMARY KEY(S3KEY)
);