package kr.co.sist.user.pagination;

public class PaginationService {
	
	/**
	 * ���̺��, �÷���, �÷����� �����ϴ� TotalCntVO�� �Ű������� �޾� ���ǿ� �´� ���� ���� ���ϴ� method
	 * tcVO �� ���̺���� �ݵ�� ���� ������ �־���ϰ�, �÷���� �÷����� null�̾ �ȴ�.
	 * @param tcVO
	 * @return
	 */
	public int getTotalCnt(TotalCntVO tcVO) {
		int cnt=0;
		
		cnt=PaginationDAO.getInstance().selectTotalCnt(tcVO);
		
		return cnt;
	}//getTotalCnt
	
	
	public int getTotalCntQna(TotalCntVO tcVO) {
		int cnt=0;
		
		cnt=PaginationDAO.getInstance().selectTotalCntQna(tcVO);
		
		return cnt;
	}//getTotalCntQna
	
	public int getTotalCntSearch(TotalCntVO tcVO) {
		int cnt=0;
		
		cnt=PaginationDAO.getInstance().selectTotalCntSearch(tcVO);
		
		return cnt;
	}//getTotalCnt
	
	public int getTotalCntOrder(TotalCntVO tcVO) {
		int cnt=0;
		
		cnt=PaginationDAO.getInstance().selectTotalCntOrder(tcVO);
		
		return cnt;
	}//getTotalCnt
	

	/**
	 * �� ���������� ������ �Խñ��� �� (���� 9��)
	 * 
	 * @return
	 */
	public int pageScale() {
		int page_scale = 9;

		return page_scale;
	}// pageScale

	/**
	 * ���� �������� �޾� �Խñ��� ���۹�ȣ�� ���ϴ� method
	 * @param currentPage
	 * @return
	 */
	public int startNum(int current_page) {
		int page_scale = pageScale();
		int start_num = (current_page - 1) * page_scale + 1;
		return start_num;
	}// startNum

	
	
	/**
	 * ���� �������� �޾� �Խñ��� ����ȣ�� ���ϴ� method
	 * @param currentPage
	 * @return
	 */
	public int endNum(int current_page) {
		int page_scale = pageScale();
		int end_num = ((current_page - 1) * page_scale + 1) + page_scale - 1;
		return end_num;
	}// endNum
	
	
	/**
	 * ���� �������� ���̺��, �÷���, �÷����� �����ϴ� TotalCntVO�� �Ű������� �޾� 
	 * ����������, ����������, ����������, ���������� ���ϴ� method
	 * @param currentPage
	 * @param totalCnt
	 * @return
	 */
	public PageVO calcPaging(int current_page, TotalCntVO tcVO) {
		PageVO pVO=null;
		int total_cnt=getTotalCnt(tcVO); //totalCnt�� ������
		
		int page_scale=pageScale();
		int total_page=(int)Math.ceil((double)total_cnt/page_scale);
		
		int page_range=5; //1~5 / 6~10
		int start_page=((current_page-1)/page_range)*page_range+1;
		int end_page=start_page+page_range-1;
		if(total_page < end_page) {
			end_page = total_page;
		}//end if
		
		int pre_page=current_page - 1;
		int next_page=current_page + 1;
		
		if( pre_page < 1 ) { //"����" ��ư�� ��Ȱ��ȭ�ϴ� ����
			pre_page=current_page;
		}//end if
		
		if( total_page<next_page ){ //"����" ��ư�� ��Ȱ��ȭ�ϴ� ����
			next_page=current_page;
		}//end if
		
		pVO=new PageVO(current_page, pre_page, next_page, start_page, end_page, total_page);
		
		return pVO;
	}//calcPage
	
	
	public PageVO calcPagingQna(int current_page, TotalCntVO tcVO) {
		PageVO pVO=null;
		int total_cnt=getTotalCntQna(tcVO); //totalCnt�� ������
		
		int page_scale=pageScale();
		int total_page=(int)Math.ceil((double)total_cnt/page_scale);
		
		int page_range=5; //1~5 / 6~10
		int start_page=((current_page-1)/page_range)*page_range+1;
		int end_page=start_page+page_range-1;
		if(total_page < end_page) {
			end_page = total_page;
		}//end if
		
		int pre_page=current_page - 1;
		int next_page=current_page + 1;
		
		if( pre_page < 1 ) { //"����" ��ư�� ��Ȱ��ȭ�ϴ� ����
			pre_page=current_page;
		}//end if
		
		if( total_page<next_page ){ //"����" ��ư�� ��Ȱ��ȭ�ϴ� ����
			next_page=current_page;
		}//end if
		
		pVO=new PageVO(current_page, pre_page, next_page, start_page, end_page, total_page);
		
		return pVO;
	}//calcPage
	
	
	public PageVO calcPagingSearch(int current_page, TotalCntVO tcVO) {
		PageVO pVO=null;
		int total_cnt=getTotalCntSearch(tcVO); //totalCnt�� ������
		
		int page_scale=pageScale();
		int total_page=(int)Math.ceil((double)total_cnt/page_scale);
		
		int page_range=5; //1~5 / 6~10
		int start_page=((current_page-1)/page_range)*page_range+1;
		int end_page=start_page+page_range-1;
		if(total_page < end_page) {
			end_page = total_page;
		}//end if
		
		int pre_page=current_page - 1;
		int next_page=current_page + 1;
		
		if( pre_page < 1 ) { //"����" ��ư�� ��Ȱ��ȭ�ϴ� ����
			pre_page=current_page;
		}//end if
		
		if( total_page<next_page ){ //"����" ��ư�� ��Ȱ��ȭ�ϴ� ����
			next_page=current_page;
		}//end if
		
		pVO=new PageVO(current_page, pre_page, next_page, start_page, end_page, total_page);
		
		return pVO;
	}//calcPage
	
	public PageVO calcPagingOrder(int current_page, TotalCntVO tcVO) {
		PageVO pVO=null;
		int total_cnt=getTotalCntOrder(tcVO); //totalCnt�� ������
		
		int page_scale=pageScale();
		int total_page=(int)Math.ceil((double)total_cnt/page_scale);
		
		int page_range=5; //1~5 / 6~10
		int start_page=((current_page-1)/page_range)*page_range+1;
		int end_page=start_page+page_range-1;
		if(total_page < end_page) {
			end_page = total_page;
		}//end if
		
		int pre_page=current_page - 1;
		int next_page=current_page + 1;
		
		if( pre_page < 1 ) { //"����" ��ư�� ��Ȱ��ȭ�ϴ� ����
			pre_page=current_page;
		}//end if
		
		if( total_page<next_page ){ //"����" ��ư�� ��Ȱ��ȭ�ϴ� ����
			next_page=current_page;
		}//end if
		
		pVO=new PageVO(current_page, pre_page, next_page, start_page, end_page, total_page);
		
		return pVO;
	}//calcPage
	
	

}
