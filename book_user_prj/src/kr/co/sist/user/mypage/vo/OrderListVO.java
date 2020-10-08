package kr.co.sist.user.mypage.vo;

/**
 * 주문내역 VO
 * @author sist32
 *
 */
public class OrderListVO {

    private String user_id, startDay, endDay;
   
	public String getUser_id() {
		return user_id;
	}
	
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getStartDay() {
		return startDay;
	}

	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	public String getEndDay() {
		return endDay;
	}

	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	
}
