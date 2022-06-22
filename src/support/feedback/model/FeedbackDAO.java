package support.feedback.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class FeedbackDAO {
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public FeedbackDAO() {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/projectDB");
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
		public int totalCnt(){
		
		sql = "select count(*) from feedback";
		
		try {
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			
			rs.next();
			
			return rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
		
		public int myTotalCnt(String user_id){
			
			sql = "select count(*) from feedback where user_id = ? ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, user_id);
				rs = ptmt.executeQuery();
				
				rs.next();
				
				return rs.getInt(1);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return 0;
		}
		public ArrayList<FeedbackDTO> list(int start, int limit){
			ArrayList<FeedbackDTO> res = new ArrayList<>();
			
			sql = "select * from feedback order by no desc limit ?, ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1,start);
				ptmt.setInt(2, limit);
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					FeedbackDTO dto = new FeedbackDTO();
					// 필요한것만 보이기
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setQuestion(rs.getString("question"));
					dto.setFilter(rs.getString("filter"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					if(rs.getString("answer")!=null) {
						dto.setAnswer(rs.getString("answer"));
						dto.setReg_date_answer(rs.getTimestamp("reg_date_answer"));
					}
					
					res.add(dto);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return res;
		}
		
		public ArrayList<FeedbackDTO> mylist(int start, int limit, String user_id){
			ArrayList<FeedbackDTO> res = new ArrayList<>();
			
			sql = "select * from feedback where user_id = ? order by no desc limit ?, ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, user_id);
				ptmt.setInt(2,start);
				ptmt.setInt(3, limit);
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					FeedbackDTO dto = new FeedbackDTO();
					// 필요한것만 보이기
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setQuestion(rs.getString("question"));
					dto.setFilter(rs.getString("filter"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					if(rs.getString("answer")!=null) {
						dto.setAnswer(rs.getString("answer"));
						dto.setReg_date_answer(rs.getTimestamp("reg_date_answer"));
					}
					
					res.add(dto);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return res;
		}
		
		public FeedbackDTO detail(String id){
			FeedbackDTO dto = null;
			
			sql = "select * from feedback where id = ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, id);
				rs = ptmt.executeQuery();
				
				if(rs.next()) {
					dto = new FeedbackDTO();
					// 필요한것만 보이기
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setQuestion(rs.getString("question"));
					dto.setFilter(rs.getString("filter"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					if(rs.getString("answer")!=null) {
						dto.setAnswer(rs.getString("answer"));
						dto.setReg_date_answer(rs.getTimestamp("reg_date_answer"));
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return dto;
		}
		
		public void insert(FeedbackDTO dto){
			
			sql = "insert into feedback(id, title, question, filter, user_id, reg_date) "
					+ "values (? , ?, ? , ?, ?, sysdate() )";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, dto.getId());
				ptmt.setString(2, dto.getTitle());
				ptmt.setString(3, dto.getQuestion());
				ptmt.setString(4, dto.getFilter());
				ptmt.setString(5, dto.getUser_id());
				
				
				ptmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
		}
		
		public int modify(FeedbackDTO dto){
			int res = 0;
			
			sql = "update feedback set title = ?, question = ?, filter = ?"
					+ "where id = ? and user_id = ?";
			try {
				ptmt = con.prepareStatement(sql);
				
				ptmt.setString(1, dto.getTitle());
				ptmt.setString(2, dto.getQuestion());
				ptmt.setString(3, dto.getFilter());
				ptmt.setString(4, dto.getId());
				ptmt.setString(5, dto.getUser_id());
				res = ptmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return res;
		}
		
		public int insertAnswer(FeedbackDTO dto){
			int res = 0;
			
			sql = "update feedback set answer = ?, reg_date_answer = sysdate()"
					+ "where id = ? and user_id = ?";
			try {
				ptmt = con.prepareStatement(sql);
				
				ptmt.setString(1, dto.getAnswer());
				ptmt.setString(2, dto.getId());
				ptmt.setString(3, dto.getUser_id());
				res = ptmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return res;
		}
		
		public int delete(FeedbackDTO dto){
			int res = 0;
			
			sql = "delete from feedback where id = ?";
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, dto.getId());
				res = ptmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return res;
		}
		
		
		
		
		public void close() {
			if(rs!=null) {try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
			if(ptmt!=null) {try {ptmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(con!=null) {try {con.close();} catch (SQLException e) {e.printStackTrace();}}
		}
}
