package com.testweb.user.model;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.catalina.valves.JDBCAccessLogValve;

import com.testweb.util.JdbcUtil;

public class UserDAO {
	private static UserDAO instance = new UserDAO();
	private DataSource ds;
	private UserDAO() {
		try {
			InitialContext ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 아이디 중복검사
	public int checkId(String id) {
		int result = 0;
		
		String sql = "select * from users where id = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			}else {
				result = 0;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	// 회원가입 인서트
	public int join(UserVO vo) {
		int result = 0;
		
		String sql = "insert into users(id, pw, name, phoneNumber, email, basicAddress, detailAddress) values(?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhoneNumber());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getBasicAddress());
			pstmt.setString(7, vo.getDetailAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, null);
		}
		
		return result;
	}

	public UserVO login(String id, String pw) {
		
		UserVO vo = null;
		
		String sql = "select * from users where id=? and pw=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String name = rs.getString("name");
				String phoneNumber = rs.getString("phonenumber");
				String email = rs.getString("email");
				String basicAddress = rs.getString("basicaddress");
				String detailAddress = rs.getString("detailaddress");
				Timestamp regdate = rs.getTimestamp("regdate");
				
				vo = new UserVO(id, pw, name, phoneNumber, email, basicAddress, detailAddress, regdate);
			}else {
				return null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return vo;
	}

	public int delete(String id) {
		String sql = "delete from users where id=?";
		int result = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, null);
		}
		
		return result;
	}

	public int update(UserVO vo) {
		int result = 0;
		String sql = "update users set pw=?, name=?, phonenumber=?, email=?, basicaddress=?, detailaddress=? where id=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPw());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPhoneNumber());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getBasicAddress());
			pstmt.setString(6, vo.getDetailAddress());
			pstmt.setString(7, vo.getId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, null);
		}
		return result;
	}
	
	
	
}
