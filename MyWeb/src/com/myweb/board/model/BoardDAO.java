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

//		public ArrayList<BoardVO> getList() {
//			
//			ArrayList<BoardVO> list = new ArrayList<>();
//			
//			/*
//			 * 데이터 베이스에서 번호를 내림차순으로 조회해서 리스트에 담는 코드를 작성
//			 * 
//			 */
//			
//			String sql = "select * from board order by bno desc";
//			
//			try {
//				conn = ds.getConnection();
//				pstmt = conn.prepareStatement(sql);
//				
//				rs = pstmt.executeQuery();
//				
//				while(rs.next()) {
//				
//					int bno = rs.getInt("bno");
//					String writer = rs.getString("writer");
//					String title = rs.getString("title");
//					String content = rs.getString("content");
//					Timestamp regdate = rs.getTimestamp("regdate");
//					int hit = rs.getInt("hit");
//				
//					list.add(new BoardVO(bno, writer, title, content, regdate, hit ));
//				
//				}
//				
//				
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				JdbcUtil.close(conn, pstmt, rs);
//			}
//			
//			return list;
//		}
		// 페이지당 10개씩 조회되는 게시판
		public ArrayList<BoardVO> getList(int pageNum, int amount){
			ArrayList<BoardVO> list = new ArrayList<>();
			
			String sql = "select *\r\n" + 
						"from (\r\n" + 
						"    select rownum rn, \r\n" + 
						"             bno,\r\n" + 
						"             writer,\r\n" + 
						"             title,\r\n" + 
						"             content,\r\n" + 
						"             regdate,\r\n" + 
						"             hit\r\n" + 
						"    from (select * \r\n" + 
						"             from board \r\n" + 
						"             order by bno desc)\r\n" + 
						") where rn > ? and rn <= ?";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, (pageNum-1)*amount); // (페이지번호-1)*데이터갯수
				pstmt.setInt(2, pageNum*amount);
				
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
		
		// 전체게시글 구하는 메서드
		public int getTotal() {
			int total = 0;
			
			String sql = "select count(*) as total from board";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					total = rs.getInt("total");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn, pstmt, rs);
			}
			return total;
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
		// 수정
		public void update(String bno, String title, String content) {
			
			
			String sql = "update board set title = ?, content = ? where bno=?";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, title);
				pstmt.setString(2, content);
				pstmt.setString(3, bno);
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn, pstmt, rs);
			}
			
		
		}

		public void delete(String bno) {
			String sql = "delete from board where bno=?";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bno);
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {	
				JdbcUtil.close(conn, pstmt, null);
			}
			
		}
		
		//조회수 업데이트 메서드
		public void upHit(String bno) {
			String sql = "update board set hit = hit+1 where bno = ?";
		
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bno);
				
				pstmt.executeUpdate();
				
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn, pstmt, null);
			}
		
		
		}
		
		
		
		
		
}
