-----------MEMBER
-- 회원가입시 MID 중복체크
SELECT * FROM MEMBER WHERE MID ='aaa';
-- 회원가입
INSERT INTO MEMBER(MID, MPW, MNAME, MTEL, MEMAIL, MADDRESS, MBIRTH, MGENDER, MGRADE)
    VALUES ('ddd', '1', '윤율율', '010-4444-4444', 'd@dd.com', '부산', '1993-03-03', 'F', 'DIAMOND');
-- 로그인
SELECT * FROM MEMBER WHERE MID = 'aaa' AND MPW= '1';
-- MID로 DTO 가져오기(내정보)
SELECT * FROM MEMBER WHERE MID='ddd';
-- 회원정보 수정
UPDATE MEMBER SET MPW='1',
                                      MNAME='윤율이',
                                      MTEL='010-1234-1234',
                                      MEMAIL='dd@dd.com',
                                      MADDRESS='홍천',
                                      MGENDER='F',
                                      MBIRTH='1993-03-03'
                                WHERE MID='ddd';
-- 거래내역에 따른 등급변경
UPDATE MEMBER 
        SET MGRADE = 
        (SELECT G.MGRADE FROM MEMBER M, MEMBER_GRADE G 
        WHERE (SELECT COUNT(TNO) FROM TRADE WHERE SID = 'dkdk' OR BID='dkdk') BETWEEN LOW AND HIGH AND MID='dkdk') 
        WHERE MID = 'dkdk';
SELECT * FROM MEMBER WHERE MID='dkdk';
-----------TRADE
-- 판매 거래내역 불러오기
SELECT BNO, (SELECT BTITLE FROM BOARD B, TRADE T WHERE B.BNO=T.BNO), SID, BID FROM MEMBER M, TRADE T WHERE M.MID=T.SID AND SID='aaa';
-- 구매 거래내역 불러오기
SELECT BNO, (SELECT BTITLE FROM BOARD B, TRADE T WHERE B.BNO=T.BNO), SID, BID FROM MEMBER M, TRADE T WHERE M.MID=T.SID AND BID='bbb';
-- 거래완료 
INSERT INTO TRADE(TNO, BNO, SID, BID)
    VALUES (SEQ_T.NEXTVAL, 2, 'ccc', 'bbb');
-- 거래완료된 글인지 아닌지
SELECT * FROM TRADE WHERE BNO=3;
SELECT * FROM BOARD WHERE MID='ddd';
SELECT * FROM MEMBER WHERE MID='aaa';
SELECT * FROM TRADE;
SELECT * FROM MEMBER;
commit;

-----------BOARD
-- 등록된 판매글수
SELECT COUNT(*) FROM BOARD WHERE BBS='S' AND GAME='메이플스토리';
-- 등록된 구매글수
SELECT COUNT(*) FROM BOARD WHERE BBS='B' AND GAME='메이플스토리';
--판매글목록
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM(SELECT * FROM BOARD WHERE BBS='S' ORDER BY BNO DESC) A)
        WHERE RN BETWEEN 1 AND 2;
--구매글목록
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM(SELECT * FROM BOARD WHERE BBS='B' ORDER BY BNO DESC) A)
        WHERE RN BETWEEN 1 AND 2;
--판매글쓰기
INSERT INTO BOARD(BNO, MID, BBS, GAME, BTITLE, BCOST, BCNAME, BCONTENT, BPHOTO)
    VALUES (SEQ_B.NEXTVAL,'aaa', 'S', '리니지W', '템팜', '3000', '기사', '팔아요', NULL);
--구매글쓰기
INSERT INTO BOARD(BNO, MID, BBS, GAME, BTITLE, BCOST, BCNAME, BCONTENT, BPHOTO)
    VALUES (SEQ_B.NEXTVAL,'ccc', 'B', '아이온', '템사요', '10000', '짱짱맨', '살게요', NULL);
--글 상세보기
SELECT * FROM BOARD WHERE BNO = 2;
--글 수정하기
UPDATE BOARD SET BTITLE='마지막기회입니다',
                                    BCOST='2000',
                                    BCNAME='기사',
                                    BCONTENT='판다고 했다',
                                    BPHOTO=NULL
                            WHERE BNO=1;
--글 삭제하기
DELETE FROM BOARD WHERE BNO=1;


DELETE FROM CBOARD WHERE CID LIKE lee;


-----------CBOARD
-- 글목록
SELECT * FROM 
        (SELECT ROWNUM RN, A.* FROM 
        (SELECT * FROM CBOARD ORDER BY CREF DESC, CRE_STEP) A)
        WHERE RN BETWEEN 1 AND 5;
-- 등록된 글수
SELECT COUNT(*) FROM CBOARD;
-- 원글쓰기
INSERT INTO CBOARD (CNO, CID, CTITLE, CCONTENT, CREF, CRE_STEP, CRE_LEVEL)
    VALUES (SEQ_C.NEXTVAL, 'ccc', '사기당함', '해결해줘', SEQ_C.CURRVAL, 0, 0);
-- 답변글 쓰기전 STEP
UPDATE CBOARD SET CRE_STEP = CRE_STEP + 1 WHERE CREF=2 AND CRE_STEP>0;
-- 답변글 쓰기
INSERT INTO CBOARD (CNO, CID, CTITLE, CCONTENT, CREF, CRE_STEP, CRE_LEVEL)
    VALUES (SEQ_C.NEXTVAL, 'ad1', '고민해결', '괜찮아요~', 2, 1, 1);
-- 글 상세보기
SELECT * FROM CBOARD WHERE CNO = 1;
-- 글 삭제하기
DELETE FROM CBOARD WHERE CNO = 1;

COMMIT;