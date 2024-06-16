package kr.ac.kopo.vo;

public class UserVO {

	private String id;
	private String name;
	private String pwd;
	private String phone;
	
	
	public UserVO() {
		super();
	}
	
	public UserVO(String id, String name, String pwd, String phone) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.phone = phone;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "EmailVo [id=" + id + ", name=" + name + ", pwd=" + pwd + ", phone=" + phone + "]";
	}
	
	

}


