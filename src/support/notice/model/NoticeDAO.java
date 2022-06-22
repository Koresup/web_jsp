package support.notice.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class NoticeDAO {
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public NoticeDAO() {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/projectDB");
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
		public int totalCnt(){
		
		sql = "select count(*) from notice";
		
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
		
		public int totalCntSearch(String filter, String keyword){
			
			sql = "select count(*) from notice where filter = ? and title like ? ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,filter);
				ptmt.setString(2,"%"+keyword+"%");
				rs = ptmt.executeQuery();
				
				rs.next();
				
				return rs.getInt(1);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return 0;
		}
		
		public int totalCntSearch(String keyword){
			
			sql = "select count(*) from notice where title like ? ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,"%"+keyword+"%");
				rs = ptmt.executeQuery();
				
				rs.next();
				
				return rs.getInt(1);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return 0;
		}
		
		public ArrayList<NoticeDTO> list(int start, int limit){
			ArrayList<NoticeDTO> res = new ArrayList<>();
			
			sql = "select * from notice order by no desc limit ?, ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1,start);
				ptmt.setInt(2, limit);
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					NoticeDTO dto = new NoticeDTO();
					// 필요한것만 보이기
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setFilter(rs.getString("filter"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					
					
					res.add(dto);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return res;
		}
		
		
		public ArrayList<NoticeDTO> search(int start, int limit, String filter, String keyword){
			ArrayList<NoticeDTO> res = new ArrayList<>();
			
			sql = "select * from notice where filter = ? and title like ? order by no desc limit ?, ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,filter);
				ptmt.setString(2, "%"+keyword+"%");
				ptmt.setInt(3,start);
				ptmt.setInt(4, limit);
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					NoticeDTO dto = new NoticeDTO();
					// 필요한것만 보이기
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setFilter(rs.getString("filter"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					
					
					res.add(dto);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return res;
		}
		
		public ArrayList<NoticeDTO> search(int start, int limit, String keyword){
			ArrayList<NoticeDTO> res = new ArrayList<>();
			sql = "select * from notice where title like ? order by no desc limit ?, ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, "%"+keyword+"%");
				ptmt.setInt(2,start);
				ptmt.setInt(3, limit);
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					NoticeDTO dto = new NoticeDTO();
					// 필요한것만 보이기
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setFilter(rs.getString("filter"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					
					
					res.add(dto);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return res;
		}
		
		
		public NoticeDTO detail(String notice_id){
			NoticeDTO dto = null;
			
			sql = "select * from notice where id = ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, notice_id);
				rs = ptmt.executeQuery();
				
				if(rs.next()) {
					dto = new NoticeDTO();
					// 필요한것만 보이기
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setFilter(rs.getString("filter"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return dto;
		}
		
		
		public void insert(NoticeDTO dto){
			
			sql = "insert into notice(id, title, content, filter, reg_date) "
					+ "values (? , ? , ? , ? ,sysdate())";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, dto.getId());
				ptmt.setString(2, dto.getTitle());
				ptmt.setString(3, dto.getContent());
				ptmt.setString(4, dto.getFilter());
				ptmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
		}
		
		
	public int modify(NoticeDTO dto){
			int res = 0;
			
			sql = "update notice set title = ?, content = ?, filter = ? "
					+ "where id = ?";
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, dto.getTitle());
				ptmt.setString(2, dto.getContent());
				ptmt.setString(3, dto.getFilter());
				ptmt.setString(4, dto.getId());
				res = ptmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return res;
		}

		public int delete(NoticeDTO dto){
		int res = 0;
		
		sql = "delete from notice where id = ?";
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
