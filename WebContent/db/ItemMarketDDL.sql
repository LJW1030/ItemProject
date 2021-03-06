DROP TABLE TRADE;
DROP TABLE BOARD;
DROP TABLE GAMES;
DROP TABLE CBOARD;
DROP TABLE MESSAGE;
DROP TABLE MEMBER;
DROP TABLE MEMBER_GRADE;
DROP TABLE ADMIN;
DROP SEQUENCE SEQ_T;
DROP SEQUENCE SEQ_B;
DROP SEQUENCE SEQ_C;
DROP SEQUENCE SEQ_E;

CREATE TABLE GAMES(
    GAME VARCHAR2(50) PRIMARY KEY
);
CREATE SEQUENCE SEQ_T
    MAXVALUE 99999
    NOCACHE
    NOCYCLE;
CREATE TABLE MEMBER_GRADE(
    MGRADE VARCHAR2(30) PRIMARY KEY,
    GNO NUMBER(1) NOT NULL,
    LOW NUMBER(10) NOT NULL,
    HIGH NUMBER(10) NOT NULL
);
CREATE TABLE MEMBER(
    MID VARCHAR2(30) PRIMARY KEY,
    MPW VARCHAR2(50) NOT NULL,
    MNAME VARCHAR2(30) NOT NULL,
    MTEL VARCHAR2(50) NOT NULL,
    MEMAIL VARCHAR2(100) NOT NULL,
    MADDRESS VARCHAR2(100) NOT NULL,
    MBIRTH DATE NOT NULL,
    MGENDER VARCHAR2(10) NOT NULL,
    MGRADE VARCHAR2(30) DEFAULT 'BRONZE' REFERENCES MEMBER_GRADE(MGRADE)
);
CREATE SEQUENCE SEQ_B
    MAXVALUE 99999
    NOCACHE
    NOCYCLE;
    
CREATE TABLE BOARD(
    BNO NUMBER(5) PRIMARY KEY,
    MID VARCHAR2(30) REFERENCES MEMBER(MID) NOT NULL,
    BBS VARCHAR2(10) NOT NULL,    
    GAME VARCHAR2(50) REFERENCES GAMES(GAME) NOT NULL,
    BTITLE VARCHAR2(100) NOT NULL,
    BCOST NUMBER(10) NOT NULL,
    BCNAME VARCHAR2(30) NOT NULL,
    BCONTENT VARCHAR2(500),
    BPHOTO VARCHAR2(50),
    BRDATE DATE DEFAULT SYSDATE
);
CREATE TABLE TRADE(
    TNO NUMBER(5) PRIMARY KEY,
    BNO NUMBER(5) REFERENCES BOARD(BNO) NOT NULL,
    SID VARCHAR2(30) REFERENCES MEMBER(MID) NOT NULL,
    BID VARCHAR2(30) REFERENCES MEMBER(MID) NOT NULL
);
CREATE SEQUENCE SEQ_C
    MAXVALUE 99999
    NOCACHE
    NOCYCLE;
CREATE TABLE CBOARD(
    CNO NUMBER(5) PRIMARY KEY,
    CID VARCHAR2(30) NOT NULL,
    CTITLE VARCHAR2(100) NOT NULL,
    CCONTENT VARCHAR2(500),
    CREF NUMBER(5),
    CRE_STEP NUMBER(5),
    CRE_LEVEL NUMBER(5),
    CRDATE DATE DEFAULT SYSDATE
);
CREATE SEQUENCE SEQ_E
    MAXVALUE 99999
    NOCACHE
    NOCYCLE;
CREATE TABLE MESSAGE(
    ENO NUMBER(5) PRIMARY KEY,
    SENDID VARCHAR2(30) REFERENCES MEMBER(MID),
    GETID VARCHAR2(30) REFERENCES MEMBER(MID),
    ETITLE VARCHAR2(50),
    ECONTENT VARCHAR2(500),
    ERDATE DATE DEFAULT SYSDATE
);
CREATE TABLE ADMIN(
    AID VARCHAR2(30) PRIMARY KEY,
    APW VARCHAR2(50) NOT NULL,
    ANAME VARCHAR2(30) NOT NULL
);
COMMIT;