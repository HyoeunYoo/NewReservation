package newr.admin;

import java.sql.Timestamp;

public class QuestionDataBean {
	private int q_num; 
    private String answer;
    private String q_title;
    private String question_passwd;
    private Timestamp question_date;
    private String question_writer;
    private String question_content;
    

	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getQuestion_passwd() {
		return question_passwd;
	}
	public void setQuestion_passwd(String question_passwd) {
		this.question_passwd = question_passwd;
	}
	public Timestamp getQuestion_date() {
		return question_date;
	}
	public void setQuestion_date(Timestamp question_date) {
		this.question_date = question_date;
	}
	public String getQuestion_writer() {
		return question_writer;
	}
	public void setQuestion_writer(String question_writer) {
		this.question_writer = question_writer;
	}
	
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
    
}