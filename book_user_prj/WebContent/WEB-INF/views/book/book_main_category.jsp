<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
		<div class="main_category">
			<c:if test="${param.book eq 'kor'}">
				<div class="cate_title">국내 도서</div>
			</c:if>
			<c:if test="${param.book eq 'for'}">
				<div class="cate_title">외국 도서</div>
			</c:if>
			<ul class="cateList">
				<li><a href="booklist.do?book=${ param.book }&type=all" id="all">전체</a></li>
				<li><a href="booklist.do?book=${ param.book }&type=science" id="science">과학</a></li>
				<li><a href="booklist.do?book=${ param.book }&type=kids" id="kids">아동</a></li>
				<li><a href="booklist.do?book=${ param.book }&type=novel" id="novel">소설</a></li>
				<li><a href="booklist.do?book=${ param.book }&type=travel" id="travel">여행</a></li>
				<li><a href="booklist.do?book=${ param.book }&type=cook" id="cook">요리</a></li>
				<li><a href="booklist.do?book=${ param.book }&type=psycho" id="psycho">심리</a></li>
			</ul>
		</div>