<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>책 상세페이지📕✨</title>

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
  <link rel="stylesheet" href="css/user_book_detail.css">
  <link rel="stylesheet" href="css/common_header_footer.css">

  <!-- JS -->
  <!-- header nav용 js (scroll.js) -->
<script src="js/scroll.js"></script>

<script type="text/javascript">
  
  function cart() {//장바구니
	  var con1 = confirm("장바구니로 이동하시겠습니까?");
  
	 if( con1 ){ //true : 장바구니로 이동O
		 
		 $("#redirectFlag").val("true");
		 orderBookFrm.submit();
	 
	 }else{//false : 정보는 넘기지만 장바구니로 이동X
		 
		 $("#redirectFlag").val("false");
		 orderBookFrm.submit();
		 
	 }
	
	}

  function order() {
	var con2 = confirm("결제하시겠습니까?");
	
	if(con2){
		paymentBookFrm.order_book_cnt.value	 =  orderBookFrm.order_book_cnt.value ;
		
		
		//소계
		paymentBookFrm.hidden_sub_total.value = orderBookFrm.order_book_cnt.value * paymentBookFrm.hidden_book_price.value;
		//상품총금액 
		paymentBookFrm.hidden_total_book_price.value = paymentBookFrm.hidden_sub_total.value;
		//배송비
		paymentBookFrm.hidden_shipping.value = paymentBookFrm.hidden_total_book_price.value >= 10000 ? 0 : 3000;
		//총합
		paymentBookFrm.hidden_total_price.value = paymentBookFrm.hidden_sub_total.value*1 + paymentBookFrm.hidden_shipping.value*1;
		
		 $("#cartFlag").val("pay");
		
		paymentBookFrm.submit();
	}
	
}
</script>

</head>

<body>

	<!-- header -->
	<c:import url="../common/common_header.jsp" />
	<!-- header end -->

  <!-- main section -->
  <section class="section_main">

    <!-- 제목, 저자, 출판사, 출판일 -->
    <div class="book_titles">
      <div class="title">${book_detail.book_name}</div>
      <div class="others">
        <span class="author">${book_detail.book_writer}</span>
        <span class="company">${book_detail.book_company}</span>
        <span class="pubDate">${book_detail.book_date}</span>
      </div>
    </div>
   <!-- payment.do 구매하기는 여기로... -->
 <!-- 책 제목, 금액, 갯수를 form으로 넘김 -->
     <form action="payment.do" name="paymentBookFrm" id="paymentBookFrm">
      <!-- form으로 값 넘겨주기 위한 hidden -->
      <input type="hidden" id="cartFlag" name="cartFlag"/>
      <input type="hidden" value="${book_detail.book_name}" name="hidden_book_title">
      <input type="hidden" value="${book_detail.book_price}" name="hidden_book_price" id="hidden_book_price">
      <input type="hidden" value="${book_detail.book_isbn}" name="hidden_book_isbn">
      <input type="hidden" name="book_cnt" id="order_book_cnt">
      <input type="hidden" name="hidden_total_book_price" id="hidden_total_book_price">
      <input type="hidden" name="hidden_sub_total" id="hidden_sub_total">
      <input type="hidden" name="hidden_total_price" id="hidden_total_price">
      <input type="hidden" name="hidden_shipping" id="hidden_shipping">
      </form>  
    
    <form action="set_session.do" name="orderBookFrm" id="orderBookFrm">
      <!-- form으로 값 넘겨주기 위한 hidden -->
      <input type="hidden" value="${book_detail.book_name}" name="book_name">
      <input type="hidden" value="${book_detail.book_price}" name="book_price">
      <input type="hidden" value="${book_detail.book_isbn}" name="book_isbn">
      <input type="hidden" id="redirectFlag" name="redirectFlag">

      <div class="book_info_wrap">
        <!--책 이미지 -->
        <div class="book_img">
          <img class="book_img" src="<c:out value="${book_detail.book_img}"/>">
        </div>
        <!-- 우측의 가격,배송료,수량 -->
        <ul class="book_description">
          <li>
            <span class="des_title">가격</span><span>${book_detail.book_price}</span>
          </li>
          <li>
            <span class="des_title">배송료</span><span>10,000원 이상 구매시 무료</span>
          </li>
          <li>
            <label for="book_cnt" class="des_title">수량</label><input class="input_cnt" type="number" min="1" name="order_book_cnt" id="order_book_cnt" value="1">
          </li> 
          <li>  
            <input class="btn_cart" type="button" value="장바구니 담기" id="cartBtn" name="cartBtn" onclick="cart()">
            <input class="btn_order" type="button" value="구매하기" id="orderBtn" name="orderBtn" onclick="order()"> 
          </li>
        </ul>
      </div>
    </form>

    <!-- 책 정보(소개) --> 
    <div class="book_comments">
      <div class="comment_title">책 소개</div>
      <div class="comment">
        ${book_detail.book_info}
      </div>
    </div>

    <!-- 교환 및 반품안내 -->
    <div class="return_refund">
      <div class="refund_title">교환 및 반품안내</div>
      <div class="comment">
        <ul>
          <li>고객 단순 변심일 경우 교환 비용 왕복배송비 6,000원이 부과됩니다.</li>
          <li>단순 변심에 의한 상품의 교환/반품은 수령 후 7일 이내에만 가능합니다.</li>
          <li>상품의 택 제거, 포장 개봉으로 상품의 가치가 훼손 된 경우에는 수령 후 7일 이내라도 교환/반품이 불가능합니다.</li>
          <li>일부 행사 상품은 교환/반품이 불가할 수 있습니다.</li>
          <li>상품 착용, 사용의 흔적이 있는 경우 교환/환불이 불가능합니다.</li>
        </ul>
      </div>
    </div>
  </section> <!-- main end -->

<!-- footer -->
	<c:import url="../common/common_footer.jsp" />
	<!-- footer end -->

</body>

</html>