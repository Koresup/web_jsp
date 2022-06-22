package member.model;

public class CorpMemberDTO {
	
	private String pid, pw, nick_name, corp_regnum, corp_name, email, address, detailAddress, manager_name, telecom, manager_num;
	private int grade;
	
	
	
	public String getTelecom() {
		return telecom;
	}
	public void setTelecom(String telecom) {
		this.telecom = telecom;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	public String getCorp_name() {
		return corp_name;
	}
	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public String getManager_num() {
		return manager_num;
	}
	public void setManager_num(String manager_num) {
		this.manager_num = manager_num;
	}
	public String getCorp_regnum() {
		return corp_regnum;
	}
	public void setCorp_regnum(String corp_regnum) {
		this.corp_regnum = corp_regnum;
	}
	@Override
	public String toString() {
		return "CorpMemberDTO [pid=" + pid + ", pw=" + pw + ", nick_name=" + nick_name + ", corp_name=" + corp_name
				+ ", email=" + email + ", address=" + address + ", detailAddress=" + detailAddress + ", manager_name="
				+ manager_name + ", telecom=" + telecom + ", manager_num=" + manager_num + ", grade=" + grade
				+ ", corp_regnum=" + corp_regnum + "]";
	}
	
}
