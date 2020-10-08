package kr.co.sist.user.login.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import kr.co.sist.user.GetMyBatisHandler;
import kr.co.sist.user.login.domain.UserLoginDomain;
import kr.co.sist.user.login.vo.SelectUserIdVO;
import kr.co.sist.user.login.vo.SelectUserPassVO;
import kr.co.sist.user.login.vo.UpdateUserPassVO;
import kr.co.sist.user.login.vo.UserLoginVO;

public class UserLoginDAO {
	private static UserLoginDAO u_loginDAO;
	
	private UserLoginDAO() {
	}
	
	public static UserLoginDAO getInstance() {
		if (u_loginDAO == null) {
			u_loginDAO = new UserLoginDAO();
		} // end if
		return u_loginDAO;
	} // getInstance()
	
	/**
	 * 로그인
	 * @param ulVO
	 * @return UserLoginDomain
	 * @throws SQLException
	 */
	public UserLoginDomain selectLoginId(UserLoginVO ulVO) throws SQLException {
		UserLoginDomain uld = null;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		uld = ss.selectOne("kr.co.sist.user.login.login", ulVO);
		ss.close();
		
		return uld;
	} // selectLoginId()
	
	/**
	 * 아이디찾기
	 * @param suiVO
	 * @return user_id
	 * @throws SQLException
	 */
	public String selectUserId(SelectUserIdVO suiVO) throws SQLException {
		String user_id = null;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		user_id = ss.selectOne("selectUserId", suiVO);
		ss.close();
		
		return user_id;
	} // selectUserId()
	
	/**
	 * 비밀번호 찾기
	 * - 비밀번호가 맞는지 확인하여 비밀번호를 변경할 아이디를 반환
	 * @param supVO
	 * @return user_id
	 * @throws SQLException
	 */
	public String selectUserPass(SelectUserPassVO supVO) throws SQLException {
		String user_id = null;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		user_id = ss.selectOne("selectUserPass", supVO);
		ss.close();
		
		return user_id;
	} // selectUserPass()
	
	/**
	 * 비밀번호 변경
	 * @param uupVO
	 * @return
	 * @throws SQLException
	 */
	public int updateUserPass(UpdateUserPassVO uupVO) throws SQLException {
		int cnt = 0;
		
		SqlSession ss = GetMyBatisHandler.getInstance().getSqlSession();
		cnt = ss.update("updateUserPass", uupVO);
		ss.commit();
		ss.close();
		
		return cnt;
	} // updateUserPass()
	
} // class