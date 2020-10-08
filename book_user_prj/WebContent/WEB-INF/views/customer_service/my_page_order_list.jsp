<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

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
    <script src="js/scroll.js"></script>
         <!-- Google CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		<c:if test="${ empty sessionScope.id }">
	    location.replace("book.do");
	    </c:if>
	    
	    <c:if test="${ remove_flag }">
	    alert("주문이 삭제되었습니다.")
	    </c:if>
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
                주문 내역 조회
            </div>
            <!-- 조회기간 선택 -->
            <div class="date_range_wrap">
                <span>조회기간</span>
                <a class="date_range" href="order_list.do?term=0">오늘</a>
                <a class="date_range" href="order_list.do?term=1">1개월</a>
                <a class="date_range" href="order_list.do?term=2">3개월</a>
                <a class="date_range" href="order_list.do">전체</a>
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
                <c:if test="${ empty order_list }">
                <tr>
                	<td colspan="5" align="center">주문 내역이 없습니다.</td>
                </tr>
                </c:if>
                <c:if test="${ not empty order_list }">
                <c:forEach var="list" items="${ order_list }">
                <tr>
                    <td><c:out value="${ list.order_date }"/> / <c:out value="${ list.order_no }"/></td>
                    <td>
                    	<a href="order_detail.do?order_no=${ list.order_no }">
                    	<c:out value="${ list.list.get(0).book_name } - ${ list.list.get(0).order_book_cnt }권"/>
                    	<c:if test="${ list.list.size() ne 1 }">
               			, 외 <c:out value="${ list.list.size()-1 }권"/>
                    	</c:if>
                    	</a>
                    </td>
                    <td><c:out value="${ list.order_price }"/>원</td>
                    
                   	<c:if test="${ list.order_status eq 0 }">
                   	<td>주문 접수</td>
                    <td><span><a href="order_remove.do?order_no=${ list.order_no }"><input type="button" class="cancel_btn" value="주문취소"></a></span></td>
                   	</c:if>
                   	
                    <c:if test="${ list.order_status eq 1 }">
                    <td>배송중</td>
                    <td><span>취소불가</span></td>
                    </c:if>
                    
                    <c:if test="${ list.order_status eq 2 }">
					<td>배송 완료</td>
                    <td><span>취소불가</span></td>
                    </c:if>
                </tr>
                </c:forEach>
                </c:if>
            </table>
        <div style="margin: 0px auto;">
        ${ page_nation }
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