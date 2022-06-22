package support.faq.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class FaqDAO {
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public FaqDAO() {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/projectDB");
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
		public int totalCnt(){
		
		sql = "select count(*) from faq";
		
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
		public ArrayList<FaqDTO> list(int start, int limit){
			ArrayList<FaqDTO> res = new ArrayList<>();
			
			sql = "select * from faq order by no desc limit ?, ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1,start);
				ptmt.setInt(2, limit);
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					FaqDTO dto = new FaqDTO();
					// 필요한것만 보이기
					dto.setId(rs.getString("id"));
					dto.setQuestion(rs.getString("question"));
					dto.setAnswer(rs.getString("answer"));
					
					res.add(dto);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return res;
		}
		
		
		
		public FaqDTO detail(String id){
			FaqDTO dto = null;
			
			sql = "select * from faq where id = ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, id);
				rs = ptmt.executeQuery();
				
				if(rs.next()) {
					dto = new FaqDTO();
					// 필요한것만 보이기
					dto.setId(rs.getString("id"));
					dto.setQuestion(rs.getString("question"));
					dto.setAnswer(rs.getString("answer"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return dto;
		}
		
		
		public void insert(FaqDTO dto){
			
			sql = "insert into faq(id, question, answer) "
					+ "values (? , ? , ? )";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, dto.getId());
				ptmt.setString(2, dto.getQuestion());
				ptmt.setString(3, dto.getAnswer());
				ptmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
		}
		
		
	public int modify(FaqDTO dto){
			int res = 0;
			
			sql = "update faq set question = ?, answer = ?"
					+ "where id = ?";
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, dto.getQuestion());
				ptmt.setString(2, dto.getAnswer());
				ptmt.setString(3, dto.getId());
				res = ptmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return res;
		}

		public int delete(FaqDTO dto){
		int res = 0;
		
		sql = "delete from faq where id = ?";
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
