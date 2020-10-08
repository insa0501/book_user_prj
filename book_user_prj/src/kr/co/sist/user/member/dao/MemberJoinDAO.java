package kr.co.sist.user.member.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.sist.user.member.vo.MemberJoinVO;

public class MemberJoinDAO {
	private static MemberJoinDAO m_joinDAO;
	private SqlSessionFactory ssf;
	
	private MemberJoinDAO() {
	}
	
	public static MemberJoinDAO getInstance() {
		if (m_joinDAO == null) {
			m_joinDAO = new MemberJoinDAO();
		} // end if
		return m_joinDAO;
	} // getInstance()
	
	private SqlSessionFactory getSqlSessionFactory() throws IOException{
		
		if (ssf == null) {
			// xml과 연결
			String xmlConfig="kr/co/sist/user/mybatis_config.xml";
			Reader reader = Resources.getResourceAsReader(xmlConfig);
			
			// Mybatis Framework 생성
			ssf = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} // end if
		return ssf;
	} // getSqlSessionFactory()
	
	public SqlSession getSqlSession() {
		SqlSession ss = null;
		
		try {
			ss = getSqlSessionFactory().openSession();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch
		
		return ss;
	} // getSqlSession()
	
	/**
	 * 아이디 중복확인
	 * @return
	 */
	public String selectDupId(String check_id) {
		String msg = "";
		
		return msg;
	} // selectDupId
	
	/**
	 *  회원가입 처리
	 * @param mjVO
	 */
	public void insertMember(MemberJoinVO mjVO) {
		
	} // insertMember
	
} // class