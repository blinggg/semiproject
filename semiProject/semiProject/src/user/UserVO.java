package user;

public class UserVO {
	private String cvs_id;
	private String company_id;
	private String pass;
	private String name;
	private String email;
	private String tel;
	
	public String getCvs_id() {
		return cvs_id;
	}
	public void setCvs_id(String cvs_id) {
		this.cvs_id = cvs_id;
	}
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "UserVO [cvs_id=" + cvs_id + ", company_id=" + company_id + ", pass=" + pass + ", name=" + name
				+ ", email=" + email + ", tel=" + tel + "]";
	}

	
	
}
