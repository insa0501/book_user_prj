<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비번찾기👻</title>

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
    <link rel="stylesheet" href="css/user_find_pw.css">

    <!-- JS -->
    <script src="js/scroll.js"></script>
<script type="text/javascript">
	
	<c:if test="${ errFlag }">
	alert("입력하신 회원 정보가 존재하지 않습니다.");
	</c:if>

	$(function() {
		$("#findPassBtn").click(function(){ 
			if($("#user_id").val()=="") {
				alert("아이디를 입력해 주세요.");
				return;
			}//end if
			if($("#user_name").val()=="") {
				alert("이름을 입력해 주세요.");
				return;
			}//end if
			if($("#user_phone").val()=="") {
				alert("핸드폰 번호를 입력해 주세요.");
				return;
			}//end if
			$("#frm").submit();
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
            <div class="login_title">비밀번호 찾기</div>
            <div class="login_input">
                <form id="frm" action="find_pass.do" method="post">
                    <input type="text" class="input_id" placeholder="아이디를 입력해주세요" id="user_id" name="user_id">
                    <input type="button" class="find_btn" value="비밀번호 찾기" id="findPassBtn">
                    <input type="text" class="input_name" placeholder="이름을 입력해주세요" id="user_name" name="user_name">
                    <input type="password" class="input_phone" placeholder="핸드폰 번호를 입력해주세요" id="user_phone" name="user_phone">
                </form>
                <div class="btns_wrap">
                    <span>혹시 아이디가 생각나지 않으시나요? <a href="find_id_form.do">아이디 찾기</a> </span>
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