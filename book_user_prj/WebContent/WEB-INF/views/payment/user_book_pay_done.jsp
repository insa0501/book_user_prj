<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>💸결제완료</title>

    <!-- bootstrap etc -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
    />

    <script
      src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
      integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
      integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>
    <!-- css -->
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/common_header_footer.css" />
    <link rel="stylesheet" href="css/user_book_pay_done.css" />

    <!-- JS -->
    <script src="js/scroll.js"></script>
  </head>

  <body>
   	<!-- header -->
	<c:import url="../common/common_header.jsp" />
	<!-- header end -->

    <!-- main section -->
    <section class="section_main">
      <!-- 회원가입 제목, 우측의 단계 -->
      <div class="title_wrap">
        <div class="section_title">주문 완료</div>
        <ul>
          <li><span>01</span>장바구니<span class="arrow">></span></li>
          <li><span>02</span>주문서 작성/결제<span class="arrow">></span></li>
          <li><span>03</span>결제 완료</li>
        </ul>
      </div>
      <!-- title wrap -->
      <div class="title_wrap2">
        <span> 주문번호 : <c:out value="${ order_no }"/> </span>
        <br />
        구매해주셔서 감사합니다.
      </div>

      <div class="cart_wrap">
        <form action="#void">
          <!-- 결제할 물건들 목록 표 ul-->
          <ul class="cart_list_table">
            <li>
              <span>상품명</span>
              <span>가격</span>
              <span>수량</span>
              <span>소계</span>
            </li>
            <c:forEach var="book" items="${ paramValues.book_title }" varStatus="status">
            
	            <li>
	              <span class="book_title"
	                ><c:out value="${ book }"/></span
	              >
	              <span class="book_price"><c:out value="${ paramValues.book_price[status.index] }"/> 원</span>
	              <span><c:out value="${ paramValues.order_book_cnt[status.index] }"/></span>
	              <span class="book_price2"><c:out value="${ paramValues.book_price2[status.index] }"/> 원</span>
	            </li>
            </c:forEach>
          </ul>

          <!-- 현재금액+배송비=총금액 -->
           <div class="cart_total_wrap">
                    <div>
                        <span>합계</span>
                        <span><c:out value="${ param.hidden_total_book_price }"/> 원</span>
                    </div>
                    <div><i class="fas fa-plus"></i></div>
                    <div>
                        <span>배송료</span>
                        <span><c:out value="${ param.hidden_shipping }"/> 원</span>
                    </div>
                    <div><i class="fas fa-equals"></i></div>
                    <div>
                        <span>최종 결제 금액</span>
                        <span><c:out value="${ param.order_price }"/> 원</span>
                    </div>
                </div>  

          <!-- 배송지정보, 결제정보, 결제방법 -->
          <div class="address_pay_wrap">
            <!-- 배송지 정보 -->
            <div class="table_title">배송지정보</div>
            <ul>
              <li>
                <div>받으시는 분</div>
                <div><c:out value="${ param.order_name }"/></div>
              </li>
              <li>
                <div>주소</div>
                <div class="addr_wrap">
                  <span><c:out value="${ param.order_zipcode }"/></span>
                  <span><c:out value="${ param.order_addr1 }"/></span>
                  <span><c:out value="${ param.order_addr2 }"/></span>
                </div>
              </li>
              <li>
                <div>핸드폰 번호</div>
                <div><c:out value="${ param.order_phone }"/></div>
              </li>
            </ul>
            <!-- 결제 정보 -->
            <div class="table_title">결제 정보</div>
            <ul>
              <li>
                <div>상품 합계 금액</div>
                <div><c:out value="${ param.hidden_total_book_price }"/> 원</div>
              </li>
              <li>
                <div>배송비</div>
                <div><c:out value="${ param.hidden_shipping }"/> 원</div>
              </li>
              <li>
                <div>최종 결제 금액</div>
                <div><c:out value="${ param.order_price }"/> 원</div>
              </li>
            </ul>
            <!-- 결제 방법 -->
            <div class="table_title">결제 방법</div>
            <ul>
              <li>
                <div>카드사</div>
                <div>
                  <span><c:out value="${ param.card_company }"/></span>
                </div>
              </li>
              <li>
                <div>카드번호</div>
                <div>
                  <span><c:out value="${ param.card_no1 }"/>-****-****-<c:out value="${ param.card_no4 }"/></span>
                </div>
              </li>
              <li>
                <div>유효기간</div>
                <div>
                  <span><c:out value="${ param.card_exp_date1 }"/>/<c:out value="${ param.card_exp_date2 }"/></span>
                </div>
              </li>
            </ul>
          </div>
          <!-- address_pay_wrap end -->
          <div class="chk_wrap">
            <input type="button" class="btn_pay_submit" value="확인" onclick="javascrpt:location.href='book.do'" />
          </div>
        </form>
      </div>
    </section>
    <!-- main end -->

	<!-- footer -->
	<c:import url="../common/common_footer.jsp" />
	<!-- footer end -->

  </body>
</html>
