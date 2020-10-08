package kr.co.sist.user.login.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.sist.user.login.domain.UserLoginDomain;
import kr.co.sist.user.login.vo.SelectUserIdVO;
import kr.co.sist.user.login.vo.SelectUserPassVO;
import kr.co.sist.user.login.vo.UpdateUserPassVO;
import kr.co.sist.user.login.vo.UserLoginVO;

public class UserLoginDAO {
	private static UserLoginDAO u_loginDAO;
	private static SqlSessionFactory ssf;
	
	private UserLoginDAO() {
	}
	
	public static UserLoginDAO getInstance() {
		if (u_loginDAO == null) {
			u_loginDAO = new UserLoginDAO();
		} // end if
		return u_loginDAO;
	} // getInstance()
	
	private SqlSessionFactory getSqlSessionFactory() throws IOException{
		
		if (ssf == null) {
			// xml�� ����
			String xmlConfig="kr/co/sist/user/mybatis_config.xml";
			Reader reader = Resources.getResourceAsReader(xmlConfig);
			
			// Mybatis Framework ����
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
	 * �α���
	 * @param ulVO
	 * @return UserLoginDomain
	 * @throws SQLException
	 */
	public UserLoginDomain selectLoginId(UserLoginVO ulVO) throws SQLException {
		UserLoginDomain uld = null;
		
		SqlSession ss = getSqlSession();
		uld = ss.selectOne("kr.co.sist.user.login.login", ulVO);
		ss.close();
		
		return uld;
	} // selectLoginId()
	
	
//	public static void main(String[] args) {
//		UserLoginVO ulVO = new UserLoginVO();
//		ulVO.setUser_id("test1");
//		ulVO.setUser_pass("1234");
//		try {
//			System.out.println(UserLoginDAO.getInstance().selectLoginId(ulVO));
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
	
	
	/**
	 * ���̵�ã��
	 * @param suiVO
	 * @return user_id
	 * @throws SQLException
	 */
	public String selectUserId(SelectUserIdVO suiVO) throws SQLException {
		String user_id = null;
		
		return user_id;
	} // selectUserId()
	
	/**
	 * ��й�ȣ ã��
	 * - ��й�ȣ�� �´��� Ȯ���Ͽ� ��й�ȣ�� ������ ���̵� ��ȯ
	 * @param supVO
	 * @return user_id
	 * @throws SQLException
	 */
	public String selectUserPass(SelectUserPassVO supVO) throws SQLException {
		String user_id = null;
		
		return user_id;
	} // selectUserPass()
	
	/**
	 * ��й�ȣ ����
	 * @param uupVO
	 * @return
	 * @throws SQLException
	 */
	public int updateUserPass(UpdateUserPassVO uupVO) throws SQLException {
		int cnt = 0;
		
		return cnt;
	} // updateUserPass()
	
	
	
	
	
} // class