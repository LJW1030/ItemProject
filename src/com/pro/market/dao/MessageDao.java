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

import com.pro.market.dto.MessageDto;

public class MessageDao {

	public static final int FAIL = 0;
	public static final int SUCCESS = 1;

	private static MessageDao instance = new MessageDao();

	public static MessageDao getInstance() {
		return instance;
	}

	private MessageDao() {
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

	// 메시지 보내기
	public int sendMessage(MessageDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MESSAGE(ENO, SENDID, GETID, ETITLE, ECONTENT)"
				+ "    VALUES (SEQ_E.NEXTVAL, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSendId());
			pstmt.setString(2, dto.getGetId());
			pstmt.setString(3, dto.getEtitle());
			pstmt.setString(4, dto.getEcontent());
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "메시지 보내기 성공" : "메시지 보내기 실패");
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

	// 보낸 메시지함
	public ArrayList<MessageDto> sendPost(String sendId) {
		ArrayList<MessageDto> dtos = new ArrayList<MessageDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT SENDID, GETID, ETITLE FROM MESSAGE WHERE SENDID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sendId);
			;
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int eno = rs.getInt("eno");
				String getId = rs.getString("getid");
				String etitle = rs.getString("etitle");
				String econtent = rs.getString("econtent");
				Date erdate = rs.getDate("erdate");
				dtos.add(new MessageDto(eno, sendId, getId, etitle, econtent, erdate));
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

	// 받은 메시지함
	public ArrayList<MessageDto> getPost(String getId) {
		ArrayList<MessageDto> dtos = new ArrayList<MessageDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT SENDID, GETID, ETITLE FROM MESSAGE WHERE GETID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, getId);
			;
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int eno = rs.getInt("eno");
				String sendId = rs.getString("sendid");
				String etitle = rs.getString("etitle");
				String econtent = rs.getString("econtent");
				Date erdate = rs.getDate("erdate");
				dtos.add(new MessageDto(eno, sendId, getId, etitle, econtent, erdate));
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
	// 메시지 삭제
	public int deleteMessage(int eno) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM MESSAGE WHERE ENO =?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, eno);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "메시지 삭제 성공":"메시지 삭제 실패");
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
