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
	
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String hnd_no;
	private String post_code;
	private String add1;
	private String add2;
	private String agree1;
	private String agree2;
	private String agree3;
	private String car_model;
	
	public UserInfoVo() {
		super();
	}
	@Override
	public String toString() {
		return "UserInfoVo [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", hnd_no=" + hnd_no
				 + ", post_code=" + post_code+ ", add1=" + add1 + ", add2=" + add2 + ", agree1=" + agree1 + ", agree2=" + agree2 + ", agree3=" + agree3 + ", car_model=" + car_model + "]";
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
	public String getHnd_no() {
		return hnd_no;
	}
	public void setHnd_no(String hnd_no) {
		this.hnd_no = hnd_no;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
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
	public String getAgree1() {
		return agree1;
	}
	public void setAgree1(String agree1) {
		this.agree1 = agree1;
	}
	public String getAgree2() {
		return agree2;
	}
	public void setAgree2(String agree2) {
		this.agree2 = agree2;
	}
	public String getAgree3() {
		return agree3;
	}
	public void setAgree3(String agree3) {
		this.agree3 = agree3;
	}
	public String getCar_model() {
		return car_model;
	}
	public void setCar_model(String car_model) {
		this.car_model = car_model;
	}
}
