package commu_soc.guest.model;

import java.util.Date;
import java.util.regex.Pattern;

public class GuestDTO {

	int cnt;
	String post_id;
	String head, title, content, upfile, img, user_id, allfile;
	Date reg_date;

	public GuestDTO() {
	}

	public GuestDTO(String head, String title, String user_id, String post_id, String content, String allfile) {
		this.head = head;
		this.title = title;
		this.user_id = user_id;
		this.post_id = "commu_soc_guest" + System.currentTimeMillis();
		this.content = content;
		this.allfile = allfile;
	}

	
	public String getAllfile() {
		return allfile;
	}

	public void setAllfile(String allfile) {
		this.allfile = allfile;
	}

	public String getPost_id() {
		return post_id;
	}

	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public String getContentBr() {
		return content.replaceAll("\n", "<br>");
	}

	public void setContent(String content) {
		this.content = content;
	}

	//  파일 || 조건 3가지 달아주기
	public String getUpfile() {
		if (upfile == null || upfile.trim().equals("") || upfile.trim().equals("null")) {
			return null;
		}
		return upfile;
	}

	public void setUpfile(String upfile) {
		this.upfile = upfile;
	}

	public boolean isUpfile(String[] file, int cnt) {
		if (file == null) {
			return false;
		}
		return Pattern.matches(".*[.](docx|xlsx|hwp|txt)", file[cnt].toLowerCase());
	}
	
	// 이미지 || 조건 3가지 달아주기
	public String getImg() {
		if (img == null || img.trim().equals("") || img.trim().equals("null")) {
			return null;
		}
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public boolean isImg(String[] file, int cnt) {
		if (file == null) {
			return false;
		}
		return Pattern.matches(".*[.](jpg|jpeg|png|bmp|gif)", file[cnt].toLowerCase());
	}
	

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	
	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "GuestDTO [cnt=" + cnt + ", post_id=" + post_id + ", head=" + head + ", title=" + title + ", content="
				+ content + ", upfile=" + upfile + ", img=" + img + ", user_id=" + user_id + ", allfile="
				+ allfile + ", reg_date=" + reg_date + "]";
	}

	
}
