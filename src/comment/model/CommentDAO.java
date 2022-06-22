package comment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CommentDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	public CommentDAO() {
			try {
				Context context = new InitialContext();
				DataSource ds = (DataSource) context.lookup("java:comp/env/projectDB");
				con = ds.getConnection();
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public ArrayList<CommentDTO> list(String post_id){
		ArrayList<CommentDTO> res = new ArrayList<CommentDTO>();
		sql = "select * from comment where post_id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, post_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CommentDTO dto = new CommentDTO();
				
				dto.setPost_id(rs.getString("post_id"));
				dto.setComment_id(rs.getString("comment_id"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setComment_writer(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				
				res.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
	}
	
	public void insert(CommentDTO dto) {
		sql = "insert into comment (post_id, comment_id, writer, content, reg_date) values "
				+ "(?, ?, ?, ?, sysdate())";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getPost_id());
			pstmt.setString(2, dto.getComment_id());
			pstmt.setString(3, dto.getComment_writer());
			pstmt.setString(4, dto.getContent());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
	}
	
	public int delete(String comment_id) {
			int res = 0;
			sql = "delete from comment where comment_id = ? ";
		
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, comment_id);
				
				res = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}
			return res;
	}
	
	public int modify(CommentDTO dto) {
		int res = 0;
		sql = "update comment set content = ? where comment_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.comment_id);
			
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return res;
	}
	
	public void close() {
		if (rs!=null) {try { rs.close(); } catch (SQLException e) {e.printStackTrace();}}
		if (pstmt!=null) { try { pstmt.close(); } catch (SQLException e) {e.printStackTrace();}}
		if (con!=null) { try { con.close(); } catch (SQLException e) {e.printStackTrace();}}
	}
}
