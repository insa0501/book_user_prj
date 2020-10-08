<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    info="이벤트 페이지 "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    

<!DOCTYPE html>
<html>

<head>
  <meta charset="EUC-KR">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>이벤트</title>

  <!-- bootstrap etc -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
  </script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
  </script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
  </script>
  <!-- css -->
  <link rel="stylesheet" href="css/reset.css">
  <link rel="stylesheet" href="css/event_main.css">
  <link rel="stylesheet" href="css/common_header_footer.css">

  <!-- JS -->
  <!-- header nav용 js (scroll.js) -->
<script src="http://localhost/book_user_prj/js/scroll.js"></script>
</head>

<body>

	<!-- header -->
	<c:import url="../common/common_header.jsp" />
	<!-- header end -->

  <!-- main section -->
  <section class="section_main">
    <div class="event_wrap">
        <ul>
            <li class="event">
                <img src="http://localhost/book_user_prj/images/event_title_2.png">
                <div class="event_description">
                    <span class="event_title"><a href="event_detail.do?event=2">구매 사은품 증정</a></span>
                    <span class="event_date">2020.10.01~2021.10.01</span>
                </div>
            </li>
            <li class="event">
                <img src="http://localhost/book_user_prj/images/event_title_1.png">
                <div class="event_description">
                    <span class="event_title"><a href="event_detail.do?event=1">오픈 기념 무료배송</a></span>
                    <span class="event_date">2020.10.01~2021.10.01</span>
                </div>
            </li>
        </ul>
    </div>
  </section> <!-- main end -->

	<!-- footer -->
	<c:import url="../common/common_footer.jsp" />
	<!-- footer end -->


</body>

</html>