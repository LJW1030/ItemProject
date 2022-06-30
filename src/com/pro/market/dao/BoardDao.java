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
	public int getSellBoardCnt() {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM BOARD WHERE BBS='S'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
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
	public int getBuyBoardCnt() {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM BOARD WHERE BBS='B'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
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
	public ArrayList<BoardDto> getSellBoard(int startRow, int endRow) {
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM" + 
				"    (SELECT ROWNUM RN, A.* FROM(SELECT * FROM BOARD WHERE BBS='S' ORDER BY BNO DESC) A)" + 
				"        WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int bno = rs.getInt("bno");
				String mid = rs.getString("mid");
				String bbs = rs.getString("bbs");
				String game = rs.getString("game");
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
	public ArrayList<BoardDto> getBuyBoard(int startRow, int endRow) {
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM"
				+ "    (SELECT ROWNUM RN, A.* FROM(SELECT * FROM BOARD WHERE BBS='B' ORDER BY BNO DESC) A)"
				+ "        WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int bno = rs.getInt("bno");
				String mid = rs.getString("mid");
				String bbs = rs.getString("bbs");
				String game = rs.getString("game");
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
	public int writeSell(BoardDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO BOARD(BNO, MID, BBS, GAME, BTITLE, BCOST, BCNAME, BCONTENT, BPHOTO)" + 
				"    VALUES (SEQ_B.NEXTVAL,?, 'S', ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getGame());
			pstmt.setString(3, dto.getBtitle());
			pstmt.setInt(4, dto.getBcost());
			pstmt.setString(5, dto.getbCname());
			pstmt.setString(6, dto.getBcontent());
			pstmt.setString(7, dto.getBphoto());
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
	public int writeBuy(BoardDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO BOARD(BNO, MID, BBS, GAME, BTITLE, BCOST, BCNAME, BCONTENT, BPHOTO)" + 
				"    VALUES (SEQ_B.NEXTVAL,?, 'B', ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getGame());
			pstmt.setString(3, dto.getBtitle());
			pstmt.setInt(4, dto.getBcost());
			pstmt.setString(5, dto.getbCname());
			pstmt.setString(6, dto.getBcontent());
			pstmt.setString(7, dto.getBphoto());
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
	public BoardDto getContent (int bno, String bbs) {
		BoardDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM BOARD WHERE BNO = ? AND BBS=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, bbs);
			rs = pstmt.executeQuery();
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
	public int modifyBoard(BoardDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD SET BTITLE=?," + 
				"                                    BCOST=?," + 
				"                                    BCNAME=?," + 
				"                                    BCONTENT=?," + 
				"                                    BPHOTO=?" + 
				"                            WHERE BNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBtitle());
			pstmt.setInt(2, dto.getBcost());
			pstmt.setString(3, dto.getbCname());
			pstmt.setString(4, dto.getBcontent());
			pstmt.setString(5, dto.getBphoto());
			pstmt.setInt(6, dto.getBno());
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
