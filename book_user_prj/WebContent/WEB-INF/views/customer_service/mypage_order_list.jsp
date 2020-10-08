<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서 목록페이지📘</title>

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
    <link rel="stylesheet" href="css/my_page_order_list.css">


    <!-- JS -->
    <script src="../js/scroll.js"></script>
</head>

<body>

	<!-- header -->
	<c:import url="../common/common_header.jsp" />
	<!-- header end -->


    <!-- main section -->
    <section class="section_main">
        <!-- 카테고리 -->
        <c:import url="my_page_category.jsp"></c:import>
        <!-- 카테고리 end -->

        <!-- 우측의 내용들 -->
        <div class="wrap_content">
            <div class="content_title">
                주문 내역 조회
            </div>
            <!-- 조회기간 선택 -->
            <div class="date_range_wrap">
                <span>조회기간</span>
                <a class="date_range" href="#void">오늘</a>
                <a class="date_range" href="#void">1개월</a>
                <a class="date_range" href="#void">3개월</a>
                <a class="date_range" href="#void">전체</a>
            </div>
            <!-- 조회된 결과 -->
            <table>
                <tr>
                    <th>날짜 / 주문번호</th>
                    <th>상품명</th>
                    <th>상품 금액</th>
                    <th>주문 상태</th>
                    <th>취소</th>
                </tr>
                <tr>
                    <td>2020.08.26 / 200826A1</td>
                    <td>Java란 무엇인가</td>
                    <td>23,000</td>
                    <td>배송 완료</td>
                    <td><span>취소불가</span></td>
                </tr>
                <tr>
                    <td>2020.08.28 / 200828A1</td>
                    <td>Spring MVC 쉽게 배우기 외 1건</td>
                    <td>53,000</td>
                    <td>배송 중</td>
                    <td><span>취소불가</span></td>
                </tr>
                <tr>
                    <td>2020.09.17 / 201917A1</td>
                    <td>어쩌고저쩌고 책제목</td>
                    <td>23,000</td>
                    <td>주문 접수</td>
                    <td><input type="button" class="cancel_btn" value="주문취소"></td>
                </tr>
            </table>
            <div class="no_result">
                <span>주문 내역이 없습니다.</span>
            </div>
        </div>
    </section> <!-- main end -->

	<!-- footer -->
	<c:import url="../common/common_footer.jsp" />
	<!-- footer end -->


</body>

</html>