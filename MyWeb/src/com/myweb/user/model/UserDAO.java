package com.myweb.user.model;

import java.sql.*;
import java.text.SimpleDateFormat;

import com.myweb.util.JdbcUtil;

public class UserDAO {
	
	// UserDAO는 불필요하게 여러개 만들어 질 필요가 없기때문에 
	// 한개의 객체만 만들어 지도록 Singleton형식으로 설계합니다
	
	//요즘에는 자동으로 싱글톤이긴 함. 하지만 만들어보자~
	
	//1. 나 자신의 객체를 생성해서 1개로 제한합니다.
	private static UserDAO instance = new UserDAO();
	
	//2. 직접객체를 생성할 수 없도록 생성자에도  private
	private UserDAO() {
		// 드라이버 로드
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			System.out.println("드라이브 호출에러");
		}
	}
	
	//3. 외부에서 객체생성을 요구할 때 getter메서드를 통해 1번의 객체를 반환
	public static UserDAO getInstance() {
		return instance;
	}
	
	//---------------------------------------------------//
	// DB연결 변수들을 함수로 선언함.
	
	private String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	private String uid = "JSP";
	private String upw = "JSP";
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 회원가입매서드 - 성공실패를  int형으로 반환
	public int join(UserVO vo) {
		int result = 0;		//결과를 반환할 변수
		String sql = "insert into users(id, pw, name, email, address) values(?,?,?,?,?)";
		
		try {
			// 1. conn객체 생성
			conn = DriverManager.getConnection(url, uid, upw);
			// 2. pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getAddress());
			// 3. sql문 실행
			result = pstmt.executeUpdate();  // 성공실패결과를 1, 0으로 알려줌
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return result;
	}
	
	//중복검사 메서드
	public int checkId(String id) {		// 필요한건  id하나라  vo가 아닌 id만 받음
		int result = 0;
		String sql = "select * from users where id = ?";
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			// select의 경우 실행은 executeQuery => 결과값이 반환되어 와야해서
			rs = pstmt.executeQuery();	// id는 pk이기때문에 1개이거나 0개이거나 이다
			if(rs.next()) { // 존재하면 중복
				result = 1;
			} else {		//존재하지 않으면 중복x
				result = 0;
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		
		return result;
	}
	
	public UserVO login(String id, String pw) {
		UserVO vo = null;
		String sql = "select * from users where id = ? and pw=?";
		
		try {
			conn = DriverManager.getConnection(url,uid,upw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 가입되어 있는거
				String name = rs.getString("name");
				String email = rs.getString("email");
				String address = rs.getString("address");
				Timestamp regdate = rs.getTimestamp("regdate");
				
				vo = new UserVO(id, pw, name, email, address, regdate);		

			} else {		//없는거
				vo = null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return vo;
	}
	
	
	
	
	
	
	
}
