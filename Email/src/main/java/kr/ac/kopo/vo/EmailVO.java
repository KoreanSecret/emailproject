package kr.ac.kopo.vo;

public class EmailVO {
	private int no;
	private String sender;
	private String receiver;
	private String title;
	private String content;
	private String regdate;
	
	public EmailVO() {
		super();
	}
	public EmailVO(int no, String title, String sender, String regDate) {
        this.no = no;
        this.title = title;
        this.sender = sender;
        this.regdate = regDate;
    }
	
	public EmailVO(int no, String sender, String receiver, String title, String content, String regdate) {
		super();
		this.no = no;
		this.sender = sender;
		this.receiver = receiver;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
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

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "EmailVO [no=" + no + ", sender=" + sender + ", receiver=" + receiver + ", title=" + title
				+ ", content=" + content + ", regdate=" + regdate + "]";
	}
	
	
}
