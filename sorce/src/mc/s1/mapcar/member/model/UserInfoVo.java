package mc.s1.mapcar.member.model;

public class UserInfoVo {
//	USER_NO	NUMBER
//	ID	VARCHAR2(20 BYTE)
//	PWD	VARCHAR2(20 BYTE)
//	NAME	VARCHAR2(10 BYTE)
//	EMAIL	VARCHAR2(20 BYTE)
//	ADD1	VARCHAR2(30 BYTE)
//	ADD2	VARCHAR2(100 BYTE)
//	CAR_MODEL	VARCHAR2(100 BYTE)
	
	private int user_no;
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String add1;
	private String add2;
	private String car_model;
	
	public UserInfoVo() {
		super();
	}
	@Override
	public String toString() {
		return "UserInfoVo [user_no=" + user_no + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email
				+ ", add1=" + add1 + ", add2=" + add2 + ", car_model=" + car_model + "]";
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAdd1() {
		return add1;
	}
	public void setAdd1(String add1) {
		this.add1 = add1;
	}
	public String getAdd2() {
		return add2;
	}
	public void setAdd2(String add2) {
		this.add2 = add2;
	}
	public String getCar_model() {
		return car_model;
	}
	public void setCar_model(String car_model) {
		this.car_model = car_model;
	}
}
