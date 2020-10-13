<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



	<!-- 책 wrapper -->
		<c:if test="${ empty book_list_best }">
			<c:import url="empty_list.jsp"/>
		</c:if>
		
		
		<c:choose>
			<c:when test="${param.book eq 'best'}">
				<c:forEach var="bl" items="${book_list_best}">
					<div class="content_book">
						<!-- <img class="book_img" src="https://www.mmcashop.co.kr/data/goods/20/06/25/1000000366/1000000366_add3_044.png"> -->
						 <img class="book_img" src="<c:out value="${bl.book_img}"/>">
						<span class="book_title"><a href="book_detail.do?book_isbn=${bl.book_isbn}"> ${bl.book_name}</a></span>
						<span class="book_price">${ bl.book_price }원</span>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="bl" items="${book_list_best}" varStatus="vs" begin="0" end="7" step="1">
					<div class="content_book">
						<!-- <img class="book_img" src="https://www.mmcashop.co.kr/data/goods/20/06/25/1000000366/1000000366_add3_044.png"> -->
						 <img class="book_img" src="<c:out value="${bl.book_img}"/>">
						<span class="book_title"><a href="book_detail.do?book_isbn=${bl.book_isbn}">${bl.book_name}</a></span>
						<span class="book_price">${ bl.book_price }원</span>
					</div>
				</c:forEach>
			</c:otherwise>
		
		</c:choose>
		
		
		
