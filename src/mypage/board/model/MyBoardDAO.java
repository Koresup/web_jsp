package mypage.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import commu_bas.board.model.BoardDTO;
import commu_bas.compet.model.CompetDTO;
import commu_bas.guest.model.GuestDTO;
import market.model.MarketDTO;


public class MyBoardDAO {
	
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
		
	public MyBoardDAO() {
			
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/projectDB");
			con = ds.getConnection();
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int commu_bas_cnt(String user_id) {
		
		sql = "select count(*) from commu_Bas_board where user_id = ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			rs = ptmt.executeQuery();
		
			rs.next();
				
			return rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return 0;
	}
	
	public ArrayList<BoardDTO> commu_bas_list(int start, int limit, String user_id) {
		ArrayList<BoardDTO> res = new ArrayList<BoardDTO>();
		
		sql = "select * from commu_Bas_board where user_id = ? "
				+ "order by post_id desc limit ?, ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			
			ptmt.setString(1, user_id);
			ptmt.setInt(2, start);
			ptmt.setInt(3, limit);
			
			rs = ptmt.executeQuery();
		
			while(rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setPost_id(rs.getString("post_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setHead(rs.getString("head"));
				dto.setTitle(rs.getString("title"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setCnt(rs.getInt("cnt"));
				
				res.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
		
	}
	
	
	public int commu_bas_compet_cnt(String user_id) {
		
		sql = "select count(*) from commu_Bas_compet where user_id = ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			rs = ptmt.executeQuery();
		
			rs.next();
				
			return rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return 0;
	}
	
	public ArrayList<CompetDTO> commu_bas_compet_list(int start, int limit, String user_id) {
		ArrayList<CompetDTO> res = new ArrayList<CompetDTO>();
		
		sql = "select * from commu_Bas_compet "
				+ "where user_id = ? order by reg_date desc limit ?, ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			ptmt.setInt(2, start);
			ptmt.setInt(3, limit);
			
			rs = ptmt.executeQuery();
		
			while(rs.next()) {
				
				CompetDTO dto = new CompetDTO();
				
				dto.setPost_id(rs.getString("post_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setHead(rs.getString("head"));
				dto.setTitle(rs.getString("title"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setCnt(rs.getInt("cnt"));
				
				res.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
		
	}
	
	public int commu_bas_guest_cnt(String user_id) {
		
		sql = "select count(*) from commu_Bas_guest where user_id = ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			rs = ptmt.executeQuery();
		
			rs.next();
				
			return rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return 0;
	}
	
	public ArrayList<GuestDTO> commu_bas_guest_list(int start, int limit, String user_id) {
		ArrayList<GuestDTO> res = new ArrayList<GuestDTO>();
		
		sql = "select * from commu_Bas_guest "
				+ "where user_id = ? order by reg_date desc limit ?, ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			ptmt.setInt(2, start);
			ptmt.setInt(3, limit);
			
			rs = ptmt.executeQuery();
		
			while(rs.next()) {
				
				GuestDTO dto = new GuestDTO();
				
				dto.setPost_id(rs.getString("post_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setHead(rs.getString("head"));
				dto.setTitle(rs.getString("title"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setCnt(rs.getInt("cnt"));
				
				res.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
		
	}
	
	public int commu_soc_cnt(String user_id) {
		
		sql = "select count(*) from commu_soc_board where user_id = ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			rs = ptmt.executeQuery();
		
			rs.next();
				
			return rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return 0;
	}
	
	public ArrayList<commu_soc.board.model.BoardDTO> commu_soc_list(int start, int limit, String user_id) {
		ArrayList<commu_soc.board.model.BoardDTO> res = new ArrayList<commu_soc.board.model.BoardDTO>();
		
		sql = "select * from commu_soc_board where user_id = ? "
				+ "order by post_id desc limit ?, ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			
			ptmt.setString(1, user_id);
			ptmt.setInt(2, start);
			ptmt.setInt(3, limit);
			
			rs = ptmt.executeQuery();
		
			while(rs.next()) {
				
				commu_soc.board.model.BoardDTO dto = new commu_soc.board.model.BoardDTO();
				
				dto.setPost_id(rs.getString("post_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setHead(rs.getString("head"));
				dto.setTitle(rs.getString("title"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setCnt(rs.getInt("cnt"));
				
				res.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
		
	}
	
	public int commu_soc_compet_cnt(String user_id) {
		
		sql = "select count(*) from commu_soc_compet where user_id = ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			rs = ptmt.executeQuery();
		
			rs.next();
				
			return rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return 0;
	}
	
	public ArrayList<commu_soc.compet.model.CompetDTO> commu_soc_compet_list(int start, int limit, String user_id) {
		ArrayList<commu_soc.compet.model.CompetDTO> res = new ArrayList<commu_soc.compet.model.CompetDTO>();
		
		sql = "select * from commu_soc_compet "
				+ "where user_id = ? order by reg_date desc limit ?, ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			ptmt.setInt(2, start);
			ptmt.setInt(3, limit);
			
			rs = ptmt.executeQuery();
		
			while(rs.next()) {
				
				commu_soc.compet.model.CompetDTO dto = new commu_soc.compet.model.CompetDTO();
				
				dto.setPost_id(rs.getString("post_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setHead(rs.getString("head"));
				dto.setTitle(rs.getString("title"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setCnt(rs.getInt("cnt"));
				
				res.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
		
	}
	
	public int commu_soc_guest_cnt(String user_id) {
		
		sql = "select count(*) from commu_soc_guest where user_id = ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			rs = ptmt.executeQuery();
		
			rs.next();
				
			return rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return 0;
	}
	
	public ArrayList<commu_soc.guest.model.GuestDTO> commu_soc_guest_list(int start, int limit, String user_id) {
		ArrayList<commu_soc.guest.model.GuestDTO> res = new ArrayList<commu_soc.guest.model.GuestDTO>();
		
		sql = "select * from commu_soc_guest "
				+ "where user_id = ? order by reg_date desc limit ?, ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			ptmt.setInt(2, start);
			ptmt.setInt(3, limit);
			
			rs = ptmt.executeQuery();
		
			while(rs.next()) {
				
				commu_soc.guest.model.GuestDTO dto = new commu_soc.guest.model.GuestDTO();
				
				dto.setPost_id(rs.getString("post_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setHead(rs.getString("head"));
				dto.setTitle(rs.getString("title"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setCnt(rs.getInt("cnt"));
				
				res.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
		
	}
	
	
	public int market_cnt(String user_id){		
		sql = "select count(*) from postlist_market where user_id = ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			rs = ptmt.executeQuery();
	
			// 1개만 찾으면 되니까 if문으로
			if(rs.next()) {				
				return rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	public ArrayList<MarketDTO> market_list(int start, int limit, String user_id){
		ArrayList<MarketDTO> res = new ArrayList<MarketDTO>();
		sql = "select * from postlist_market where user_id = ? order by post_id desc limit ?, ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			ptmt.setInt(2, start);
			ptmt.setInt(3, limit);
			rs = ptmt.executeQuery();
			
			while(rs.next()) {
				MarketDTO dto = new MarketDTO();

				dto.setPost_id(rs.getString("post_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_num(rs.getString("user_num"));
				dto.setTitle(rs.getString("title"));
				dto.setCheck_quality(rs.getString("check_quality"));
				dto.setL_category(rs.getString("l_category"));
				dto.setS_category(rs.getString("s_category"));
				dto.setDelivery(rs.getString("delivery"));
				dto.setPrice(rs.getInt("price"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setCnt(rs.getInt("cnt"));
				
				res.add(dto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
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
