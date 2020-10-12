<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="메인화면"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인📕</title>

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
<link rel="stylesheet"	href="css/reset.css">
<link rel="stylesheet"	href="css/common_header_footer.css">
<link rel="stylesheet"	href="css/main.css">

<!-- js -->
<script src="js/scroll.js"></script>
<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">

	$(function() {
		
		<c:if test="${ res_flag }">
		alert("탈퇴되었습니다.");
		</c:if>
		
	});//ready
</script>
</head>

<body>

	<!-- header -->
	<c:import url="../common/common_header.jsp" />
	<!-- header end -->

	<!-- main section -->
	<section class="section_main">
		<!-- 이미지 슬라이드 -->
		<div class="wrap_img_slide">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100"
							src="https://cdn.pixabay.com/photo/2016/08/24/16/20/books-1617327_960_720.jpg"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="https://cdn.pixabay.com/photo/2016/03/26/22/21/books-1281581_960_720.jpg"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="https://cdn.pixabay.com/photo/2015/11/19/21/11/knowledge-1052014_960_720.jpg"
							alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<!-- img_slide-->

		<!-- 베스트셀러 -->
		
		<div class="book_category_title">Best Sellers</div>
		<div class="wrap_best_seller">
			<c:import url="/bookList_best.do"/>
		</div> 
		<div class="see_more"><a href="bookbest.do?book=best">베스트셀러 더보기 >></a></div>
		<!-- 베스트셀러  end -->
		

		<!-- 배너 -->
		<div class="wrap_banner">
			<img class="banner-img"
				src="https://www.mmcashop.co.kr/data/skin/front/designwib/img/banner/b30296baa6c9dce302878bf47e481872_27468.png">
		</div>


		<!-- 신간 -->
		<div class="book_category_title">New Publications</div>
		<div class="wrap_monthly_new">
			<c:import url="/bookList_new.do"/>
		</div>
		<div class="see_more"><a href="booknew.do?book=new">신간 도서 더보기 >></a></div>
		<!-- 신간 end -->



		<!-- 이벤트 -->
		<div class="wrap_recommend">
			<div>
				<img class="recommend-img"
					src="https://cdn.pixabay.com/photo/2015/09/05/21/51/reading-925589_960_720.jpg">
			</div>
			<div class="recommend_comment">
				<span class="comment_category">오픈 기념 이벤트</span> <span
					class="comment_title">10,000원 이상 주문시<br>배송료 무료
				</span> 
					<span class="comment_content">
						동일 주문 건에 대해 합계가 10,000원 이상일 시 배송료 무료! <br>
						원하는 책을 언제든 주문하세요!
					</span>
				<span class="comment_btn"><a href="event_main.do">이벤트 더 보기</a></span>
			</div>

		</div>

	</section>
	<!-- main end -->

	<!-- footer -->
	<c:import url="../common/common_footer.jsp" />
	<!-- footer end -->

</body>

</html>