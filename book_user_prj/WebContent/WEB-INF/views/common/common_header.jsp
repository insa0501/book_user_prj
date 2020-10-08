<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
		<section class="section_header">
		<div class="topper_nav" id="topper_nav">
			<ul>
				<c:if test="${ empty sessionScope.id }">
				<li class="topper_nav_login"><a href="login_form.do">로그인</a></li>
				</c:if>
				<c:if test="${ not empty sessionScope.id }">
				<li class="topper_nav_login"><a href="logout_process.do">로그아웃</a></li>
				</c:if>
				<li><a href="order_list.do">마이페이지</a></li>
				<li><a href="user_book_search_frm.do">검색</a></li>
				<li><a href="#void">고객센터</a></li>
			</ul>
			<div class="nav_big_logo"><a href="book.do">BOOKS</a></div>
		</div>
		<div class="header_nav nav-down" id="header_nav">
			<div class="nav_logo gone"><a href="book.do">BOOKS</a></div>
			<ul class="nav_menu">
				<li class="nav_best_seller"><a href="bookbest.do?book=best">베스트셀러</a></li>
				<li class="nav_kor_book"><a href="booklist.do?book=kor">국내도서</a></li>
				<li class="nav_for_book"><a href="booklist.do?book=for">외국도서</a></li>
				<li class="nav_new_book"><a href="booknew.do?book=new">신간도서</a></li>
				<li class="nav_event"><a href="event_main.do">이벤트</a></li>
			</ul>
			<div class="nav_user_icons gone">
				<span><i class="fas fa-sign-in-alt"></i></span> <span><i
					class="far fa-user"></i></span> <span><i class="fas fa-search"></i></span>
			</div>
		</div>
	</section>