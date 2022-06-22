package support.feedback.model;

import java.util.Date;

public class FeedbackDTO {
	String id, title, question, answer, filter, user_id;
	Date reg_date, reg_date_answer;
	
	public FeedbackDTO() {
	}
	
	
	public FeedbackDTO(String title, String question, String filter, String user_id) {
		this.id = "Question"+ System.currentTimeMillis();
		this.title = title;
		this.question = question;
		this.filter = filter;
		this.user_id = user_id;
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


	public String getQuestion() {
		return question;
	}


	public void setQuestion(String question) {
		this.question = question;
	}
	
	public String getQuestionBr() {
		return question.replaceAll("\n", "<br>");
	}
	
	public String getAnswerBr() {
		return answer.replaceAll("\n", "<br>");
	}

	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}


	public String getFilter() {
		return filter;
	}
	
	
	public void setFilter(String filter) {
		this.filter = filter;
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
	
	public Date getReg_date_answer() {
		return reg_date_answer;
	}
	
	
	public void setReg_date_answer(Date reg_date_answer) {
		this.reg_date_answer = reg_date_answer;
	}


	@Override
	public String toString() {
		return "FeedbackQuestionDTO [id=" + id + ", title=" + title + ", question=" + question + ", filter=" + filter
				+ ", user_id=" + user_id + "]";
	}





	
	
	
	
	
	
}
