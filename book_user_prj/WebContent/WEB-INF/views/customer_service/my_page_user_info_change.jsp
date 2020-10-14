<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보 수정✍-확인</title>

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
    <link rel="stylesheet" href="css/user_change_info_form.css">
    <link rel="stylesheet" href="css/mypage_category.css">
    

	<!-- 다음 api 우편번호 검색 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- JS -->
    <script src="js/scroll.js"></script>
    <!-- Google CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#cancleBtn").click(function() {
			location.replace("user_pass_check_form.do");
		});//click
		
		<%-- 비밀번호, 비밀번호 확인 --%>
		$("#pass2").focusout(function() {
			if($("#pass").val()!=$("#pass2").val()){
				alert("비밀번호를 확인해 주세요.")
				$("#pass").val("");
				$("#pass2").val("");
				$("#pass").focus();
			}//end if
		});//focusout
		
		//수정 버튼이 클릭된 경우
		$("#updateInfoBtn").click(function(){
		   
		   if($("#pass").val().trim() == ""){
		      alert("비밀번호는 필수 입력 사항 입니다.");
		      return;
		   }//end if
		   
		   if($("#pass2").val().trim() == ""){
		      alert("비밀번호는 필수 입력 사항 입니다.");
		      return;
		   }//end if
		   
		   if( $("#pass").val() != $("#pass2").val() ){
		      alert("비밀번호를 확인해주세요.");
		      $("#pass").val("");
		      $("#pass2").val("");
		      return;
		   }
		   
		   if($("#phone").val().trim() == ""){
		      alert("핸드폰 번호는 필수 입력 사항 입니다.");
		      return;
		   }//end if
		   
		   if($("#zipcode").val().trim() == ""){
		      alert("우편번호는 필수 입력 사항 입니다.");
		      return;
		   }//end if
		   
		   if($("#addr1").val().trim() == ""){
		      alert("주소는 필수 입력 사항 입니다.");
		      return;
		   }//end if
		   
		   if($("#addr2").val().trim() == ""){
		      alert("상세 주소는 필수 입력 사항 입니다.");
		      return;
		   }//end if
		   
		   $("#frm").submit();
		});//click
		
		<%-- @@@@@@@@@@@@@@@@@@@@@@@@우편번호 검색@@@@@@@@@@@@@@@@@@@@@@@@ --%>
		$("#searchZip").click(function(){
		   searchZipcode();
		})//
	});//ready
	
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
	<!-- mypage_category -->
	<c:import url="mypage_category.jsp" />
	<!-- mypage_category end -->

        <!-- 우측의 내용들 -->
        <div class="main_content">
            <div class="content_title">
                개인정보 수정
            </div>

            <form id="frm" class="input_form" action="user_info_change_process.do" method="post">
                <ul>
                    <li>
                        <span class="title">아이디</span>
                        <span><c:out value="${ user_info.user_id }"/></span>
                    </li>
                    <li>
                        <span class="title">새 비밀번호</span><input type="password" id="pass" class="input_short" value="${ user_pass }">
                    </li>
                    <li>
                        <span class="title">새 비밀번호 확인</span><input type="password" id="pass2" name="user_pass" class="input_short" value="${ user_pass }">
                    </li>
                    <li>
                        <span class="title">휴대폰 번호</span><input type="text" id="phone" name="user_phone" class="input_long" value="${ user_info.user_phone }">
                    </li>
                    <li>
                        <span class="title">주소</span>
                        <input type="text" id="zipcode" name="user_zipcode" class="input_short" placeholder="우편번호 검색을 진행해주세요" readonly value="${ user_info.user_zipcode }" >
                        <input type="button" id="searchZip" class="btn" value="우편번호 검색">
                    </li>
                    <li>
                        <input type="text" id="addr1" name="user_addr1" class="input_long" placeholder="우편번호 검색을 진행해주세요" readonly value="${ user_info.user_addr1 }" >
                    </li>
                    <li>
                        <input type="text" id="addr2" name="user_addr2" class="input_long" placeholder="상세 주소를 입력해주세요" value="${ user_info.user_addr2 }" >
                    </li>
                    <li>
                        <input type="button" class="btn_cancel btn" value="취소" id="cancleBtn">
                        <input type="button" class="btn_submit btn" value="정보 수정" id="updateInfoBtn">
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