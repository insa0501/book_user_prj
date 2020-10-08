package kr.co.sist.user.mypage.vo;

import java.util.List;

public class UserResignVO {

	private String user_id, user_pass;
	private List<String> user_resdata;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public List<String> getUser_resdata() {
		return user_resdata;
	}
	public void setUser_resdata(List<String> user_resdata) {
		this.user_resdata = user_resdata;
	}
	
	 
	
}
