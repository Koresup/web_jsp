package member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	PreparedStatement pstmt;
	Connection con;
	ResultSet rs;
	String sql;
	
	public MemberDAO() {
		try {
			Context context = new InitialContext(); 
			DataSource ds = (DataSource) context.lookup("java:comp/env/projectDB");
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int editInfo(MemberDTO dto) {
		int res = 0;
		sql = "update memlist set nick_name = ?, pname = ?, gender = ?, phonenum = ?, email = ?, address = ?, detailAddress = ? where pid = ? ";
		
		 try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getNick_name());
			pstmt.setString(2, dto.getpName());
			pstmt.setString(3, dto.getGender());
			pstmt.setString(4, dto.getPhoneNum());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getAddress());
			pstmt.setString(7, dto.getDetailAddress());
			pstmt.setString(8, dto.getPid());
			
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
	}
	
	public int pwChange(MemberDTO dto){
		int res = 0;
		sql = "update memlist set pw = ? where email = ?";
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,dto.getPw());
			pstmt.setString(2,dto.getEmail());
			
			res = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return res;
	}
	
	public MemberDTO findId(String email) {
		MemberDTO res = null;
		sql = "select * from memlist where email=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = new MemberDTO();
				res.setPid(rs.getString("pid"));
				res.setPw(rs.getString("pw"));
				res.setNick_name(rs.getString("nick_name"));
				res.setpName(rs.getString("pname"));
				res.setGender(rs.getString("gender"));
				res.setTelecom(rs.getString("telecom"));
				res.setPhoneNum(rs.getString("phonenum"));
				res.setEmail(rs.getString("email"));
				res.setAddress(rs.getString("address"));
				res.setDetailAddress(rs.getString("detailAddress"));
				res.setGrade(rs.getInt("grade"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return res;
	}
	
	public String idCheck(String inputId) {
		String res = "unuseable";
		sql = "select * from memlist where pid=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inputId);
			rs = pstmt.executeQuery();
			
			if (!rs.next()) {
				res = "useable";
				System.out.println("this id possible to use.");
			} else {
				res = "unuseable";
				System.out.println("this id is already in use.");
			}
		} catch (SQLException e) {
			System.out.println("id duplecation check fail");
			e.printStackTrace();
		} finally {
			close();
		}
		return res;
	}
	
	public String emailCheck(String inputMail) {
		String res = "unuseable";
		sql = "select * from memlist where email=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inputMail);
			rs = pstmt.executeQuery();
			
			if (!rs.next()) {
				res = "useable";
				System.out.println("this email possible to use.");
			} else {
				res = "unuseable";
				System.out.println("this email is already in use.");
			}
		} catch (SQLException e) {
			System.out.println("email duplecation check fail");
			e.printStackTrace();
		}
		return res;
		
	}
	
	
	public MemberDTO findUser(String id) {
		MemberDTO res = null;
		sql = "select * from memlist where pid=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = new MemberDTO();
				res.setPid(rs.getString("pid"));
				res.setPw(rs.getString("pw"));
				res.setNick_name(rs.getString("nick_name"));
				res.setpName(rs.getString("pname"));
				res.setGender(rs.getString("gender"));
				res.setTelecom(rs.getString("telecom"));
				res.setPhoneNum(rs.getString("phonenum"));
				res.setEmail(rs.getString("email"));
				res.setAddress(rs.getString("address"));
				res.setDetailAddress(rs.getString("detailAddress"));
				res.setGrade(rs.getInt("grade"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return res;
	}
	
	public ArrayList<MemberDTO> list(){
		sql = "select * from memlist";
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setPid(rs.getString("pid"));
				dto.setNick_name(rs.getString("nick_name"));
				dto.setpName(rs.getString("pname"));
				dto.setGender(rs.getString("gender"));
				dto.setTelecom(rs.getString("telecom"));
				dto.setPhoneNum(rs.getString("phonenum"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setAddress(rs.getString("detailAddress"));
				
				list.add(dto);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public void insert(MemberDTO dto) {
		sql = "insert into memlist (pid, pw, nick_name, pname, gender, telecom, phonenum, email, address, detailAddress, grade) values"
				+"(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		System.out.println(dto);
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getPid());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getNick_name());
			pstmt.setString(4, dto.getpName());
			pstmt.setString(5, dto.getGender());
			pstmt.setString(6, dto.getTelecom());
			pstmt.setString(7, dto.getPhoneNum());
			pstmt.setString(8, dto.getEmail());
			pstmt.setString(9, dto.getAddress());
			pstmt.setString(10, dto.getDetailAddress());
			pstmt.setInt(11, dto.getGrade());
			
			pstmt.executeUpdate();
			
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void close() {
		if (rs!=null) {try { rs.close(); } catch (SQLException e) {e.printStackTrace();}}
		if (pstmt!=null) { try { pstmt.close(); } catch (SQLException e) {e.printStackTrace();}}
		if (con!=null) { try { con.close(); } catch (SQLException e) {e.printStackTrace();}}
	}
	
}
