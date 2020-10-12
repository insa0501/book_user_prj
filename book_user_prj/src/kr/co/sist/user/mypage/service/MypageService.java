package kr.co.sist.user.mypage.service;

import java.util.ArrayList;
import java.util.List;

import kr.co.sist.user.mypage.dao.MypageDAO;
import kr.co.sist.user.mypage.domain.OrderBookListDomain;
import kr.co.sist.user.mypage.domain.OrderDetailDomain;
import kr.co.sist.user.mypage.domain.OrderListBookDomain;
import kr.co.sist.user.mypage.domain.OrderListDomain;
import kr.co.sist.user.mypage.domain.UserInfoDomain;
import kr.co.sist.user.mypage.vo.OrderListVO;
import kr.co.sist.user.mypage.vo.PageNationVO;
import kr.co.sist.user.mypage.vo.SelectOrderListVO;
import kr.co.sist.user.mypage.vo.UserCheckVO;
import kr.co.sist.user.mypage.vo.UserInfoVO;
import kr.co.sist.user.mypage.vo.UserResignDataVO;
import kr.co.sist.user.mypage.vo.UserResignVO;

public class MypageService {
	
	/** �ֹ� ����Ʈ ��ȸ
	 * @param olVO
	 * @return List<OrderListDomain>
	 */
	public List<OrderListDomain> searchOrderList(SelectOrderListVO solVO) {
		List<OrderListDomain> list = null;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		list = mDAO.selectOrderList(solVO);
		List<OrderListBookDomain> bookList = mDAO.selectOrderListBook(solVO);
		
		List<OrderListBookDomain> tempList = null;
		
		for(OrderListDomain l : list) {
			tempList = new ArrayList<OrderListBookDomain>();
			for(OrderListBookDomain l2 : bookList) {
				if(l.getOrder_no() == l2.getOrder_no()) {
					tempList.add(l2);
				}//end if
			}//end for
			l.setList(tempList);
		}//end for
		
		return list;
	} // searchOrderList
	
	/**
	 * �ֹ� �� ���� ��ȸ
	 * @param order_no
	 * @return
	 */
	public OrderDetailDomain searchOrderDeatil(int order_no) {
		OrderDetailDomain odd = null;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		odd = mDAO.selectOrderDetail(order_no);
		List<OrderBookListDomain> bookList = mDAO.selectOrderDetailBook(order_no);
		
		odd.setOrderBookList(bookList);
		
		return odd;
	} // searchOrderList
	
	/**
	 * �ֹ����
	 * @param order_no
	 * @return
	 */
	public boolean removeOrder(int order_no) {
		boolean remove_flag = false;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		remove_flag = mDAO.deleteOrder(order_no)==1;
		
		return remove_flag;
	} // removeOrder
	
	/**
	 * ��й�ȣ ��Ȯ��
	 * @param user_pass
	 * @return
	 */
	// id�� �޾ƾ����� �ʳ� ������. => VO
	public UserInfoDomain checkUserPass(UserCheckVO ucVO) {
		UserInfoDomain uid = null;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		uid = mDAO.selectUserPass(ucVO);
		
		return uid;
	} // checkUserPass
	
	/**
	 * ������������
	 * @param uiVO
	 * @return
	 */
	public boolean changeUserInfo(UserInfoVO uiVO) {
		boolean update_flag = false;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		update_flag = mDAO.updateUserInfo(uiVO) > 0;
		
		return update_flag;
	} // changeUserInfo
	
	/**
	 * ȸ��Ż�� ó��
	 * @param urVO
	 * @return
	 */
	public boolean userResign(UserResignVO urVO) {
		boolean flag = false;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		
		String chk_id = mDAO.selectResignId(urVO);
		
		if(!"".equals(chk_id) && chk_id != null) {
			flag = mDAO.updateUserResign(urVO) != 0;
		}//end if
		
		if(flag) {
			UserResignDataVO urdVO = null;
			for(String resdata : urVO.getUser_resdata()) {
				urdVO = new UserResignDataVO();
				urdVO.setUser_id(urVO.getUser_id());
				urdVO.setUser_resdata(resdata);
				mDAO.insertResdata(urdVO);
			}//end for
		}//end if
		
		return flag;
	} // userResign
	
	/**
	 * ��ü ������ �� : DB���
	 * @return
	 */
	public int totalCount(SelectOrderListVO solVO) {
		int totalCnt=0; 
		
		MypageDAO mDAO = MypageDAO.getInstance();
		totalCnt = mDAO.selectOrderCount(solVO);
		
		return totalCnt;
	}//totalCount
	
	/**
	 * �� ȭ�鿡 ������ �Խù��� ��. 10��
	 * @return
	 */
	public int pageScale() {
		int pageScale=10;
		
		return pageScale;
	}//pageScale
	
	/**
	 * �� ��������
	 * @param totalCount
	 * @param pageScale
	 * @return
	 */
	public int totalPage(int totalCount, int pageScale) {
		int totalPage=(int)Math.ceil((double)totalCount/pageScale);
		
		return totalPage;
	}//totalPage
	
	/**
	 * ���۹�ȣ.
	 * @return
	 */
	public int startNum(int currentPage, int pageScale) {
		int startNum= currentPage*pageScale-pageScale+1;
		
		return startNum;
	}//startNum
	
	/**
	 * ����ȣ.
	 * @return
	 */
	public int endNum(int startNum, int pageScale) {
		int endNum = startNum+pageScale-1;
		
		return endNum;
	}//totalCount
	
	/**
	 * ���� ������ ���� �� �̵��ϱ� ���� �ε�������Ʈ.
	 * @param pnVO
	 * @return
	 */
	public String pageNation(PageNationVO pnVO) {
		String indexList=""; //������ �̵��� ���� ���� ���¸� ������ ���� ex. [<<]...[1][2]...[>]�� ���� ���� ����
		
		String term = pnVO.getTerm();
		int pageNumber=0; //������ �̵��� ���� ���� �ѹ��� ǥ�õ� ��ȣ�� ����
		int startPage=0; //������ �̵��� ���� ���� ǥ�õ� ���� ��ȣ
		int endPage=0; //������ �̵��� ���� ���� ǥ�õ� ������ ��ȣ 
		int curPage=0; //������ ���� ��ũ�� ������ ���� �̵��� ���� ǥ�õ� ��������ȣ�� ������ ����

		pageNumber = 10; //������ �̵��� ���� ���� �ѹ��� 10���� ��ȣ�� ǥ��.

		startPage = ((pnVO.getCurrentPage() - 1) / pageNumber) * pageNumber + 1;
		endPage = (((startPage - 1) + pageNumber) / pageNumber) * pageNumber;

		if (pnVO.getTotalPage() <= endPage){	//���������� ������ �̵��� ���� ���� ǥ�õ� ������ ��ȣ���� �۴ٸ�
			endPage = pnVO.getTotalPage();	//������ ��ȣ�� �������� ��ȣ�� ����
		}//end if

		if ( pnVO.getCurrentPage() > pageNumber) {	//������������ ���� ǥ�õ� ��ȣ���� ũ�ٸ�
			curPage = startPage - 1; 		//[<<]������ �� �̵��� ������ ��ȣ�� ������ ���
			indexList = indexList + "<a href='"+pnVO.getUrl()+"?term="+term+"&currentPage="+curPage+"'>[<<]</a>";		//[<<]�� a�±׿� ��Ƽ� �������̵� ���� ǥ���� ������ ����
		}else{	//������������ ���� ǥ�õ� ��ȣ���� ũ�� �ʴٸ�
			indexList = indexList + "[<<]";		//[<<]�� ��Ƽ� �������̵� ���� ǥ���� ������ ����
		}//end else 
		indexList = indexList + " ... ";	//�� ���¸� ���� ������ ' ... '�� �߰�

		curPage = startPage;	//���� ���۹�ȣ�� ������ �̵��� �ӽ� ������ ����
		while (curPage <= endPage){		//������ �̵��� �ӽ� ������ ���� ������ ��ȣ���� �۰ų� ���ٸ�
			if (curPage == pnVO.getCurrentPage()) {	//������ �̵��� �ӽ� ������ ���� �������� ���� ���
				indexList = indexList + "["+pnVO.getCurrentPage()+"]";	//�� ���¸� ���� ������ [�����ȣ]�� �߰�
			} else {	//������ �̵��� �ӽ� ������ ���� �������� �ٸ� ���
				indexList = indexList +"<a href='"+pnVO.getUrl()+"?term="+term+"&currentPage="+curPage+"'>["+curPage+"]</a>";		//[��ȣ]�� a�±׿� ��Ƽ� �� ���¸� ���� ������ �߰�
			}//end else 
				
			curPage++;	//������ �̵��� �ӽ� ������ �������Ѽ� �������̵� ���� ��ȣ�� for��ó�� ��������� �Ѵ�.
		}//end while
			
		indexList = indexList + " ... ";	//'[<<]...[��ȣ][][][]'�� ����� ������ ' ... '�� �߰�

		if ( pnVO.getTotalPage() > endPage) {	//���� ������ ��ȣ�� ������������  �۴ٸ�
			curPage = endPage + 1;		//[>>]������ �� �̵��� ������ ��ȣ�� ������ ���
			indexList = indexList + "<a href='"+pnVO.getUrl()+"?term="+term+"&currentPage="+curPage+"'>[>>]</a>";		//[>>]�� a�±׿� ��Ƽ� �� ���¸� ���� ������ �߰�
		}else{	//���� ������ ��ȣ�� ������������  ���� �ʴٸ�
			indexList = indexList + "[>>]";		//[>>]�� ��Ƽ� �������̵� ���� ǥ���� ������ ����
		}//end else 
			
		return indexList;	//������ �̵����� ���� ������ ��ȯ
	}//pageNation
} // class