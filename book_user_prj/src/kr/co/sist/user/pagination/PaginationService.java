package kr.co.sist.user.pagination;

public class PaginationService {
	
	/**
	 * 테이블명, 컬럼명, 컬럼값을 저장하는 TotalCntVO를 매개변수로 받아 조건에 맞는 행의 수를 구하는 method
	 * tcVO 중 테이블명은 반드시 값을 가지고 있어야하고, 컬럼명과 컬럼값은 null이어도 된다.
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
	}//getTotalCnt
	
	
	

	/**
	 * 한 페이지에서 보여줄 게시글의 수 (지금 9개)
	 * 
	 * @return
	 */
	public int pageScale() {
		int page_scale = 9;

		return page_scale;
	}// pageScale

	/**
	 * 현재 페이지를 받아 게시글의 시작번호를 구하는 method
	 * @param currentPage
	 * @return
	 */
	public int startNum(int current_page) {
		int page_scale = pageScale();
		int start_num = (current_page - 1) * page_scale + 1;
		return start_num;
	}// startNum

	
	
	/**
	 * 현재 페이지를 받아 게시글의 끝번호를 구하는 method
	 * @param currentPage
	 * @return
	 */
	public int endNum(int current_page) {
		int page_scale = pageScale();
		int end_num = ((current_page - 1) * page_scale + 1) + page_scale - 1;
		return end_num;
	}// endNum
	
	
	/**
	 * 현재 페이지와 테이블명, 컬럼명, 컬럼값을 저장하는 TotalCntVO를 매개변수로 받아 
	 * 이전페이지, 다음페이지, 시작페이지, 끝페이지를 구하는 method
	 * @param currentPage
	 * @param totalCnt
	 * @return
	 */
	public PageVO calcPaging(int current_page, TotalCntVO tcVO) {
		PageVO pVO=null;
		int total_cnt=getTotalCnt(tcVO); //totalCnt를 가져옴
		
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
		
		if( pre_page < 1 ) { //"이전" 버튼을 비활성화하는 조건
			pre_page=current_page;
		}//end if
		
		if( total_page<next_page ){ //"다음" 버튼을 비활성화하는 조건
			next_page=current_page;
		}//end if
		
		pVO=new PageVO(current_page, pre_page, next_page, start_page, end_page, total_page);
		
		return pVO;
	}//calcPage
	
	
	public PageVO calcPagingQna(int current_page, TotalCntVO tcVO) {
		PageVO pVO=null;
		int total_cnt=getTotalCntQna(tcVO); //totalCnt를 가져옴
		
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
		
		if( pre_page < 1 ) { //"이전" 버튼을 비활성화하는 조건
			pre_page=current_page;
		}//end if
		
		if( total_page<next_page ){ //"다음" 버튼을 비활성화하는 조건
			next_page=current_page;
		}//end if
		
		pVO=new PageVO(current_page, pre_page, next_page, start_page, end_page, total_page);
		
		return pVO;
	}//calcPage
	
	
	
	
	

}
