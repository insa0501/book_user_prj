<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>메인📕</title>

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
  <link rel="stylesheet" href="../dist/css/reset.css">
  <link rel="stylesheet" href="../dist/css/main.css">
  <link rel="stylesheet" href="../dist/css/common_header_footer.css">

  <!-- JS -->
  <!-- header nav용 js (scroll.js) -->
  <script src="../js/scroll.js"></script>
</head>

<body>

  <!-- header -->
  <section class="section_header">
    <div class="topper_nav" id="topper_nav">
      <ul>
        <li class="topper_nav_login"><a href="user_login.html">로그인</a></li>
        <li><a href="#void">마이페이지</a></li>
        <li><a href="user_search.html">검색</a></li>
        <li><a href="#void">고객센터</a></li>
      </ul>
      <div class="nav_big_logo">
        BOOKS
      </div>
    </div>
    <div class="header_nav nav-down" id="header_nav">
      <div class="nav_logo gone">BOOKS</div>
      <ul class="nav_menu">
        <li class="nav_best_seller">베스트셀러</li>
        <li class="nav_kor_book">국내도서</li>
        <li class="nav_for_book">외국도서</li>
        <li class="nav_new_book">신간도서</li>
        <li class="nav_event">이벤트</li>
      </ul>
      <div class="nav_user_icons gone">
        <span><i class="fas fa-sign-in-alt"></i></span>
        <span><i class="far fa-user"></i></span>
        <span><i class="fas fa-search"></i></span>
      </div>
    </div>
  </section> <!-- header end -->

  <!-- main section -->
  <section class="section_main">
    <!-- 이미지 슬라이드 -->
    <div class="wrap_img_slide">
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="d-block w-100" src="https://cdn.pixabay.com/photo/2016/08/24/16/20/books-1617327_960_720.jpg"
              alt="First slide">
          </div>
          <div class="carousel-item">
            <img class="d-block w-100" src="https://cdn.pixabay.com/photo/2016/03/26/22/21/books-1281581_960_720.jpg"
              alt="Second slide">
          </div>
          <div class="carousel-item">
            <img class="d-block w-100"
              src="https://cdn.pixabay.com/photo/2015/11/19/21/11/knowledge-1052014_960_720.jpg" alt="Third slide">
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div> <!-- img_slide-->

    <!-- 베스트셀러 -->
    <div class="book_category_title">
      Best Sellers
    </div>
    <div class="wrap_best_seller">
      <div class="best_seller_book">
        <img class="book_img" src="https://www.mmcashop.co.kr/data/goods/20/06/25/1000000366/1000000366_add3_044.png">
        <span class="book_title">보존과학자 C의 하루</span>
        <span class="book_price">32,000원</span>
      </div>
      <div class="best_seller_book">
        <img class="book_img" src="https://www.mmcashop.co.kr/data/goods/20/06/25/1000000366/1000000366_add3_044.png">
        <span class="book_title">보존과학자 C의 하루</span>
        <span class="book_price">32,000원</span>
      </div>
      <div class="best_seller_book">
        <img class="book_img" src="https://www.mmcashop.co.kr/data/goods/20/06/25/1000000366/1000000366_add3_044.png">
        <span class="book_title">보존과학자 C의 하루</span>
        <span class="book_price">32,000원</span>
      </div>
      <div class="best_seller_book">
        <img class="book_img" src="https://www.mmcashop.co.kr/data/goods/20/06/25/1000000366/1000000366_add3_044.png">
        <span class="book_title">보존과학자 C의 하루</span>
        <span class="book_price">32,000원</span>
      </div>
      <div class="best_seller_book">
        <img class="book_img" src="https://www.mmcashop.co.kr/data/goods/20/06/25/1000000366/1000000366_add3_044.png">
        <span class="book_title">보존과학자 C의 하루</span>
        <span class="book_price">32,000원</span>
      </div>
      <div class="best_seller_book">
        <img class="book_img" src="https://www.mmcashop.co.kr/data/goods/20/06/25/1000000366/1000000366_add3_044.png">
        <span class="book_title">보존과학자 C의 하루</span>
        <span class="book_price">32,000원</span>
      </div>
      <div class="best_seller_book">
        <img class="book_img" src="https://www.mmcashop.co.kr/data/goods/20/06/25/1000000366/1000000366_add3_044.png">
        <span class="book_title">보존과학자 C의 하루</span>
        <span class="book_price">32,000원</span>
      </div>
      <div class="best_seller_book">
        <img class="book_img" src="https://www.mmcashop.co.kr/data/goods/20/06/25/1000000366/1000000366_add3_044.png">
        <span class="book_title">보존과학자 C의 하루</span>
        <span class="book_price">32,000원</span>
      </div>

    </div>

    <!-- 배너 -->
    <div class="wrap_banner">
      <img class="banner-img"
        src="https://www.mmcashop.co.kr/data/skin/front/designwib/img/banner/b30296baa6c9dce302878bf47e481872_27468.png">
    </div>

    <!-- 이달의 신간 -->
    <div class="book_category_title">
      New Publications
    </div>
    <div class="wrap_monthly_new">
      <div class="monthly_new_book">
        <img class="book_img" src="https://www.mmcashop.co.kr/data/goods/20/06/25/1000000366/1000000366_add3_044.png">
        <span class="book_title">보존과학자 C의 하루</span>
        <span class="book_price">32,000원</span>
      </div>
      <div class="monthly_new_book">
        <img class="book_img" src="https://www.mmcashop.co.kr/data/goods/20/06/25/1000000366/1000000366_add3_044.png">
        <span class="book_title">보존과학자 C의 하루</span>
        <span class="book_price">32,000원</span>
      </div>
      <div class="monthly_new_book">
        <img class="book_img" src="https://www.mmcashop.co.kr/data/goods/20/06/25/1000000366/1000000366_add3_044.png">
        <span class="book_title">보존과학자 C의 하루</span>
        <span class="book_price">32,000원</span>
      </div>
      <div class="monthly_new_book">
        <img class="book_img" src="https://www.mmcashop.co.kr/data/goods/20/06/25/1000000366/1000000366_add3_044.png">
        <span class="book_title">보존과학자 C의 하루</span>
        <span class="book_price">32,000원</span>
      </div>
    </div>

    <!-- 추천 책 -->
    <div class="wrap_recommend">
      <div>
        <img class="recommend-img" src="https://cdn.pixabay.com/photo/2015/09/05/21/51/reading-925589_960_720.jpg">
      </div>
      <div class="recommend_comment">
        <span class="comment_category">화제의 책 소식</span>
        <span class="comment_title">주목 이달의 책<br>어쩌저쩌웅앵</span>
        <span class="comment_content">Lorem ipsum dolor sit amet consectetur adipisicing elit.
          Necessitatibus tenetur temporibus, enim nostrum soluta deleniti?
          Veritatis maiores consequuntur magni, quisquam</span>
        <span class="comment_btn">상품 보기</span>
      </div>

    </div>

    <div class="wrap_events">
      <div class="event">
        <img class="event_img"
          src="https://mmcashop.co.kr/data/skin/front/designwib/img/banner/f3ccdd27d2000e3f9255a7e3e2c48800_51635.jpg">
      </div>
      <div class="event">
        <img class="event_img"
          src="https://mmcashop.co.kr/data/skin/front/designwib/img/banner/f3ccdd27d2000e3f9255a7e3e2c48800_51635.jpg">
      </div>
    </div>

  </section> <!-- main end -->



  <!-- footer -->
  <section class="footer">
    <div class="footer_text">
      @copyright 2조 <br>
      Lorem ipsum dolor sit amet consectetur adipisicing elit.<br>
      Necessitatibus tenetur temporibus, enim nostrum soluta deleniti? <br>
      Veritatis maiores consequuntur magni

    </div>

    <div class="go_to_top">
      <a href=".section_header"><i class="fas fa-angle-up"></i></a>
    </div>
  </section>


</body>

</html>