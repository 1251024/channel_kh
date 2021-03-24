DROP SEQUENCE CHATSEQ;
DROP TABLE CHATDB;

CREATE SEQUENCE CHATSEQ;
CREATE TABLE CHATDB (

	CHATSEQ NUMBER NOT NULL,
	NAME VARCHAR2(100) NOT NULL,
	CONTENT VARCHAR2(1000) NOT NULL,
	REGDATE DATE

);

SELECT CHATSEQ, NAME, CONTENT, REGDATE
FROM CHATDB
ORDER BY CHATSEQ DESC;