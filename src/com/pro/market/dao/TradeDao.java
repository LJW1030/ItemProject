package com.pro.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.pro.market.dto.TradeDto;

public class TradeDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;

	private static TradeDao instance = new TradeDao();

	public static TradeDao getInstance() {
		return instance;
	}

	private TradeDao() {
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

	// 판매 거래내역 불러오기
	public ArrayList<TradeDto> getSellTrade(String sid) {
		ArrayList<TradeDto> dtos = new ArrayList<TradeDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT T.BNO, BTITLE, SID, BID FROM TRADE T, BOARD B WHERE T.BNO = B.BNO AND SID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String bid = rs.getString("bid");
				String btitle = rs.getString("btitle");
				dtos.add(new TradeDto(bno, sid, bid, btitle));
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

	// 구매 거래내역 불러오기
	public ArrayList<TradeDto> getBuyTrade(String bid) {
		ArrayList<TradeDto> dtos = new ArrayList<TradeDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT T.BNO, BTITLE, SID, BID FROM TRADE T, BOARD B WHERE T.BNO = B.BNO AND BID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String sid = rs.getString("sid");
				String btitle = rs.getString("btitle");
				dtos.add(new TradeDto(bno, sid, bid, btitle));
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

	// 거래완료
	public int completeTrade(TradeDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO TRADE(TNO, BNO, SID, BID)" + 
				"    VALUES (SEQ_T.NEXTVAL, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBno());
			pstmt.setString(2, dto.getSid());
			pstmt.setString(3, dto.getBid());
			result = pstmt.executeUpdate();
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
}
