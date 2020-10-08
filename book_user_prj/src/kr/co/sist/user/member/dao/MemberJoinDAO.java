package kr.co.sist.user.member.dao;

import org.apache.ibatis.session.SqlSession;

import kr.co.sist.user.GetMyBatisHandler;
import kr.co.sist.user.member.vo.MemberJoinVO;

public class MemberJoinDAO {
	private static MemberJoinDAO m_joinDAO;
	
	private MemberJoinDAO() {
	}
	
	public static MemberJoinDAO getInstance() {
		if (m_joinDAO == null) {
			m_joinDAO = new MemberJoinDAO();
		} // end if
		return m_joinDAO;
	} // getInstance()
	
	/**
	 * 아이디 중복확인
	 * @return
	 */
	public String selectDupId(String check_id) {
		String msg = "";
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		msg = ss.selectOne("idDup", check_id);
		ss.close();
		
		return msg;
	} // selectDupId
	
	/**
	 *  회원가입 처리
	 * @param mjVO
	 */
	public void insertMember(MemberJoinVO mjVO) {
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		ss.insert("memberJoin", mjVO);
		ss.commit();
		ss.close();
		
	} // insertMember
	
} // class