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
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/common_header_footer.css">
    <link rel="stylesheet" href="css/user_join_form.css">

	<!-- 다음 api 우편번호 검색 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- Google CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- JS -->
    <script src="js/scroll.js"></script>
    <script type="text/javascript">

$(function(){
	
	$("#cancelBtn").click(function() {
		location.replace("book.do");
	})//click
	
<%-- ID 팝업창 --%>
	$("#searchId").click(function(){
		idDup();
	});
<%-- ID 팝업창 --%>
<%-- @@@@@@@@@@@@@@@@@@@@@@@@우편번호 검색@@@@@@@@@@@@@@@@@@@@@@@@ --%>
	$("#searchZip").click(function(){
		searchZipcode();
	})//
<%-- @@@@@@@@@@@@@@@@@@@@@@@@우편번호 검색@@@@@@@@@@@@@@@@@@@@@@@@ --%>
	
<%-- 비밀번호, 비밀번호 확인 --%>
	$("#pass2").focusout(function() {
		if($("#pass").val()!=$("#pass2").val()){
			alert("비밀번호를 확인해 주세요.")
			$("#pass").val("");
			$("#pass2").val("");
			$("#pass").focus();
		}//end if
	});//focusout

<%-- 가입 버튼을 클릭했을 때 --%>
	$("#joinBtn").click(function(){
		if($("#id").val().trim() == ""){
			alert("아이디는 필수 입력 사항 입니다.");
			$("#id").focus();
			return;
		}//end if
		
		if($("#pass").val().trim() == ""){
			alert("비밀번호는 필수 입력 사항 입니다.");
			$("#pass").focus();
			return;
		}//end if
		
		if($("#pass2").val().trim() == ""){
			alert("비밀번호는 필수 입력 사항 입니다.");
			$("#pass2").focus();
			return;
		}//end if
		
		if($("#name").val().trim() == ""){
			alert("이름은 필수 입력 사항 입니다.");
			$("#name").focus();
			return;
		}//end if
		
		if($("#phone").val().trim() == ""){
			alert("핸드폰 번호는 필수 입력 사항 입니다.");
			$("#phone").focus();
			return;
		}//end if
		
		if($("#zipcode").val().trim() == ""){
			alert("우편번호는 필수 입력 사항 입니다.");
			$("#zipcode").focus();
			return;
		}//end if
		
		if($("#addr1").val().trim() == ""){
			alert("주소는 필수 입력 사항 입니다.");
			$("#addr1").focus();
			return;
		}//end if
		
		if($("#addr2").val().trim() == ""){
			alert("상세 주소는 필수 입력 사항 입니다.");
			$("#addr2").focus();
			return;
		}//end if
		
		$("#frm").submit();
	});//click
});//ready

<%-- ID 팝업창 --%>
function idDup(){
	var top=window.screenY+80;
	var left=window.screenX+200;
	window.open("dup_id.do","id","width=480,height=284,top="+top+",left="+left);	
}

<%-- ID 팝업창 --%>
<%-- @@@@@@@@@@@@@@@@@@@@@@@@우편번호 검색@@@@@@@@@@@@@@@@@@@@@@@@ --%>
function searchZipcode(){//다음 API를 사용한 우편번호 찾기
	
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addr1").value = roadAddr;
          //  document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
        }
    }).open();
}//searchZipcode

</script>
</head>

<body>

	<!-- header -->
	<c:import url="../common/common_header.jsp" />
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
        </div> <!-- title wrap -->

        <div class="main_content_wrap">
            <!-- 소제목 -->
            <div class="input_title_wrap">
                <div class="input_title">기본정보</div>
                <span>* 표시는 반드시 입력하셔야하는 항목입니다.</span>
            </div>
            <form class="input_form" id="frm" name="frm" action="member_join.do" method="post">
                <ul>
                    <li>
                        <span class="title">* 아이디</span>
                        <input type="text" class="input_short" placeholder="중복검사를 진행해주세요" readonly="readonly" id="id" name="user_id">
                        <input type="button" class="btn" value="중복 검사" id="searchId">
                    </li>
                    <li>
                        <span class="title">* 비밀번호</span><input type="password" class="input_short" id="pass">
                    </li>
                    <li>
                        <span class="title">* 비밀번호 확인</span><input type="password" class="input_short" id="pass2" name="user_pass">
                    </li>
                    <li>
                        <span class="title">* 이름</span><input type="text" class="input_long" id="name" name="user_name">
                    </li>
                    <li>
                        <span class="title">* 휴대폰 번호</span><input type="text" class="input_long" id="phone" name="user_phone">
                    </li>
                    <li>
                        <span class="title">* 주소</span>
                        <input type="text" class="input_short" placeholder="우편번호 검색을 진행해주세요" readonly id="zipcode" name="user_zipcode">
                        <input type="button" class="btn" value="우편번호 검색" id="searchZip">
                    </li>
                    <li>
                        <input type="text" class="input_long" placeholder="우편번호 검색을 진행해주세요" readonly id="addr1" name="user_addr1">
                    </li>
                    <li>
                        <input type="text" class="input_long" placeholder="상세 주소를 입력해주세요" id="addr2" name="user_addr2">
                    </li>
                    <li>
                        <input type="button" class="btn_cancel btn" value="취소" id="cancelBtn">
                        <input type="button" class="btn_submit btn" value="회원 가입" id="joinBtn">
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