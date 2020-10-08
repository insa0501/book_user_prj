<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
<div class="main_category">
	<c:choose>
		<c:when test="${param.book eq 'new' }">
			<div class="cate_title">신간도서</div>			
		</c:when>
		<c:otherwise>
			<div class="cate_title">베스트셀러</div>			
		</c:otherwise>
	</c:choose>
	<ul>
		<li><a href="#best_science">과학</a></li>
		<li><a href="#best_kids">아동</a></li>
		<li><a href="#best_novel">소설</a></li>
		<li><a href="#best_travel">여행</a></li>
		<li><a href="#best_cook">요리</a></li>
		<li><a href="#best_psycho">심리</a></li>
	</ul>
</div>