package comment.model;

import java.util.Date;

public class CommentDTO {
	String post_id, comment_id, comment_writer, content;
	Date reg_date;
	
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment_writer() {
		return comment_writer;
	}
	public void setComment_writer(String comment_writer) {
		this.comment_writer = comment_writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "CommentDTO [post_id=" + post_id + ", comment_id=" + comment_id + ", writer=" + comment_writer + ", content="
				+ content + ", reg_date=" + reg_date + "]";
	}
	
	
	
}
