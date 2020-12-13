package newr.customer;
import java.sql.Timestamp;

public class CustomerMessageDataBean {
	private int num; 
    private String msg_num;
    private String sender;
    private String msg_receiver;
    private String msg_title;
    private String msg_content;
    private Timestamp msg_time;
    
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMsg_num() {
		return msg_num;
	}
	public void setMsg_num(String msg_num) {
		this.msg_num = msg_num;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMsg_receiver() {
		return msg_receiver;
	}
	public void setMsg_receiver(String msg_receiver) {
		this.msg_receiver = msg_receiver;
	}
	public String getMsg_title() {
		return msg_title;
	}
	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public Timestamp getMsg_time() {
		return msg_time;
	}
	public void setMsg_time(Timestamp msg_time) {
		this.msg_time = msg_time;
	}
    

    
}