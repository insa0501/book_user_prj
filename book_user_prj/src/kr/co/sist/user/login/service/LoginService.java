package kr.co.sist.user.login.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import kr.co.sist.user.login.dao.UserLoginDAO;
import kr.co.sist.user.login.domain.UserLoginDomain;
import kr.co.sist.user.login.vo.SelectUserIdVO;
import kr.co.sist.user.login.vo.SelectUserPassVO;
import kr.co.sist.user.login.vo.UpdateUserPassVO;
import kr.co.sist.user.login.vo.UserLoginVO;
import kr.co.sist.util.cipher.DataEncrypt;

public class LoginService {
	
	/**
	 * �α���
	 * @param ulVO
	 * @return UserLoginDomain
	 */
	public UserLoginDomain login(UserLoginVO ulVO) throws SQLException {
		UserLoginDomain uld = null;
		
		UserLoginDAO ulDAO = UserLoginDAO.getInstance();
		
		try {
			DataEncrypt de = new DataEncrypt("0123456789abcdef");
			ulVO.setUser_pass(de.encryption(ulVO.getUser_pass()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		}//end catch
		
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
		
		try {
			DataEncrypt de = new DataEncrypt("0123456789abcdef");
			uupVO.setUser_pass(de.encryption(uupVO.getUser_pass()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		}//end catch
		
		updateFlag = ulDAO.updateUserPass(uupVO)==1;
		
		return updateFlag;
	} // changeUserPass()
} // class