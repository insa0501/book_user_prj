<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입-완료</title>

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
    <link rel="stylesheet" href="../dist/css/user_join_done.css">

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
        <div class="join_wrap">
            <div class="join_title">회원가입 -완료</div>
            <div class="join_input">
                <div class="find_result">
                    <i class="fas fa-user-astronaut fa-3x"></i>
                    <span>회원가입이 완료되었습니다.</span>
                    <span> <span>test123</span>님의 회원가입을 축하합니다!</span>
                </div>
                <div class="btns_wrap">
                    <input type="button" class="go_main" value="메인으로">
                    <input type="button" class="login_btn" value="로그인하기">
                </div>
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