package kr.co.sist.user;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class GetMyBatisHandler {

	private static GetMyBatisHandler gmbh;
	private static SqlSessionFactory ssf;
	
	
	private GetMyBatisHandler() {
		
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
		
	}//ExamMyBatisDAO
	
	public static GetMyBatisHandler getInstance() {
		if(gmbh == null) {
			gmbh = new GetMyBatisHandler();
		}//end if
		
		return gmbh;
	}//getInstance
	
	public SqlSession getSqlSession() {
		SqlSession ss = null;
		
	      if(ssf == null) {
	    	  
		       try {
		    	   //1.Stream을 사용해 xml과 연결 ->DB관련 업무 실행하는데 
		    	   String xmlConfig="kr/co/sist/user/mybatis_config.xml";
		    	   Reader reader = Resources.getResourceAsReader(xmlConfig);
		         
		    	   //2.MyBatis Framework 생성
		    	   ssf = new SqlSessionFactoryBuilder().build(reader);   
		    	   reader.close();
		    	   
		       }catch (IOException ie) {
	               ie.printStackTrace();
		       }//end catch
		       
	      }//end if
	      
	      ss= ssf.openSession();
	      return ss;
	   }//getSqlSession
	

}//class











