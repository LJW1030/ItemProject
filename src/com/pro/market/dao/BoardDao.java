package com.pro.market.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.pro.market.dto.BoardDto;

public class BoardDao {

	public static final int FAIL = 0;
	public static final int SUCCESS = 1;

	private static BoardDao instance = new BoardDao();

	public static BoardDao getInstance() {
		return instance;
	}

	private BoardDao() {
	}

	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	// 등록된 판매글수
	public int getSellBoardCnt(String game) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM BOARD WHERE BBS='S' AND GAME=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, game);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return cnt;
	}

	// 등록된 구매글수
	public int getBuyBoardCnt(String game) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM BOARD WHERE BBS='B' AND GAME=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, game);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return cnt;
	}

	// 판매글목록
	public ArrayList<BoardDto> getSellBoard(String game, int startRow, int endRow) {
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM" + 
				"    (SELECT ROWNUM RN, A.* FROM(SELECT * FROM BOARD WHERE BBS='S' AND GAME=? ORDER BY BNO DESC) A)" + 
				"        WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, game);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int bno = rs.getInt("bno");
				String mid = rs.getString("mid");
				String bbs = rs.getString("bbs");
				String btitle = rs.getString("btitle");
				int bcost = rs.getInt("bcost");
				String bCname = rs.getString("bCname");
				String bcontent = rs.getString("bcontent");
				String bphoto = rs.getString("bphoto");
				Date brdate = rs.getDate("brdate");
				dtos.add(new BoardDto(bno, mid, bbs, game, btitle, bcost, bCname, bcontent, bphoto, brdate));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}

	// 구매글목록
	public ArrayList<BoardDto> getBuyBoard(String game, int startRow, int endRow) {
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM" + 
				"    (SELECT ROWNUM RN, A.* FROM(SELECT * FROM BOARD WHERE BBS='B' AND GAME=? ORDER BY BNO DESC) A)" + 
				"        WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, game);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int bno = rs.getInt("bno");
				String mid = rs.getString("mid");
				String bbs = rs.getString("bbs");
				String btitle = rs.getString("btitle");
				int bcost = rs.getInt("bcost");
				String bCname = rs.getString("bCname");
				String bcontent = rs.getString("bcontent");
				String bphoto = rs.getString("bphoto");
				Date brdate = rs.getDate("brdate");
				dtos.add(new BoardDto(bno, mid, bbs, game, btitle, bcost, bCname, bcontent, bphoto, brdate));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}

	// 판매글쓰기
	public int writeSell(String mid, String game, String btitle, int bcost, String bcname, String bcontent, String bphoto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO BOARD(BNO, MID, BBS, GAME, BTITLE, BCOST, BCNAME, BCONTENT, BPHOTO)" + 
				"    VALUES (SEQ_B.NEXTVAL,?, 'S', ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, game);
			pstmt.setString(3, btitle);
			pstmt.setInt(4, bcost);
			pstmt.setString(5, bcname);
			pstmt.setString(6, bcontent);
			pstmt.setString(7, bphoto);
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "글쓰기성공" : "글쓰기실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	// 구매글쓰기
	public int writeBuy(String mid, String game, String btitle, int bcost, String bcname, String bcontent) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO BOARD(BNO, MID, BBS, GAME, BTITLE, BCOST, BCNAME, BCONTENT)" + 
				"    VALUES (SEQ_B.NEXTVAL,?, 'B', ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, game);
			pstmt.setString(3, btitle);
			pstmt.setInt(4, bcost);
			pstmt.setString(5, bcname);
			pstmt.setString(6, bcontent);
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "글쓰기성공" : "글쓰기실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 글 상세보기
	public BoardDto getContent (int bno) {
		BoardDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM BOARD WHERE BNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String mid = rs.getString("mid");
				String bbs = rs.getString("bbs");;
				String game = rs.getString("game");;
				String btitle = rs.getString("btitle");;
				int bcost = rs.getInt("bcost");
				String bCname = rs.getString("bcname");;
				String bcontent = rs.getString("bcontent");;
				String bphoto = rs.getString("bphoto");;
				Date brdate = rs.getDate("brdate");
				dto = new BoardDto(bno, mid, bbs, game, btitle, bcost, bCname, bcontent, bphoto, brdate);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dto;
	}
	// 글 수정하기
	public int modifyBoard(String btitle, int bcost, String bcontent, String bphoto, int bno) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD SET BTITLE=?," + 
				"                                    BCOST=?," + 
				"                                    BCONTENT=?," + 
				"                                    BPHOTO=?" + 
				"                            WHERE BNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, btitle);
			pstmt.setInt(2, bcost);
			pstmt.setString(3, bcontent);
			pstmt.setString(4, bphoto);
			pstmt.setInt(5, bno);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 글삭제
	public int deleteBoard(int bno) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM BOARD WHERE BNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			System.out.println(bno);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "글삭제성공":"글삭제실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
}
