package gym.soccer.model;

import java.util.Date;

public class SoccerDTO {
	String id, sname, contents_info, contents_detail, contents_rule, contents_refund,
		postcode, address, address_detail, img, manager_id, unused_time;

	int price_weekday_weekly, price_weekday_nighttime, price_weekend_weekly, price_weekend_nighttime;
	
	boolean option1, option2, option3, option4, option5;
	
	Date reg_date;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getContents_info() {
		return contents_info;
	}

	public void setContents_info(String contents_info) {
		this.contents_info = contents_info;
	}

	public String getContents_detail() {
		return contents_detail;
	}

	public void setContents_detail(String contents_detail) {
		this.contents_detail = contents_detail;
	}

	public String getContents_rule() {
		return contents_rule;
	}

	public void setContents_rule(String contents_rule) {
		this.contents_rule = contents_rule;
	}

	public String getContents_refund() {
		return contents_refund;
	}

	public void setContents_refund(String contents_refund) {
		this.contents_refund = contents_refund;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getManager_id() {
		return manager_id;
	}

	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}

	public int getPrice_weekday_weekly() {
		return price_weekday_weekly;
	}

	public void setPrice_weekday_weekly(int price_weekday_weekly) {
		this.price_weekday_weekly = price_weekday_weekly;
	}

	public int getPrice_weekday_nighttime() {
		return price_weekday_nighttime;
	}

	public void setPrice_weekday_nighttime(int price_weekday_nighttime) {
		this.price_weekday_nighttime = price_weekday_nighttime;
	}

	public int getPrice_weekend_weekly() {
		return price_weekend_weekly;
	}

	public void setPrice_weekend_weekly(int price_weekend_weekly) {
		this.price_weekend_weekly = price_weekend_weekly;
	}

	public int getPrice_weekend_nighttime() {
		return price_weekend_nighttime;
	}

	public void setPrice_weekend_nighttime(int price_weekend_nighttime) {
		this.price_weekend_nighttime = price_weekend_nighttime;
	}

	public String getUnused_time() {
		return unused_time;
	}

	public void setUnused_time(String unused_time) {
		this.unused_time = unused_time;
	}
	
	public boolean isOption1() {
		return option1;
	}
	
	public int getIntOption1() {
		int res = 0;
		if(option1) {
			res = 1;
		}
		return res;
	}
	
	public void setOption1(boolean option1) {
		this.option1 = option1;
	}
	
	public void setOption1(int option1) {
		this.option1 = (option1==1);
	}

	public boolean isOption2() {
		return option2;
	}
	
	public int getIntOption2() {
		int res = 0;
		if(option2) {
			res = 1;
		}
		return res;
	}
	
	public void setOption2(boolean option2) {
		this.option2 = option2;
	}
	
	public void setOption2(int option2) {
		this.option2 = (option2==1);
	}
	
	public boolean isOption3() {
		return option3;
	}
	
	public int getIntOption3() {
		int res = 0;
		if(option3) {
			res = 1;
		}
		return res;
	}
	
	public void setOption3(boolean option3) {
		this.option3 = option3;
	}
	
	public void setOption3(int option3) {
		this.option3 = (option3==1);
	}
	
	public boolean isOption4() {
		return option4;
	}
	
	public int getIntOption4() {
		int res = 0;
		if(option4) {
			res = 1;
		}
		return res;
	}
	
	public void setOption4(boolean option4) {
		this.option4 = option4;
	}
	
	public void setOption4(int option4) {
		this.option4 = (option4==1);
	}
	
	public boolean isOption5() {
		return option5;
	}
	
	public int getIntOption5() {
		int res = 0;
		if(option5) {
			res = 1;
		}
		return res;
	}
	
	public void setOption5(boolean option5) {
		this.option5 = option5;
	}
	
	public void setOption5(int option5) {
		this.option5 = (option5==1);
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "BasketballDTO [id=" + id + ", sname=" + sname + ", contents_info=" + contents_info
				+ ", contents_detail=" + contents_detail + ", contents_rule=" + contents_rule + ", contents_refund="
				+ contents_refund + ", postcode=" + postcode + ", address=" + address + ", address_detail="
				+ address_detail + ", img=" + img + ", manager_id=" + manager_id + ", unused_time=" + unused_time
				+ ", price_weekday_weekly=" + price_weekday_weekly + ", price_weekday_nighttime="
				+ price_weekday_nighttime + ", price_weekend_weekly=" + price_weekend_weekly
				+ ", price_weekend_nighttime=" + price_weekend_nighttime + ", option1=" + option1 + ", option2="
				+ option2 + ", option3=" + option3 + ", option4=" + option4 + ", option5=" + option5 + ", reg_date="
				+ reg_date + "]";
	}



	
	
}
