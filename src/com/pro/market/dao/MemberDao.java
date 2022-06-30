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

import com.pro.market.dto.MemberDto;

public class MemberDao {

	public static final int EXISTENT = 0;
	public static final int NONEXISTENT = 1;
	public static final int LOGIN_FAIL = 0;
	public static final int LOGIN_SUCCESS = 1;
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private static MemberDao instance = new MemberDao();

	public static MemberDao getInstance() {
		return instance;
	}

	private MemberDao() {
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

	// 회원가입시 ID 중복체크
	public int midConfirm(String mid) {
		int result = EXISTENT;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE mid = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = EXISTENT;
			} else {
				result = NONEXISTENT;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	// 이메일 중복체크
	public int emailConfirm(String memail) {
		int result = EXISTENT;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE MEMAIL = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memail);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = EXISTENT;
			} else {
				result = NONEXISTENT;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	// 회원가입
	public int joinMember(MemberDto member) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER(MID, MPW, MNAME, MTEL, MEMAIL, MADDRESS, MBIRTH, MGENDER)"
				+ "    VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMid());
			pstmt.setString(2, member.getMpw());
			pstmt.setString(3, member.getMname());
			pstmt.setString(4, member.getMtel());
			pstmt.setString(5, member.getMemail());
			pstmt.setString(6, member.getMaddress());
			pstmt.setDate(7, member.getMbirth());
			pstmt.setString(8, member.getMgender());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	// 로그인
	public int loginCheck(String mid, String mpw) {
		int result = LOGIN_FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE MID = ? AND MPW= ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = LOGIN_SUCCESS;
			} else {
				result = LOGIN_FAIL;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	// MID로 DTO 가져오기(내정보)
	public MemberDto getMember(String mid) {
		MemberDto member = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE MID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String mpw = rs.getString("mpw");
				String mname = rs.getString("mname");
				String mtel = rs.getString("mtel");
				String memail = rs.getString("memail");
				String maddress = rs.getString("maddress");
				Date mbirth = rs.getDate("mbirth");
				String mgender = rs.getString("mgender");
				String mgrade = rs.getString("mgrade");
				member = new MemberDto(mid, mpw, mname, mtel, memail, maddress, mbirth, mgender, mgrade);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return member;
	}

	// 회원정보 수정
	public int modifyMember(MemberDto member) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER SET MPW=?," + "                                      MNAME=?,"
				+ "                                      MTEL=?," + "                                      MEMAIL=?,"
				+ "                                      MADDRESS=?,"
				+ "                                      MGENDER=?," + "                                      MBIRTH=?"
				+ "                                WHERE MID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMpw());
			pstmt.setString(2, member.getMname());
			pstmt.setString(3, member.getMtel());
			pstmt.setString(4, member.getMemail());
			pstmt.setString(5, member.getMaddress());
			pstmt.setString(6, member.getMgender());
			pstmt.setDate(7, member.getMbirth());
			pstmt.setString(8, member.getMid());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	// 거래내역에 따른 등급변경
	public int upgradeMember(String mid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER " + "        SET MGRADE = "
				+ "        (SELECT G.MGRADE FROM MEMBER M, MEMBER_GRADE G "
				+ "        WHERE (SELECT COUNT(TNO) FROM TRADE WHERE SID = ? OR BID=?) BETWEEN LOW AND HIGH AND MID=?) "
				+ "        WHERE MID = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mid);
			pstmt.setString(3, mid);
			pstmt.setString(4, mid);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
}
