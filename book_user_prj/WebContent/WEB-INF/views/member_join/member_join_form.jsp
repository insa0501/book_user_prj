<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입🙆‍♀️-정보입력</title>

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
    <link rel="stylesheet" href="../dist/css/common_header_footer.css">
    <link rel="stylesheet" href="../dist/css/user_join_form.css">


    <!-- JS -->
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
        <!-- 회원가입 제목, 우측의 단계 -->
        <div class="title_wrap">
            <div class="section_title">회원가입</div>
            <ul>
                <li><span>01</span>약관동의<span class="arrow">></span></li>
                <li><span>02</span>정보입력<span class="arrow">></span></li>
                <li><span>03</span>가입완료</li>
            </ul>
        </div> <!-- title wrap -->

        <div class="main_content_wrap">
            <!-- 소제목 -->
            <div class="input_title_wrap">
                <div class="input_title">기본정보</div>
                <span>* 표시는 반드시 입력하셔야하는 항목입니다.</span>
            </div>
            <form class="input_form">
                <ul>
                    <li>
                        <span class="title">* 아이디</span>
                        <input type="text" class="input_short" placeholder="중복검사를 진행해주세요" readonly>
                        <input type="button" class="btn" value="중복 검사">
                    </li>
                    <li>
                        <span class="title">* 비밀번호</span><input type="password" class="input_short">
                    </li>
                    <li>
                        <span class="title">* 비밀번호 확인</span><input type="password" class="input_short">
                    </li>
                    <li>
                        <span class="title">* 이름</span><input type="text" class="input_long">
                    </li>
                    <li>
                        <span class="title">* 휴대폰 번호</span><input type="text" class="input_long">
                    </li>
                    <li>
                        <span class="title">* 주소</span>
                        <input type="text" class="input_short" placeholder="우편번호 검색을 진행해주세요" readonly>
                        <input type="button" class="btn" value="우편번호 검색">
                    </li>
                    <li>
                        <input type="text" class="input_long" placeholder="우편번호 검색을 진행해주세요" readonly>
                    </li>
                    <li>
                        <input type="text" class="input_long" placeholder="상세 주소를 입력해주세요">
                    </li>
                    <li>
                        <input type="button" class="btn_cancel btn" value="취소">
                        <input type="button" class="btn_submit btn" value="회원 가입">
                    </li>
                </ul>
            </form>
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