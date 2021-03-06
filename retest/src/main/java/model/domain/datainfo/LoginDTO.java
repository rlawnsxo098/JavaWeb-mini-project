package model.domain.datainfo;

public class LoginDTO {
	private String id;
	private String pw;
	private String email;
	private String root;
	private String aggre;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public LoginDTO(String id, String pw, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
	}

	public LoginDTO() {
		super();
	}
}
