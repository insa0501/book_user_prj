package kr.co.sist.user.order.domain;

/**
 * 주문자 배송정보
 * @author sist32
 *
 */
public class OrderUserInfoDomain {
	
  private String user_name, user_zipcode, user_addr1, user_addr2, user_phone;

	public String getUser_name() {
		return user_name;
	}
	
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public String getUser_zipcode() {
		return user_zipcode;
	}
	
	public void setUser_zipcode(String user_zipcode) {
		this.user_zipcode = user_zipcode;
	}
	
	public String getUser_addr1() {
		return user_addr1;
	}
	
	public void setUser_addr1(String user_addr1) {
		this.user_addr1 = user_addr1;
	}
	
	public String getUser_addr2() {
		return user_addr2;
	}
	
	public void setUser_addr2(String user_addr2) {
		this.user_addr2 = user_addr2;
	}
	
	public String getUser_phone() {
		return user_phone;
	}
	
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	 
  
	   
	}
