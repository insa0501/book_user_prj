package kr.co.sist.user.member.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import kr.co.sist.user.member.dao.MemberJoinDAO;
import kr.co.sist.user.member.vo.MemberJoinVO;
import kr.co.sist.util.cipher.DataEncrypt;

public class MemberJoinService {
	
	/**
	 * 아이디 중복확인
	 * @param check_id
	 * @return
	 */
	public String searchDupId(String check_id) {
		String user_id = "";
		
		MemberJoinDAO mjDAO = MemberJoinDAO.getInstance();
		user_id = mjDAO.selectDupId(check_id);
		
		return user_id;
	} //searchDupId
	
	/**
	 * 회원가입 처리
	 * @param mjVO
	 * @return
	 */
	public void memberJoin(MemberJoinVO mjVO) {
		
		MemberJoinDAO mjDAO = MemberJoinDAO.getInstance();
		
			try {
				DataEncrypt de = new DataEncrypt("0123456789abcdef");
				mjVO.setUser_pass(de.encryption(mjVO.getUser_pass()));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (GeneralSecurityException e) {
				e.printStackTrace();
			}//end catch
		
		mjDAO.insertMember(mjVO);
		
	} // memberJoin
} // class