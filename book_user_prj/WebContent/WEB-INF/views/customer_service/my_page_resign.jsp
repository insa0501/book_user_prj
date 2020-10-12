<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴😢💦</title>

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
    <link rel="stylesheet" href="css/user_resign.css">


    <!-- JS -->
    <script src="js/scroll.js"></script>
    <!-- Google CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">

	$(function() {
		<c:if test="${ not empty res_flag }">
		alert("비밀번호를 확인해주세요.");
		</c:if>
		
		$("#cancleBtn").click(function() {
			history.back();
		});//click
		
		$("#resignBtn").click(function() {
			if($("#user_pass").val()=="") {
				alert("비밀번호를 입력해 주세요.");
				return;
			}//end if
			
			var cnt=0;
			
			$.each($("[name='chk']"),function(i,resdata){
				if($(resdata).is(":checked")){
					cnt++;
				}//end if
			});//each
			
			if(cnt==0){
				alert("탈퇴 사유를 1개 이상 선택해주세요.");
				return;
			}//end if
			
			$("#frm").submit();
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
	<!-- mypage_category -->
	<c:import url="mypage_category.jsp" />
	<!-- mypage_category end -->

        <!-- 우측의 내용들 -->
        <div class="wrap_content">
            <div class="content_title">
                회원 탈퇴
            </div>

            <div class="main_content">
                <div class="resign_info_wrap">
                    <span class="resign_title">01. 탈퇴 안내</span>
                    <span class="resign_info">
                        1. 탈퇴하면 모든 정보가 사라집니다 어쩌고저쩌고 구입내역 다 사라짐 라라라
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias voluptates nihil eaque blanditiis
                        rem nesciunt aperiam voluptatibus minima obcaecati? Doloribus, modi iusto. Blanditiis, magnam
                        odit quos iste assumenda pariatur amet! <br><br>                        
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias voluptates nihil eaque blanditiis
                        rem nesciunt aperiam voluptatibus minima obcaecati? Doloribus, modi iusto. Blanditiis, magnam
                        odit quos iste assumenda pariatur amet! <br><br>                        
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias voluptates nihil eaque blanditiis
                        rem nesciunt aperiam voluptatibus minima obcaecati? Doloribus, modi iusto. Blanditiis, magnam
                        odit quos iste assumenda pariatur amet! <br><br>                        
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias voluptates nihil eaque blanditiis
                        rem nesciunt aperiam voluptatibus minima obcaecati? Doloribus, modi iusto. Blanditiis, magnam
                        odit quos iste assumenda pariatur amet! <br><br>                        
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias voluptates nihil eaque blanditiis
                        rem nesciunt aperiam voluptatibus minima obcaecati? Doloribus, modi iusto. Blanditiis, magnam
                        odit quos iste assumenda pariatur amet! <br><br>                        
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias voluptates nihil eaque blanditiis
                        rem nesciunt aperiam voluptatibus minima obcaecati? Doloribus, modi iusto. Blanditiis, magnam
                        odit quos iste assumenda pariatur amet! <br><br>                        
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias voluptates nihil eaque blanditiis
                        rem nesciunt aperiam voluptatibus minima obcaecati? Doloribus, modi iusto. Blanditiis, magnam
                        odit quos iste assumenda pariatur amet! <br><br>
                    </span>
                </div>
                <div class="resign_info_wrap">
                    <span class="resign_title">02. 탈퇴 절차</span>
                    <form class="resign_input_form" id="frm" action="user_resign_process.do" method="post">
                        <ul>
                            <li>
                                <span class="li_title">비밀번호</span>
                                <input class="input_pass" type="password" name="user_pass" id="user_pass">
                            </li>
                            <li>
                                <span class="li_title">탈퇴 사유</span>
                                <div class="li_chkbox_wrap">
                                    <span>
                                        <input type="checkbox" value="찾는 도서가 없어서" class="reason_chk" id="chk1" name="chk"><label for="chk1">찾는 도서가 없어서</label>
                                    </span>
                                    <span>
                                        <input type="checkbox" value="상품 가격 불만" class="reason_chk" id="chk2" name="chk"><label for="chk2">상품 가격 불만</label>
                                    </span>
                                    <span>
                                        <input type="checkbox" value="배송 불만" class="reason_chk" id="chk3" name="chk"><label for="chk3">배송 불만</label>
                                    </span>
                                    <span>
                                        <input type="checkbox" value="고객서비스 불만" class="reason_chk" id="chk4" name="chk"><label for="chk4">고객서비스 불만</label>
                                    </span>
                                    <span>
                                        <input type="checkbox" value="교환/환불/반품 불만" class="reason_chk" id="chk5" name="chk"><label for="chk5">교환/환불/반품 불만</label>
                                    </span>
                                </div>
                            </li>
                            <li>
                                <input type="button" class="btn_cancel btn" id="cancleBtn" value="취소">
                                <input type="button" class="btn_submit btn" id="resignBtn" value="회원 탈퇴">
                            </li>
                        </ul>
                    </form>
                </div> <!-- resign_info_wrap end -->

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