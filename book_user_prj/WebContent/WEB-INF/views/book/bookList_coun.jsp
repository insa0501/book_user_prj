<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="main_content">
	<!-- 상단의 배너사진 -->
<!-- 	<div class="main_content_img">
		<img
			src="">
	</div> -->
	<!-- 책 wrapper -->
	<div class="content_wrap_books">
		<c:if test="${ empty book_list }">
			<c:import url="empty_list.jsp"/>
		</c:if>
		<c:forEach var="bl" items="${book_list}">
			<div class="content_book">
				<!-- <img class="book_img"
					src="https://www.mmcashop.co.kr/data/goods/20/06/25/1000000366/1000000366_add3_044.png"> -->
				<img class="book_img" src="<c:out value="${bl.book_img}"/>">
				<span class="book_title"><a href="book_detail.do?book_isbn=${bl.book_isbn}">${bl.book_name}</a></span>
				<span class="book_price">${ bl.book_price }원</span>
			</div>
		</c:forEach>
	</div>
	
	<div id="pagination" class="section_pagination">
	   <nav aria-label="Page navigation example">
	     <ul class="pagination justify-content-center">
	       <li class="page-item ${paging.pre_page <= 0 ? 'disabled':'active'}">
	          <a class="page-link"<c:if test="${ paging.pre_page >= 1}"> href="booklist.do?book=${param.book}&type=${param.type}&current_page=${ paging.pre_page }"</c:if> aria-label="Previous">
	              <span aria-hidden="true">&laquo;</span>
	            </a>
	       </li>
	       <c:forEach begin="${paging.start_page}" end="${paging.end_page}" step="1" var="cur_page" >
	          <li class="page-item">
	             <a class="page-link"<c:if test="${paging.current_page ne cur_page}"> href="booklist.do?book=${param.book}&type=${param.type}&current_page=${ cur_page }"</c:if>>
	                <c:out value="${cur_page}" />
	             </a>
	          </li>
	       </c:forEach>
	       <li class="page-item ${paging.next_page > paging.total_page ? 'disabled':'active'}">
	         <a class="page-link"<c:if test="${paging.next_page <= paging.total_page}"> href="booklist.do?book=${param.book}&type=${param.type}&current_page=${ paging.next_page }"</c:if> aria-label="Next">
	           <span aria-hidden="true">&raquo;</span>
	         </a>
	       </li>
	     </ul>
	   </nav>
	</div>
</div>

