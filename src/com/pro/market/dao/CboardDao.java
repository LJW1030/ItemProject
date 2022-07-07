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

import com.pro.market.dto.CboardDto;

public class CboardDao {

	public static final int FAIL = 0;
	public static final int SUCCESS = 1;

	private static CboardDao instance = new CboardDao();

	public static CboardDao getInstance() {
		return instance;
	}

	private CboardDao() {
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

	// 글목록
	public ArrayList<CboardDto> getCBoard(String cid,int startRow, int endRow) {
		ArrayList<CboardDto> dtos = new ArrayList<CboardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM " + "        (SELECT ROWNUM RN, A.* FROM "
				+ "        (SELECT * FROM CBOARD WHERE CID=? ORDER BY CREF DESC, CRE_STEP) A)" + "        WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int cno = rs.getInt("cno");
				String ctitle = rs.getString("ctitle");
				String ccontent = rs.getString("ccontent");
				int cref = rs.getInt("cref");
				int cre_step = rs.getInt("cre_step");
				int cre_level = rs.getInt("cre_level");
				Date crdate = rs.getDate("crdate");
				dtos.add(new CboardDto(cno, cid, ctitle, ccontent, cref, cre_step, cre_level, crdate));
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
	// 관리자용 글목록
		public ArrayList<CboardDto> getadCBoard(int startRow, int endRow) {
			ArrayList<CboardDto> dtos = new ArrayList<CboardDto>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM " + "        (SELECT ROWNUM RN, A.* FROM "
					+ "        (SELECT * FROM CBOARD ORDER BY CREF DESC, CRE_STEP) A)" + "        WHERE RN BETWEEN ? AND ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					int cno = rs.getInt("cno");
					String cid = rs.getString("cid");
					String ctitle = rs.getString("ctitle");
					String ccontent = rs.getString("ccontent");
					int cref = rs.getInt("cref");
					int cre_step = rs.getInt("cre_step");
					int cre_level = rs.getInt("cre_level");
					Date crdate = rs.getDate("crdate");
					dtos.add(new CboardDto(cno, cid, ctitle, ccontent, cref, cre_step, cre_level, crdate));
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

	// 등록된 글수
	public int getCboardCnt() {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM CBOARD";
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
	// 본인이 작성한 글 수(회원용)
	public int getMemberCboardCnt(String cid) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM CBOARD WHERE CID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
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
	// 원글쓰기
	public int writeCboard(String cid, String ctitle, String ccontent) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO CBOARD (CNO, CID, CTITLE, CCONTENT, CREF, CRE_STEP, CRE_LEVEL)"
				+ "    VALUES (SEQ_C.NEXTVAL, ?, ?, ?, SEQ_C.CURRVAL, 0, 0)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			pstmt.setString(2, ctitle);
			pstmt.setString(3, ccontent);
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

	// 답변글 쓰기전 STEP
	private void preReplyStepA(int cref, int cre_step) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE CBOARD SET CRE_STEP = CRE_STEP + 1 WHERE CREF=? AND CRE_STEP>?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cref);
			pstmt.setInt(2, cre_step);
			pstmt.executeUpdate();
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
	}

	// 답변글 쓰기
	public int replyBoard(String cid, String ctitle, String ccontent, int cref, int cre_step, int cre_level) {
		preReplyStepA(cref, cre_step); 
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO CBOARD (CNO, CID, CTITLE, CCONTENT, CREF, CRE_STEP, CRE_LEVEL)" + 
				"    VALUES (SEQ_C.NEXTVAL, ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			pstmt.setString(2, ctitle);
			pstmt.setString(3, ccontent);
			pstmt.setInt(4, cref);
			pstmt.setInt(5, cre_step+1);
			pstmt.setInt(6, cre_level+1);
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "답변쓰기성공" : "답변쓰기실패");
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
	public CboardDto getCboardContent(int cno) {
		CboardDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM CBOARD WHERE CNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String cid = rs.getString("cid");
				String ctitle = rs.getString("ctitle");
				String ccontent = rs.getString("ccontent");
				int cref = rs.getInt("cref");
				int cre_step = rs.getInt("cre_step");
				int cre_level = rs.getInt("cre_level");
				Date crdate = rs.getDate("crdate");
				dto = new CboardDto(cno, cid, ctitle, ccontent, cref, cre_step, cre_level, crdate);
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
	// 글 삭제하기
	public int deleteCboard(int cno) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM CBOARD WHERE CNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
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
