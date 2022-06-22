package lesson.soc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class LessonDAO {
	
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
		
	public LessonDAO() {
			
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/projectDB");
			con = ds.getConnection();
				
		} catch (Exception e) {
			e.printStackTrace();
		}
}

	
	public int totalCnt() {
		
		sql = "select count(*) from lesson_soc";
		
		try {
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
		
			rs.next();
				
			return rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return 0;
	}
	
public int totalCntSearch(String search){
		
		sql = "select count(*) from lesson_soc where sname like ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1,"%"+search+"%");
			rs = ptmt.executeQuery();
			
			rs.next();
			
			return rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public int totalCntSearch(String field, String search){
		
		sql = "select count(*) from lesson_soc where " + field + " and sname like ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1,"%"+search+"%");
			rs = ptmt.executeQuery();
			
			rs.next();
			
			return rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public ArrayList<LessonDTO> list(int start, int limit) {
		ArrayList<LessonDTO> res = new ArrayList<LessonDTO>();

		sql = "select * from lesson_soc order by post_id desc limit ?, ? "; // 뒤는 번호를 받아와야함
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, start);
			ptmt.setInt(2, limit);
			
			rs = ptmt.executeQuery(); // 여기에 sql ㄴㄴ
		
			while(rs.next()) {

				LessonDTO dto = new LessonDTO();
				
				dto.setPost_id(rs.getString("post_id"));
				dto.setCategory(rs.getString("category"));
				dto.setImg(rs.getString("img"));
				dto.setSname(rs.getString("sname"));
				dto.setLesson_time(rs.getString("lesson_time"));
				
				dto.setManager_id(rs.getString("manager_id"));
				dto.setPrice(rs.getInt("price"));
				
				dto.setMax_student(rs.getInt("max_student"));
				dto.setOption1(rs.getBoolean("option1"));
				dto.setOption2(rs.getBoolean("option2"));
				dto.setOption3(rs.getBoolean("option3"));
				dto.setOption4(rs.getBoolean("option4"));
				dto.setOption5(rs.getBoolean("option5"));
				
				dto.setPostcode(rs.getString("postcode"));
				dto.setAddress(rs.getString("address"));
				dto.setAddress_detail(rs.getString("address_detail"));
				
				res.add(dto);
								
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
		
	}
	
	public ArrayList<LessonDTO> list(int start, int limit, String field, String search) {
		ArrayList<LessonDTO> res = new ArrayList<LessonDTO>();
		
		sql = "select * from lesson_soc "
				+ "where " + field + " like ? order by reg_date desc limit ?, ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, "%"+search+"%");
			ptmt.setInt(2, start);
			ptmt.setInt(3, limit);
			
			rs = ptmt.executeQuery();
		
			while(rs.next()) {
				
				LessonDTO dto = new LessonDTO();
				
				dto.setPost_id(rs.getString("post_id"));
				dto.setCategory(rs.getString("category"));
				dto.setImg(rs.getString("img"));
				dto.setSname(rs.getString("sname"));
				dto.setLesson_time(rs.getString("lesson_time"));
				dto.setManager_id(rs.getString("manager_id"));
				dto.setPrice(rs.getInt("price"));
				
				dto.setMax_student(rs.getInt("max_student"));
				dto.setOption1(rs.getBoolean("option1"));
				dto.setOption2(rs.getBoolean("option2"));
				dto.setOption3(rs.getBoolean("option3"));
				dto.setOption4(rs.getBoolean("option4"));
				dto.setOption5(rs.getBoolean("option5"));
				
				dto.setPostcode(rs.getString("postcode"));
				dto.setAddress(rs.getString("address"));
				dto.setAddress_detail(rs.getString("address_detail"));
				res.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
		
	}
	

	public ArrayList<LessonDTO> list(int start, int limit, String search) {
		ArrayList<LessonDTO> res = new ArrayList<LessonDTO>();
		
		sql = "select * from lesson_soc "
				+ "where sname like ? order by reg_date desc limit ?, ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, "%" + search + "%");
			ptmt.setInt(2, start);
			ptmt.setInt(3, limit);
			
			rs = ptmt.executeQuery();
		
			while(rs.next()) {
				
				LessonDTO dto = new LessonDTO();
				
				dto.setPost_id(rs.getString("post_id"));
				dto.setCategory(rs.getString("category"));
				dto.setImg(rs.getString("img"));
				dto.setSname(rs.getString("sname"));
				dto.setLesson_time(rs.getString("lesson_time"));
				dto.setManager_id(rs.getString("manager_id"));
				dto.setPrice(rs.getInt("price"));
				
				dto.setMax_student(rs.getInt("max_student"));
				dto.setOption1(rs.getBoolean("option1"));
				dto.setOption2(rs.getBoolean("option2"));
				dto.setOption3(rs.getBoolean("option3"));
				dto.setOption4(rs.getBoolean("option4"));
				dto.setOption5(rs.getBoolean("option5"));
				
				dto.setPostcode(rs.getString("postcode"));
				dto.setAddress(rs.getString("address"));
				dto.setAddress_detail(rs.getString("address_detail"));
				
				res.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
		
	}
	
	public LessonDTO detail(String post_id) {
		LessonDTO dto = null;
		
		sql = "select * from lesson_soc where post_id =?";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, post_id);
			rs = ptmt.executeQuery(); // 여기에 sql ㄴㄴ
		
			if(rs.next()) {
				
				dto = new LessonDTO();
				
				dto.setCategory(rs.getString("category"));
				dto.setPost_id(rs.getString("post_id"));
				dto.setSname(rs.getString("sname"));
				dto.setImg(rs.getString("img"));
				dto.setContents_info(rs.getString("contents_info"));
				dto.setContents_detail(rs.getString("contents_detail"));
				dto.setContents_rule(rs.getString("contents_rule"));
				dto.setContents_refund(rs.getString("contents_refund"));
				dto.setOption1(rs.getBoolean("option1"));
				dto.setOption2(rs.getBoolean("option2"));
				dto.setOption3(rs.getBoolean("option3"));
				dto.setOption4(rs.getBoolean("option4"));
				dto.setOption5(rs.getBoolean("option5"));
				dto.setPrice(rs.getInt("price"));
				dto.setPostcode(rs.getString("postcode"));
				dto.setAddress(rs.getString("address"));
				dto.setAddress_detail(rs.getString("address_detail"));
				dto.setManager_id(rs.getString("manager_id"));
				dto.setLesson_time(rs.getString("lesson_time"));
				dto.setMax_student(rs.getInt("max_student"));

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return dto;
		
	}
	
	public void insert(LessonDTO dto) {	
		
		sql = "insert into lesson_soc (post_id, category, sname, "
				+ "contents_info, contents_detail, contents_rule, contents_refund, "
				+ "price, img, lesson_time, manager_id, max_student, postcode, address, address_detail, "
				+ "option1, option2, option3, option4, option5, reg_date) values " 
				+ "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate())";
		
		try {
			ptmt = con.prepareStatement(sql);
			
			ptmt.setString(1, dto.getPost_id());
			ptmt.setString(2, dto.getCategory());
			ptmt.setString(3, dto.getSname());
			ptmt.setString(4, dto.getContents_info());
			ptmt.setString(5, dto.getContents_detail());
			ptmt.setString(6, dto.getContents_rule());
			ptmt.setString(7, dto.getContents_refund());
			ptmt.setInt(8, dto.getPrice());
			ptmt.setString(9, dto.getImg());
			ptmt.setString(10, dto.getLesson_time());
			ptmt.setString(11, dto.getManager_id());
			ptmt.setInt(12, dto.getMax_student());
			
			ptmt.setString(13, dto.getPostcode());
			ptmt.setString(14, dto.getAddress());
			ptmt.setString(15, dto.getAddress_detail());
			
			ptmt.setInt(16, dto.getIntOption1());
			ptmt.setInt(17, dto.getIntOption2());
			ptmt.setInt(18, dto.getIntOption3());
			ptmt.setInt(19, dto.getIntOption4());
			ptmt.setInt(20, dto.getIntOption5());
			
			ptmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			close();
		}
		
	}
	
	
	public int modify(LessonDTO dto) {	
		int res = 0;
		
		sql = "update lesson_soc set category = ?, sname = ?, img = ?, "
				+ "contents_info = ?, contents_detail = ?, contents_rule = ?, contents_refund = ?, "
				+ "price = ?, lesson_time = ?, manager_id = ?, max_student = ?, "
				+ "postcode = ?, address = ?, address_detail = ?, "
				+ "option1 = ?, option2 = ?, option3 = ?, option4 = ?, option5 = ? "
				+ "where post_id=? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			
			ptmt.setString(1, dto.getCategory());
			ptmt.setString(2, dto.getSname());
			ptmt.setString(3, dto.getImg());
			ptmt.setString(4, dto.getContents_info());
			ptmt.setString(5, dto.getContents_detail());
			ptmt.setString(6, dto.getContents_rule());
			ptmt.setString(7, dto.getContents_refund());
			ptmt.setInt(8, dto.getPrice());
			
			ptmt.setString(9, dto.getLesson_time());
			ptmt.setString(10, dto.getManager_id());
			ptmt.setInt(11, dto.getMax_student());
			
			ptmt.setString(12, dto.getPostcode());
			ptmt.setString(13, dto.getAddress());
			ptmt.setString(14, dto.getAddress_detail());
			
			ptmt.setInt(15, dto.getIntOption1());
			ptmt.setInt(16, dto.getIntOption2());
			ptmt.setInt(17, dto.getIntOption3());
			ptmt.setInt(18, dto.getIntOption4());
			ptmt.setInt(19, dto.getIntOption5());
			ptmt.setString(20, dto.getPost_id());
						
			res = ptmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			close();
		}
		return res;
		
	}
	
	public int delete(LessonDTO dto) {	
		int res = 0;
		
		sql = "delete from lesson_soc where post_id=? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.post_id);
			res = ptmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			close();
		}
		return res;
	}
	
	public void close() {
		if (rs!=null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
		if (ptmt!=null) try { ptmt.close(); } catch (SQLException e) {e.printStackTrace();}
		if (con!=null) try { con.close(); } catch (SQLException e) {e.printStackTrace();}
	}

}
