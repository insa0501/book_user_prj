<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디찾기👻-결과</title>

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
    <link rel="stylesheet" href="css/common_header_footer.css">
    <link rel="stylesheet" href="css/user_find_id_result.css">

    <!-- JS -->
    <script src="js/scroll.js"></script>
<script type="text/javascript">

	$(function(){
		$("#pw_find_btn").click(function() {
			location.replace('find_pass_form.do');
		});//click
		
		$("#login_btn").click(function() {
			location.replace('login_form.do');
		});//click
	});//ready
	
</script>
</head>
<body>

	<!-- header -->
	<c:import url="../common/common_header.jsp" />
	<!-- header end -->


    <!-- main section -->
    <section class="section_main">
        <div class="find_id_wrap">
            <div class="find_id_title">아이디찾기 -결과</div>
            <div class="find_id_input">
                <div class="find_result">
                    <span>회원님의 아이디는</span>
                    <c:if test="${ empty user_id }">
                    <span> 존재하지 않습니다.<br/>
                    <a href="javascript:location.replace('find_id_form.do')">아이디 찾기</a><br/>
                    <a href="javascript:location.replace('agreement.do')">회원가입</a></span>
                    </c:if>
                    <c:if test="${ not empty user_id }">
                    <span> <span><c:out value="${ user_id }"/></span> 입니다. </span>
                    </c:if>
                </div>
                <div class="btns_wrap">
                    <input type="button" class="pw_find_btn" value="비밀번호 찾기" id="pw_find_btn">
                    <input type="button" class="login_btn" value="로그인하기" id="login_btn">
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