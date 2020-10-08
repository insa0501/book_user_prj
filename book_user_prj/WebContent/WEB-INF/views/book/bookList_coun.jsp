<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="main_content">
	<!-- 상단의 배너사진 -->
	<div class="main_content_img">
		<img
			src="https://mmcashop.co.kr/data/editor/goods/200626/book_161016.jpg">
	</div>
	<!-- 책 wrapper -->
	<div class="content_wrap_books">
		<c:if test="${ empty book_list }">
			<c:import url="empty_list.jsp"/>
		</c:if>
		<c:forEach var="bl" items="${book_list}">
			<div class="content_book">
				<!-- <img class="book_img"
					src="https://www.mmcashop.co.kr/data/goods/20/06/25/1000000366/1000000366_add3_044.png"> -->
				<img class="book_img" src="images/<c:out value="${bl.book_img}"/>">
				<span class="book_title"><a href="book_detail.do?book_isbn=${bl.book_isbn}">${bl.book_name}</a></span>
				<span class="book_price">${ bl.book_price }원</span>
			</div>
		</c:forEach>
	</div>
</div>

