package payment.model;

import java.util.Date;

public class PaymentDTO {
	String imp_uid, buyer_name, merchant_uid, id, sname, resDate, resTime, user_id, manager_id;
	int amount;
	boolean refund_reg;
	Date reg_date;
	
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	
	public String getBuyer_name() {
		return buyer_name;
	}
	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	public String getResTime() {
		return resTime;
	}
	public void setResTime(String resTime) {
		this.resTime = resTime;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public int getAmount() {
		return amount;
	}
	
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public void setAmount(String amount) {
		if(amount != null) {
			this.amount = Integer.parseInt(amount);
		}
	}
	
	public boolean isRefund_reg() {
		return refund_reg;
	}
	
	public int getIntRefund_reg() {
		return (refund_reg)?1:0;
	}
	
	public void setRefund_reg(boolean refund_reg) {
		this.refund_reg = refund_reg;
	}
	
	public void setIntRefund_reg(int refund_reg) {
		this.refund_reg = refund_reg==1;
	}
	
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "PaymentDTO [imp_uid=" + imp_uid + ", buyer_name=" + buyer_name + ", merchant_uid=" + merchant_uid
				+ ", id=" + id + ", sname=" + sname + ", resDate=" + resDate + ", resTime=" + resTime + ", user_id="
				+ user_id + ", manager_id=" + manager_id + ", amount=" + amount + ", refund_reg=" + refund_reg
				+ ", reg_date=" + reg_date + "]";
	}
	
//	@Override
//	public String toString() {
//		return "{imp_uid:'" + imp_uid + "', buyer_name:'" + buyer_name + "', merchant_uid:'" + merchant_uid
//				+ "', id:'" + id + "', manager_id:'" + manager_id+"', sname:'" + sname + "', resDate:'" + resDate + "', resTime:'" + resTime + "', user_id:'"
//				+ user_id + "', amount:'" + amount + "', refund_reg:'" + refund_reg + "', reg_date:'" + reg_date + "'}";
//	}
	
	
	

}
