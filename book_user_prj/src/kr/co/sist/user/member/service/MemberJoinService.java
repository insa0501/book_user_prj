package kr.co.sist.user.member.service;

import kr.co.sist.user.member.dao.MemberJoinDAO;
import kr.co.sist.user.member.vo.MemberJoinVO;

public class MemberJoinService {
	
	/**
	 * ���̵� �ߺ�Ȯ��
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
	 * ȸ������ ó��
	 * @param mjVO
	 * @return
	 */
	public void memberJoin(MemberJoinVO mjVO) {
		
		MemberJoinDAO mjDAO = MemberJoinDAO.getInstance();
		mjDAO.insertMember(mjVO);
		
	} // memberJoin
} // class