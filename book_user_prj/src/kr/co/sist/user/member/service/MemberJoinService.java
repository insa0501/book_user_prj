package kr.co.sist.user.member.service;

import kr.co.sist.user.member.dao.MemberJoinDAO;
import kr.co.sist.user.member.vo.MemberJoinVO;

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
		mjDAO.insertMember(mjVO);
		
	} // memberJoin
} // class