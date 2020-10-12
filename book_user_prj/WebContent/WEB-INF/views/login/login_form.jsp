<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인👍</title>

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
    <link rel="stylesheet" href="css/user_login.css">

    <!-- JS -->
    <script src="js/scroll.js"></script>
    
    <!-- Google CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
    
    if(${ param.paymentFlag eq 'true'}){
    	alert("로그인해주세요");
    }
    
    <c:if test="${ not empty sessionScope.id }">
    location.replace("book.do");
    </c:if>
    
    <c:if test="${ updateFlag eq true }">
    alert("비밀번호가 변경되었습니다.");
    </c:if>
    <c:if test="${ updateFlag eq false }">
    alert("비밀번호 변경 중 문제가 발생하였습니다.\n잠시후 다시 시도해주세요.");
    </c:if>
    
	$(function() {
		$("#login_btn").click(function(){ 
			if($("#user_id").val()=="") {
				alert("아이디를 입력해 주세요.");
				return;
			}//end if
			if($("#user_pass").val()=="") {
				alert("비밀번호를 입력해 주세요.");
				return;
			}//end if
			
			
			$("#frm").submit();
		})//click
		
		$("#join_btn").click(function() {
			location.href="agreement.do";
		})//click
		
		$("#findId_btn").click(function() {
			location.href="find_id_form.do";
		})//click
		
		$("#findPass_btn").click(function() {
			location.href="find_pass_form.do";
		})//click
	});//ready

</script>
</head>

<body>

	<!-- header -->
	<c:import url="../common/common_header.jsp" />
	<!-- header end -->


    <!-- main section -->
    <section class="section_main">
        <div class="login_wrap">
            <div class="login_title">LOGIN</div>
            <div class="login_input">
                <form action="login_process.do" id="frm" method="POST">

                    <input type="text" class="input_id" name="user_id" id="user_id" value="${ user_id }">
                    <input type="button" class="login_btn" value="로그인" id="login_btn">
                    <input type="password" class="input_pass" name="user_pass" id="user_pass">
                    <span>
                    	<c:if test="${ empty user_id }">
                        <input type="checkbox" id="remember_chk" name="remember_chk" class="remember_chk" value="remember">
                        </c:if>
                    	<c:if test="${ not empty user_id }">
                        <input type="checkbox" id="remember_chk" name="remember_chk" class="remember_chk" value="remember" checked="checked">
                    	</c:if>
                        <label for="remember_chk">아이디 저장</label>
                    </span>
                </form>
                <div id="login_err" style="color: red"><c:out value="${ err_msg }"/></div>
                <div class="btns_wrap">
                    <input type="button" class="join_btn" value="회원가입" id="join_btn">
                    <input type="button" class="find_btn" value="아이디찾기" id="findId_btn">
                    <input type="button" class="find_btn" value="비밀번호찾기" id="findPass_btn">
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