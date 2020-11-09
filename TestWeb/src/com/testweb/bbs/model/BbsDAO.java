package com.testweb.bbs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.testweb.util.JdbcUtil;



public class BbsDAO {
	private static BbsDAO instance = new BbsDAO();
	
	DataSource ds;
	
	private BbsDAO() {
		try {
			InitialContext ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static BbsDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public int write(String writer, String title, String content, String id) {
		int result = 0;
		String sql = "insert into bbs(bno, writer, title, content, id) values(bbs_seq.nextval,?,?,?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, id);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, null);
		}
		
		return result;
	}

	public ArrayList<BbsVO> getList(int pageNum, int amount) {
		ArrayList<BbsVO> list = new ArrayList<>();
		
		String sql = "select *\n" + 
				"from (\n" + 
				"    select rownum rn, \n" + 
				"             bno,\n" + 
				"             writer,\n" + 
				"             title,\n" + 
				"             content,\n" + 
				"             regdate,\n" + 
				"             id \n" + 
				"    from (select * \n" + 
				"             from bbs \n" + 
				"             order by bno desc)\n" + 
				") where rn > ? and rn <= ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNum-1)*amount);
			pstmt.setInt(2, pageNum*amount);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				int bno = rs.getInt("bno");
				String writer = rs.getString("writer");
				String title = rs.getString("title"); 
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				String id = rs.getString("id");
				
				list.add(new BbsVO(bno, writer, title, content, regdate, id));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return list;
	}

	public int getTotal() {
		int total = 0;
		
		String sql = "select count(*) as total from bbs";
		
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

	public BbsVO getContent(String bno) {
		BbsVO vo = null;
		String sql = "select * from bbs where bno=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new BbsVO(rs.getInt("bno"), rs.getString("writer"), rs.getString("title"), rs.getString("content"), rs.getTimestamp("regdate"), rs.getString("id"));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return vo;
	}

	public int update(BbsVO vo) {
		int result = 0;
		String sql = "update bbs set writer=?, title=?, content=? where bno=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, vo.getBno());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		
		return result;
	}

	public ArrayList<BbsVO> getMyContent(String writer, String id) {
		ArrayList<BbsVO> list = new ArrayList<>();
		String sql = "select * from bbs where writer=? and id=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String wri = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				
				list.add(new BbsVO(bno, wri, title, content, regdate, id));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return list;
	}

	public int delete(String bno, String id) {
		int result = 0;
		String sql = "delete from bbs where bno=? and id=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno);
			pstmt.setString(2, id);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	
}
