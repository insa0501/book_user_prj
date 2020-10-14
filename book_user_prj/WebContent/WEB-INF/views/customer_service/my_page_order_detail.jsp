<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지-주문내역상세조회</title>

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
    <link rel="stylesheet" href="css/my_page_order_detail.css">
    <link rel="stylesheet" href="css/mypage_category.css">


    <!-- JS -->
    <script src="js/scroll.js"></script>
             <!-- Google CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		<c:if test="${ empty sessionScope.id }">
		location.replace("main_index.do");
		return;
		</c:if>
	});//ready
	
	function back() {
		history.back();
	}//return
</script>
</head>

<body>

	<!-- header -->
	<c:import url="../common/common_header.jsp" />
	<!-- header end -->


    <!-- main section -->
    <section class="section_main">
        <!-- 제목-->
        <div class="title_wrap">
            <div class="section_title">주문내역 상세보기</div>
        </div>
        <div class="order_num">
            주문번호 : <c:out value="${ param.order_no }"/>
        </div>

        <div class="bought_prod">
            <!-- 구매한 물건 ul-->
            <div class="table_title">구매한 도서 정보</div>
            <ul class="cart_list_table">
                <li>
                    <span>상품명</span>
                    <span>가격</span>
                    <span>수량</span>
                    <span>소계</span>
                </li>
                <c:forEach var="book" items="${ order_data.orderBookList }">
                <li>
                    <span class="book_title"><c:out value="${ book.book_name }"/></span>
                    <span class="book_price"><c:out value="${ book.book_price }"/>원</span>
                    <span><c:out value="${ book.order_book_cnt }"/></span>
                    <span class="book_price2"><c:out value="${ book.total_price }"/>원</span>
                </li>
                </c:forEach>
            </ul>

            <!-- 배송지정보, 결제정보, 결제방법 -->
            <div class="address_pay_wrap">
                <!-- 배송지 정보 -->
                <div class="table_title">배송지정보</div>
                <ul>
                    <li>
                        <div>받으시는 분</div>
                        <div><c:out value="${ order_data.order_name }"/></div>
                    </li>
                    <li>
                        <div>주소</div>
                        <div class="addr_wrap">
                            <span><c:out value="${ order_data.order_zipcode }"/></span>
                            <span><c:out value="${ order_data.order_addr1 }"/></span>
                            <span><c:out value="${ order_data.order_addr2 }"/></span>
                        </div>
                    </li>
                    <li>
                        <div>핸드폰 번호</div>
                        <div><c:out value="${ order_data.order_phone }"/></div>
                    </li>
                </ul>
                <!-- 결제 정보 -->
                <div class="table_title">결제 정보</div>
                <ul>
                    <li>
                        <div>상품 합계 금액</div>
                        <div><c:out value="${ order_data.order_price }"/>원</div>
                    </li>
                    <li>
                        <div>배송비</div>
                        <div>0,000원</div>
                    </li>
                    <li>
                        <div>최종 결제 금액</div>
                        <div><c:out value="${ order_data.order_price }"/>원</div>
                    </li>
                    <li>
                        <div>결제방법</div>
                        <div><c:out value="${ order_data.card_company }카드
                        (${ order_data.card_no1 }-****-****-${ order_data.card_no4 })"/></div>
                    </li>
                </ul>
            </div> <!-- address_pay_wrap end -->
            <div class="chk_wrap">
                <input type="button" class="btn_close" value="돌아가기" onclick="back()">                        
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