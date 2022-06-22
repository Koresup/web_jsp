package market.model;

import java.util.Date;

public class MarketDTO {
	private String user_num, post_id, user_id, user_email, title, check_quality, l_category, s_category, delivery, content, img, firstImg;
	private int price, cnt;
	private Date reg_date;
	
	
	
	public String getFirstImg() {
		return firstImg;
	}
	public void setFirstImg(String firstImg) {
		this.firstImg = firstImg;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCheck_quality() {
		return check_quality;
	}
	public void setCheck_quality(String check_quality) {
		this.check_quality = check_quality;
	}
	public String getL_category() {
		return l_category;
	}
	public void setL_category(String l_category) {
		this.l_category = l_category;
	}
	public String getS_category() {
		return s_category;
	}
	public void setS_category(String s_category) {
		this.s_category = s_category;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUser_num() {
		return user_num;
	}
	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "MarketDTO [user_num=" + user_num + ", post_id=" + post_id + ", user_id=" + user_id + ", user_email="
				+ user_email + ", title=" + title + ", check_quality=" + check_quality + ", l_category=" + l_category
				+ ", s_category=" + s_category + ", delivery=" + delivery + ", content=" + content + ", img=" + img
				+ ", firstImg=" + firstImg + ", price=" + price + ", cnt=" + cnt + ", reg_date=" + reg_date + "]";
	}

}
