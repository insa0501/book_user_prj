<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>약관동의</title>
    <!--Bootstrap-->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
      crossorigin="anonymous"
    />
    <script
      src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
      integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
      integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
      crossorigin="anonymous"
    ></script>
    <!--CSS-->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
    />
    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../css/common_header_footer.css" />
    <link rel="stylesheet" href="../css/agreement.css" />
    <!-- JS -->
    <!-- header nav용 js (scroll.js) -->
    <script src="../js/scroll.js"></script>
  </head>
  <body>
    <!-- header -->
    <section class="section_header">
      <div class="topper_nav" id="topper_nav">
        <ul>
          <li class="topper_nav_login"><a href="#void">로그인</a></li>
          <li><a href="#void">마이페이지</a></li>
          <li><a href="#void">검색</a></li>
          <li><a href="#void">고객센터</a></li>
        </ul>
        <div class="nav_big_logo">BOOKS</div>
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
    </section>
    <!-- header end -->
    <!-- main section -->
    <section class="section_main">
      <!-- 회원가입 제목, 우측의 단계 -->
      <div class="title_wrap">
        <div class="section_title">회원가입</div>
        <ul>
          <li><span>01</span>약관동의<span class="arrow">></span></li>
          <li><span>02</span>정보입력<span class="arrow">></span></li>
          <li><span>03</span>가입완료</li>
        </ul>
      </div>
      <!-- title wrap -->
      <div class="content_wrap">
        <div class="content_title">
          <div class="sub_title">약관동의</div>
        </div>
        <div class="agree_content">
          <div class="agree_box">
            <div class="form-check agree_chk">
              <input
                class="form-check-input"
                type="checkbox"
                value=""
                id="defaultCheck1"
              />
              <label class="form-check-label" for="defaultCheck1">
                <span>BOOKS의 모든 약관을 확인하고 전체 동의합니다.</span>
              </label>
            </div>
          </div>
          <div class="agree_box">
            <div class="form-check agree_chk">
              <input
                class="form-check-input"
                type="checkbox"
                value=""
                id="defaultCheck2"
              />
              <label class="form-check-label" for="defaultCheck2">
                <span>(필수)</span>이용약관
              </label>
            </div>
            <div class="agree_text">
              <textarea>우아어앙</textarea>
            </div>
          </div>
          <div class="agree_box">
            <div class="form-check agree_chk">
              <input
                class="form-check-input"
                type="checkbox"
                value=""
                id="defaultCheck3"
              />
              <label class="form-check-label" for="defaultCheck3">
                <span>(필수)</span>개인정보 수집 및 이용
              </label>
            </div>
            <div class="agree_text">
              <textarea>우아어앙</textarea>
            </div>
          </div>
          <div class="agree_box">
            <div class="form-check agree_chk">
              <input
                class="form-check-input"
                type="checkbox"
                value=""
                id="defaultCheck4"
              />
              <label class="form-check-label" for="defaultCheck4">
                <span>(선택)</span>개인정보 수집 및 이용
              </label>
            </div>
            <div class="agree_text">
              <textarea></textarea>
            </div>
          </div>
        </div>

        <div class="button_box">
          <input type="button" class="next_btn" value="다음단계" />
        </div>
      </div>
    </section>
    <!-- main end -->
    <!-- footer -->
    <section class="footer">
      <div class="footer_text">
        @copyright 2조 <br />
        Lorem ipsum dolor sit amet consectetur adipisicing elit.<br />
        Necessitatibus tenetur temporibus, enim nostrum soluta deleniti? <br />
        Veritatis maiores consequuntur magni
      </div>

      <div class="go_to_top">
        <a href=".section_header"><i class="fas fa-angle-up"></i></a>
      </div>
    </section>
  </body>
</html>