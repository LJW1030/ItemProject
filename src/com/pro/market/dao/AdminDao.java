package com.pro.market.dao;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;

	private static AdminDao instance = new AdminDao();

	public static AdminDao getInstance() {
		return instance;
	}

	private AdminDao() {
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
	
}
