package payment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import gym.basketball.model.BasketballDTO;
import gym.soccer.model.SoccerDTO;
import lesson.bas.model.LessonDTO;


public class PaymentDAO {
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public PaymentDAO() {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/projectDB");
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
		public int totalCnt(){
		
		sql = "select count(*) from payment";
		
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
			
			sql = "select count(*) from payment where user_id = ? ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,user_id);
				rs = ptmt.executeQuery();
				
				rs.next();
				
				return rs.getInt(1);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return 0;
		}
		
		public int corpTotalCnt(String manager_id){
			
			sql = "select count(*) from payment where manager_id = ? ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,manager_id);
				rs = ptmt.executeQuery();
				
				rs.next();
				
				return rs.getInt(1);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return 0;
		}
		
		public int totalCntSearch(String filter, String keyword){
			
			sql = "select count(*) from payment where notice_filter = ? and INSTR(notice_title, ?) > 0";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,filter);
				ptmt.setString(2,keyword);
				rs = ptmt.executeQuery();
				
				rs.next();
				
				return rs.getInt(1);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return 0;
		}
		
//		public ArrayList<PaymentDTO> list(int start, int limit){
//			ArrayList<PaymentDTO> res = new ArrayList<>();
//			
//			sql = "select * from payment order by no desc limit ?, ?";
//			
//			try {
//				ptmt = con.prepareStatement(sql);
//				ptmt.setInt(1,start);
//				ptmt.setInt(2, limit);
//				rs = ptmt.executeQuery();
//				
//				while(rs.next()) {
//					PaymentDTO dto = new PaymentDTO();
//					// 필요한것만 보이기
//					dto.setImp_uid(rs.getString("imp_uid"));
//					dto.setBuyer_name(rs.getString("buyer_name"));
//					dto.setMerchant_uid(rs.getString("merchant_uid"));
//					dto.setId(rs.getString("id"));
//					dto.setSname(rs.getString("sname"));
//					dto.setResDate(rs.getString("resdate"));
//					dto.setResTime(rs.getString("restime"));
//					dto.setUser_id(rs.getString("user_id"));
//					dto.setAmount(rs.getInt("amount"));
//					dto.setIntRefund_reg(rs.getInt("refunt_reg"));
//					dto.setReg_date(rs.getTimestamp("reg_date"));
//					
//					res.add(dto);
//				}
//			}catch(Exception e) {
//				e.printStackTrace();
//			}finally {
//				close();
//			}
//			
//			return res;
//		}
		
		public int managerTotalCnt(String year) {
			sql = "select count(distinct manager_id) from payment where resDate like ? ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,year+"%");
				rs = ptmt.executeQuery();
				
				rs.next();
				
				return rs.getInt(1);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return 0;
		}
		
		public HashMap<String, Integer> managerTotal(String year, int start, int limit){
			HashMap<String, Integer> map = new HashMap<>();
			sql = "SELECT DISTINCT manager_id, SUM(amount) sum FROM payment WHERE resDate like ? and refund_reg = 0 GROUP BY manager_id limit ?, ? ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,year+"%");
				ptmt.setInt(2,start);
				ptmt.setInt(3,limit);
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					map.put(rs.getString("manager_id"),rs.getInt("sum"));
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return map;
		}
		
		public HashMap<String, Integer> refundMoney(String year){
			HashMap<String, Integer> map = new HashMap<>();
			sql = "SELECT DISTINCT manager_id, SUM(amount) sum FROM payment WHERE refund_reg = 1 and resDate like ? GROUP BY manager_id ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,year+"%");
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					map.put(rs.getString("manager_id"),rs.getInt("sum"));
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return map;
		}
		
		public ArrayList<String> managerList(){
			ArrayList<String> list = new ArrayList<>();
			sql = "SELECT DISTINCT manager_id FROM payment";
			
			try {
				ptmt = con.prepareStatement(sql);
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					list.add(rs.getString("manager_id"));
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		public PaymentDTO detail(String imp_uid){
			PaymentDTO dto = null;
			sql = "select * from payment where imp_uid = ? ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,imp_uid);
				rs = ptmt.executeQuery();
				
				if(rs.next()) {
					// 필요한것만 보이기
					dto = new PaymentDTO();
					dto.setImp_uid(rs.getString("imp_uid"));
					dto.setBuyer_name(rs.getString("buyer_name"));
					dto.setMerchant_uid(rs.getString("merchant_uid"));
					dto.setId(rs.getString("id"));
					dto.setSname(rs.getString("sname"));
					dto.setResDate(rs.getString("resdate"));
					dto.setResTime(rs.getString("restime"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setManager_id(rs.getString("manager_id"));
					dto.setAmount(rs.getInt("amount"));
					dto.setIntRefund_reg(rs.getInt("refund_reg"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return dto;
		}
		
		public PaymentDTO mydetail(String imp_uid){
			PaymentDTO dto = null;
			sql = "select * from payment where imp_uid = ? ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,imp_uid);
				rs = ptmt.executeQuery();
				
				if(rs.next()) {
					// 필요한것만 보이기
					dto = new PaymentDTO();
					dto.setImp_uid(rs.getString("imp_uid"));
					dto.setBuyer_name(rs.getString("buyer_name"));
					dto.setMerchant_uid(rs.getString("merchant_uid"));
					dto.setId(rs.getString("id"));
					dto.setSname(rs.getString("sname"));
					dto.setResDate(rs.getString("resdate"));
					dto.setResTime(rs.getString("restime"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setManager_id(rs.getString("manager_id"));
					dto.setAmount(rs.getInt("amount"));
					dto.setIntRefund_reg(rs.getInt("refund_reg"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return dto;
		}
		
		public ArrayList<PaymentDTO> list(String year){
			ArrayList<PaymentDTO> res = new ArrayList<>();
			
			sql = "select * from payment where resdate like ? ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,year+"%");
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					PaymentDTO dto = new PaymentDTO();
					// 필요한것만 보이기
					dto.setImp_uid(rs.getString("imp_uid"));
					dto.setBuyer_name(rs.getString("buyer_name"));
					dto.setMerchant_uid(rs.getString("merchant_uid"));
					dto.setId(rs.getString("id"));
					dto.setSname(rs.getString("sname"));
					dto.setResDate(rs.getString("resdate"));
					dto.setResTime(rs.getString("restime"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setManager_id(rs.getString("manager_id"));
					dto.setAmount(rs.getInt("amount"));
					dto.setIntRefund_reg(rs.getInt("refund_reg"));
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
		
		
		public ArrayList<PaymentDTO> searchDateList(String searchDate){
			ArrayList<PaymentDTO> res = new ArrayList<>();
			
			sql = "select * from payment where resdate like ? ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,searchDate+"%");
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					PaymentDTO dto = new PaymentDTO();
					// 필요한것만 보이기
					dto.setImp_uid(rs.getString("imp_uid"));
					dto.setBuyer_name(rs.getString("buyer_name"));
					dto.setMerchant_uid(rs.getString("merchant_uid"));
					dto.setId(rs.getString("id"));
					dto.setSname(rs.getString("sname"));
					dto.setResDate(rs.getString("resdate"));
					dto.setResTime(rs.getString("restime"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setManager_id(rs.getString("manager_id"));
					dto.setAmount(rs.getInt("amount"));
					dto.setIntRefund_reg(rs.getInt("refund_reg"));
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
		
		public ArrayList<PaymentDTO> adjustmentList(String searchDate, String manager){
			ArrayList<PaymentDTO> res = new ArrayList<>();
			
			sql = "select * from payment where manager_id = ? and resdate like ? ";
			
			try {
				ptmt = con.prepareStatement(sql);
				
				ptmt.setString(1,manager);
				ptmt.setString(2,searchDate+"%");
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					PaymentDTO dto = new PaymentDTO();
					// 필요한것만 보이기
					dto.setImp_uid(rs.getString("imp_uid"));
					dto.setBuyer_name(rs.getString("buyer_name"));
					dto.setMerchant_uid(rs.getString("merchant_uid"));
					dto.setId(rs.getString("id"));
					dto.setSname(rs.getString("sname"));
					dto.setResDate(rs.getString("resdate"));
					dto.setResTime(rs.getString("restime"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setManager_id(rs.getString("manager_id"));
					dto.setAmount(rs.getInt("amount"));
					dto.setIntRefund_reg(rs.getInt("refund_reg"));
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
		
		public ArrayList<PaymentDTO> dateList(String resdate){
			ArrayList<PaymentDTO> res = new ArrayList<>();
			
			sql = "select * from payment where resdate = ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, resdate);
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					PaymentDTO dto = new PaymentDTO();
					// 필요한것만 보이기
					dto.setImp_uid(rs.getString("imp_uid"));
					dto.setBuyer_name(rs.getString("buyer_name"));
					dto.setMerchant_uid(rs.getString("merchant_uid"));
					dto.setId(rs.getString("id"));
					dto.setSname(rs.getString("sname"));
					dto.setResDate(rs.getString("resdate"));
					dto.setResTime(rs.getString("restime"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setAmount(rs.getInt("amount"));
					dto.setIntRefund_reg(rs.getInt("refunt_reg"));
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
		
		public ArrayList<PaymentDTO> myList(String boardId, String resdate){
			ArrayList<PaymentDTO> res = new ArrayList<>();
			
			sql = "select * from payment where id= ? and resdate = ? and refund_reg = 0 ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,boardId);
				ptmt.setString(2, resdate);
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					PaymentDTO dto = new PaymentDTO();
					// 필요한것만 보이기
					dto.setImp_uid(rs.getString("imp_uid"));
					dto.setBuyer_name(rs.getString("buyer_name"));
					dto.setMerchant_uid(rs.getString("merchant_uid"));
					dto.setId(rs.getString("id"));
					dto.setSname(rs.getString("sname"));
					dto.setResDate(rs.getString("resdate"));
					dto.setResTime(rs.getString("restime"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setAmount(rs.getInt("amount"));
					dto.setIntRefund_reg(rs.getInt("refund_reg"));
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
		
		public ArrayList<PaymentDTO> userList(String user_id, int start, int limit){
			ArrayList<PaymentDTO> res = new ArrayList<>();
			
			sql = "select * from payment where user_id = ? order by no desc limit ?, ? ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,user_id);
				ptmt.setInt(2,start);
				ptmt.setInt(3,limit);
				
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					PaymentDTO dto = new PaymentDTO();
					// 필요한것만 보이기
					dto.setImp_uid(rs.getString("imp_uid"));
					dto.setBuyer_name(rs.getString("buyer_name"));
					dto.setMerchant_uid(rs.getString("merchant_uid"));
					dto.setId(rs.getString("id"));
					dto.setSname(rs.getString("sname"));
					dto.setResDate(rs.getString("resdate"));
					dto.setResTime(rs.getString("restime"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setManager_id(rs.getString("manager_id"));
					dto.setAmount(rs.getInt("amount"));
					dto.setIntRefund_reg(rs.getInt("refund_reg"));
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
		
		public ArrayList<PaymentDTO> corpList(String manager_id, int start, int limit){
			ArrayList<PaymentDTO> res = new ArrayList<>();
			
			sql = "select * from payment where manager_id = ? order by no desc limit ?, ? ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,manager_id);
				ptmt.setInt(2,start);
				ptmt.setInt(3,limit);
				
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					PaymentDTO dto = new PaymentDTO();
					// 필요한것만 보이기
					dto.setImp_uid(rs.getString("imp_uid"));
					dto.setBuyer_name(rs.getString("buyer_name"));
					dto.setMerchant_uid(rs.getString("merchant_uid"));
					dto.setId(rs.getString("id"));
					dto.setSname(rs.getString("sname"));
					dto.setResDate(rs.getString("resdate"));
					dto.setResTime(rs.getString("restime"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setManager_id(rs.getString("manager_id"));
					dto.setAmount(rs.getInt("amount"));
					dto.setIntRefund_reg(rs.getInt("refund_reg"));
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
		
		
		public ArrayList<String> paymentList(ArrayList<BasketballDTO> bas, String date){
			ArrayList<String> res = new ArrayList<>();
			
			String check = null;
			boolean end = false;
			
			for(int i =0; i<bas.size(); i++) {
				if(i == bas.size()-1) {
					end =true;
				}
				
				check = resString(bas.get(i).getId(), date, end);
				
				res.add(check);
			}
			
			
			return res;
		}
		
		public ArrayList<String> paymentSoccerList(ArrayList<SoccerDTO> soc, String date){
			ArrayList<String> res = new ArrayList<>();
			
			String check = null;
			boolean end = false;
			
			for(int i =0; i<soc.size(); i++) {
				if(i == soc.size()-1) {
					end =true;
				}
				
				check = resString(soc.get(i).getId(), date, end);
				
				res.add(check);
			}
			
			
			return res;
		}
		
		public String resString(String bas, String date, boolean end){
			
			
			String unUsedTime = "";
			sql = "select restime from payment where id = ? and resdate = ? and refund_reg = 0 ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,bas);
				ptmt.setString(2,date);
				
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					unUsedTime+= rs.getString("restime")+',';
				}
				
				if(!unUsedTime.equals("")) {
					if(unUsedTime.lastIndexOf(',') != -1 && (unUsedTime.lastIndexOf(',')==(unUsedTime.length()-1))) {
						unUsedTime = unUsedTime.substring(0, unUsedTime.lastIndexOf(','));
					}
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(end) {
					close();
				}
			}
			
			return unUsedTime;
		}
		
		public ArrayList<Integer> basResList(ArrayList<LessonDTO> bas){
			ArrayList<Integer> res = new ArrayList<>();
			
			int check = 0;
			boolean end = false;
			
			for(int i =0; i<bas.size(); i++) {
				if(i == bas.size()-1) {
					end =true;
				}
				
				check = resInteger(bas.get(i).getPost_id(), end);
				
				res.add(check);
			}
			
			
			return res;
		}
		
			public int resInteger(String id, boolean end){
			
			sql = "select count(*) from payment where id = ? and refund_reg = 0 ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,id);
				
				rs = ptmt.executeQuery();
				
				rs.next();
				
				return rs.getInt(1);
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(end) {
					close();
				}
			}
			
			return 0;
		}
		
		
		public ArrayList<PaymentDTO> adminList(int start, int limit){
			ArrayList<PaymentDTO> res = new ArrayList<>();
			
			sql = "select * from payment order by no desc limit ?, ? ";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1,start);
				ptmt.setInt(2,limit);
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					PaymentDTO dto = new PaymentDTO();
					// 필요한것만 보이기
					dto.setImp_uid(rs.getString("imp_uid"));
					dto.setBuyer_name(rs.getString("buyer_name"));
					dto.setMerchant_uid(rs.getString("merchant_uid"));
					dto.setId(rs.getString("id"));
					dto.setSname(rs.getString("sname"));
					dto.setResDate(rs.getString("resdate"));
					dto.setResTime(rs.getString("restime"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setManager_id(rs.getString("manager_id"));
					dto.setAmount(rs.getInt("amount"));
					dto.setIntRefund_reg(rs.getInt("refund_reg"));
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
//		
//		public PaymentDTO detail(String notice_id){
//			PaymentDTO dto = null;
//			
//			sql = "select * from payment where id = ?";
//			
//			try {
//				ptmt = con.prepareStatement(sql);
//				ptmt.setString(1, notice_id);
//				rs = ptmt.executeQuery();
//				
//				if(rs.next()) {
//					dto = new PaymentDTO();
//					// 필요한것만 보이기
//					dto.setId(rs.getString("id"));
//					dto.setTitle(rs.getString("title"));
//					dto.setContent(rs.getString("content"));
//					dto.setFilter(rs.getString("filter"));
//					dto.setReg_date(rs.getTimestamp("reg_date"));
//				}
//			}catch(Exception e) {
//				e.printStackTrace();
//			}finally {
//				close();
//			}
//			
//			return dto;
//		}
		
		public void insert(PaymentDTO dto){
			
			sql = "insert into payment(imp_uid, amount, buyer_name, merchant_uid, id, sname, resdate, restime, user_id, manager_id, refund_reg, reg_date ) "
					+ "values (? , ? , ? , ?, ?, ?, ?, ?, ?, ?, ?, sysdate())";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, dto.getImp_uid());
				ptmt.setInt(2, dto.getAmount());
				ptmt.setString(3, dto.getBuyer_name());
				ptmt.setString(4, dto.getMerchant_uid());
				ptmt.setString(5, dto.getId());
				ptmt.setString(6, dto.getSname());
				ptmt.setString(7, dto.getResDate());
				ptmt.setString(8, dto.getResTime());
				ptmt.setString(9, dto.getUser_id());
				ptmt.setString(10, dto.getManager_id());
				ptmt.setInt(11, dto.getIntRefund_reg());
				ptmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
		}
		
		
	public int modify(PaymentDTO dto){
			int res = 0;
			
			sql = "update payment set refund_reg = ? "
					+ "where imp_uid = ? ";
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1, dto.getIntRefund_reg());
				ptmt.setString(2, dto.getImp_uid());
				res = ptmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return res;
		}

		public int delete(PaymentDTO dto){
		int res = 0;
		
		sql = "delete from payment where id = ?";
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
