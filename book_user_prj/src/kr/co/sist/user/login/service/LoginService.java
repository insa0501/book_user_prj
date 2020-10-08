package kr.co.sist.user.login.service;

import java.sql.SQLException;

import kr.co.sist.user.login.dao.UserLoginDAO;
import kr.co.sist.user.login.domain.UserLoginDomain;
import kr.co.sist.user.login.vo.SelectUserIdVO;
import kr.co.sist.user.login.vo.SelectUserPassVO;
import kr.co.sist.user.login.vo.UpdateUserPassVO;
import kr.co.sist.user.login.vo.UserLoginVO;

public class LoginService {
	
	/**
	 * 로그인
	 * @param ulVO
	 * @return UserLoginDomain
	 */
	public UserLoginDomain login(UserLoginVO ulVO) throws SQLException {
		UserLoginDomain uld = null;
		
		UserLoginDAO ulDAO = UserLoginDAO.getInstance();
		uld = ulDAO.selectLoginId(ulVO);
		
		return uld;
	} // login
	
	/**
	 * 아이디 찾기
	 * @param suiVO
	 * @return user_id
	 */
	public String searchUserId(SelectUserIdVO suiVO) {
		String user_id = "";
		
		return user_id;
	} // searchUserId()
	
	/**
	 * 비밀번호 찾기
	 * @param supVO
	 * @return
	 */
	public String searchUserPass(SelectUserPassVO supVO) {
		String user_id = "";
		
		return user_id;
	} // searchUserId()
	
	/**
	 * 비밀번호 변경
	 * @param uupVO
	 * @return user_id
	 */
	public int changeUserPass(UpdateUserPassVO uupVO) {
		int cnt = 0;
		
		return cnt;
	} // changeUserPass()
} // class