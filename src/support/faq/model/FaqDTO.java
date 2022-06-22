package support.faq.model;

public class FaqDTO {
	String id, question, answer;
	
	public FaqDTO() {
	}
	
	
	public FaqDTO(String question, String answer) {
		this.id = "faq"+ System.currentTimeMillis();
		this.question = question;
		this.answer = answer;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
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


	@Override
	public String toString() {
		return "FaqDTO [id=" + id + ", question=" + question + ", answer=" + answer + "]";
	}
	
	
	
	
	
	
}
