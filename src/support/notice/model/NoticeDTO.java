package support.notice.model;

import java.util.Date;

public class NoticeDTO {
	String id, title, content, filter;
	Date reg_date;
	
	public NoticeDTO() {
	}
	
	
	public NoticeDTO(String title, String filter, String content) {
		this.id = "notice"+ System.currentTimeMillis();
		this.title = title;
		this.filter = filter;
		this.content = content;
	}

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
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


	public String getFilter() {
		return filter;
	}


	public void setFilter(String filter) {
		this.filter = filter;
	}


	public Date getReg_date() {
		return reg_date;
	}


	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}


	@Override
	public String toString() {
		return "NoticeDTO [id=" + id + ", title=" + title + ", content=" + content + ", filter=" + filter
				+ ", reg_date=" + reg_date + "]";
	}
	
	
	
	
	
	
}
