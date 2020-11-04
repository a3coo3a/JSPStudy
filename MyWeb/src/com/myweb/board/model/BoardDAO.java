package com.myweb.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.*;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.myweb.util.JdbcUtil;

import oracle.net.aso.f;


public class BoardDAO {

		private static BoardDAO instance = new BoardDAO();
		
	
		private BoardDAO() {
			try {
				InitialContext ctx = new InitialContext();  
				ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
			} catch (Exception e) {
				System.out.println("드라이브 호출에러");
			}
		}

		public static BoardDAO getInstance() {
			return instance;
		}
		
		// DB연결 변수들을 함수로 선언함.
		private DataSource ds;
		private Connection conn = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;

		// 글 등록 메서드
		public void regist(String writer, String title, String content){
			String sql = "insert into board(bno, writer, title, content) values(board_seq.nextval, ?,?,?)";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, writer);
				pstmt.setString(2, title);
				pstmt.setString(3, content);
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn, pstmt, null);
			}
			
			
		}
		
		
		// 글조회
		public ArrayList<BoardVO> getList() {
			
			ArrayList<BoardVO> list = new ArrayList<>();
			
			/*
			 * 데이터 베이스에서 번호를 내림차순으로 조회해서 리스트에 담는 코드를 작성
			 * 
			 */
			
			String sql = "select * from board order by bno desc";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
				
					int bno = rs.getInt("bno");
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String content = rs.getString("content");
					Timestamp regdate = rs.getTimestamp("regdate");
					int hit = rs.getInt("hit");
				
					list.add(new BoardVO(bno, writer, title, content, regdate, hit ));
				
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn, pstmt, rs);
			}
			
			return list;
		}
		
		
		//상세보기 메서드
		public BoardVO getContent(String bno) {
			BoardVO vo = new BoardVO();
			
			/*
			 * 번호기준으로  select 구문으로 조회해서  BoardVO에 저장하고, 
			 * vo이름으로 화면에 데이터를 전달
			 * 
			 * 
			 */
			
			String sql = "select * from board where bno = ?";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bno);
				//pstmt.setInt(1, Integer.parseInt(bno));
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					vo.setBno(rs.getInt("bno"));
					vo.setWriter(rs.getString("writer"));
					vo.setTitle(rs.getString("title"));
					vo.setContent(rs.getString("content"));
					vo.setRegdate(rs.getTimestamp("regdate"));
					vo.setHit(rs.getInt("hit"));
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn, pstmt, rs);
			}
			
		
			return vo;
			
		}
		
		
}
