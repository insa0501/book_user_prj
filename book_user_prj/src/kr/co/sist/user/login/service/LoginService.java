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
	 * �α���
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
	 * ���̵� ã��
	 * @param suiVO
	 * @return user_id
	 * @throws SQLException 
	 */
	public String searchUserId(SelectUserIdVO suiVO) throws SQLException {
		String user_id = "";
		
		UserLoginDAO ulDAO = UserLoginDAO.getInstance();
		user_id = ulDAO.selectUserId(suiVO);
		
		return user_id;
	} // searchUserId()
	
	/**
	 * ��й�ȣ ã��
	 * @param supVO
	 * @return
	 * @throws SQLException 
	 */
	public String searchUserPass(SelectUserPassVO supVO) throws SQLException {
		String user_id = "";
		
		UserLoginDAO ulDAO = UserLoginDAO.getInstance();
		user_id = ulDAO.selectUserPass(supVO);
		
		return user_id;
	} // searchUserId()
	
	/**
	 * ��й�ȣ ����
	 * @param uupVO
	 * @return user_id
	 * @throws SQLException 
	 */
	public boolean changeUserPass(UpdateUserPassVO uupVO) throws SQLException {
		boolean updateFlag = false;
		
		UserLoginDAO ulDAO = UserLoginDAO.getInstance();
		updateFlag = ulDAO.updateUserPass(uupVO)==1;
		
		return updateFlag;
	} // changeUserPass()
} // class