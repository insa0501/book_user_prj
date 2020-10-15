<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도서 목록페이지📘</title>

<!-- bootstrap etc -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous">
	
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous">
	
</script>
<!-- css -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/common_header_footer.css">
<link rel="stylesheet" href="css/user_book_list.css">
<link rel="stylesheet"	href="css/book_category.css">


<!-- JS -->
<script src="js/scroll.js"></script>

</head>

<body>

	<!-- header -->
	<c:import url="../common/common_header.jsp" />
	<!-- header end -->


	<!-- main section -->
	<section class="section_main">
		<!-- 카테고리 -->
		<c:import url="book_best_category.jsp"/>
		
		<!-- 우측에 책 있는 부분 -->
		<div class="main_content">
			<div class="sub_title" id="best_science">과학</div>
			<div class="content_wrap_books">
				<c:import url="/bookList_best.do" >
					<c:param name="book_type_no" value="0" />
				</c:import>
			</div>
			
			<div class="sub_title"id="best_kids">아동</div>
			<div class="content_wrap_books">
				<c:import url="/bookList_best.do" >
					<c:param name="book_type_no" value="1" />
				</c:import>
			</div>
			
			<div class="sub_title" id="best_novel">소설</div>
			<div class="content_wrap_books">
				<c:import url="/bookList_best.do" >
					<c:param name="book_type_no" value="2" />
				</c:import>
			</div>
			
			
			<div class="sub_title" id="best_travel">여행</div>
			<div class="content_wrap_books">
				<c:import url="/bookList_best.do" >
					<c:param name="book_type_no" value="3" />
				</c:import>
			</div>
			
			
			<div class="sub_title" id="best_cook">요리</div>
			<div class="content_wrap_books">
				<c:import url="/bookList_best.do" >
					<c:param name="book_type_no" value="4" />
				</c:import>
			</div>
			
			
			<div class="sub_title" id="best_psycho">심리</div>
			<div class="content_wrap_books">
				<c:import url="/bookList_best.do" >
					<c:param name="book_type_no" value="5" />
				</c:import>												
			</div>
		</div>
		
	</section><!-- main end -->

	<!-- footer -->
	<c:import url="../common/common_footer.jsp" />
	<!-- footer end -->


</body>

</html>