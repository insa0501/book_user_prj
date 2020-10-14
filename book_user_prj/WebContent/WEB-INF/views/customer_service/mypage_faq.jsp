<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>❓자주하는 질문❓</title>

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
    <link rel="stylesheet" href="css/my_page_faq.css">
    <link rel="stylesheet" href="css/mypage_category.css">


    <!-- JS -->
    <script src="js/scroll.js"></script>
    <script src="js/faq_board.js"></script>
    <script src="js/faq_search.js"></script>
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
                <div>자주하는 질문</div>
                <span>
                    <select class="faq_cate_select" id="faq_cate_select">
                        <option value="전체">전체</option>
                        <option value="상품정보">상품정보</option>
                        <option value="배송">배송</option>
                        <option value="서비스">서비스</option>
                        <option value="반품/교환">반품/교환</option>
                    </select>
                    <input type="text" id="input_text" class="input_text">
                    <input type="button" id="btn_submit" class="btn_submit" value="검색">
                </span>
            </div>

            <div class="faq_wrap">
                <div class="ques th">
                    <span>번호</span>
                    <span>분류</span>
                    <span>제목</span>
                </div>
                <div class="ques" id="q_01">
                    <span>1</span>
                    <span class="ques_cate">상품정보</span>
                    <span class="ques_title">품절, 절판 상품은 구입할 수 없나요?</span>
                </div>
                <div class="ans hidden" id="q_01_a">
                    품절, 절판 상품은 고객센터로 전화 주시면 유통망에 혹시라도 남아있을 종이책 재고를 찾아드립니다.
                    하지만 이는 100% 구매 가능함을 보증하지는 않습니다.
                </div>
                <div class="ques" id="q_02">
                    <span>2</span>
                    <span class="ques_cate">배송</span>
                    <span class="ques_title">주문한지 2-3일이 지났으나 택배가 오지 않습니다.</span>
                </div>
                <div class="ans hidden"  id="q_02_a">
                    출고완료 후 통상 1-2일 내에는 배송이 됩니다만, 
                    배송 물량이 급증하거나 해당 지역의 배송 상황에 다른 문제가 있다면 예정일 보다 지연될 수 있습니다.
                    배송상태 확인은 마이페이지 > 나의 문의 내역 > 문의 작성에 문의 글을 작성해주시면 신속히 확인 후 답변드리겠습니다.
                </div>
                <div class="ques" id="q_03">
                    <span>3</span>
                    <span class="ques_cate">배송</span>
                    <span class="ques_title">출고일/배송일을 지정할 수 있습니까?</span>
                </div>
                <div class="ans hidden" id="q_03_a">
                    수령예상일 보다 일찍 배송해드리거나, 원하시는 시간대에 맞춰 배송, 혹은 배송업체 휴무일(일요일/공휴일 등) 배송은 어렵습니다.
                </div>
                <div class="ques" id="q_04">
                    <span>4</span>
                    <span class="ques_cate">서비스</span>
                    <span class="ques_title">고객센터 영업시간은 몇 시 부터 몇 시 까지 입니까?</span>
                </div>
                <div class="ans hidden" id="q_04_a">
                    평일 9시부터 18시까지 입니다. (점심시간 13시~14시)
                </div>
                <div class="ques" id="q_05">
                    <span>5</span>
                    <span class="ques_cate">반품/교환</span>
                    <span class="ques_title">반품할 수 있나요?</span>
                </div>
                <div class="ans hidden" id="q_05_a">
                    온라인 구입 상품이 원하시던 것이 아니라면, 받으신 날짜로부터 7일내에는 반품하실수 있습니다.
                    마이페이지 > 나의 문의 내역 > 문의 작성에 문의 글을 작성해주시면 신속히 확인 후 답변드리겠습니다.
                </div>
                <div class="ques" id="q_06">
                    <span>6</span>
                    <span class="ques_cate">반품/교환</span>
                    <span class="ques_title">교환할 수 있나요?</span>
                </div>
                <div class="ans hidden" id="q_06_a">
                    다른 상품으로의 교환은 불가합니다. 반품 후, 원하시는 상품은 반품 신청과 무관하게 별도로 부탁드립니다. 
                </div>
                
            </div>
        </div>
    </section> <!-- main end -->

	<!-- footer -->
	<c:import url="../common/common_footer.jsp" />
	<!-- footer end -->


</body>

</html>