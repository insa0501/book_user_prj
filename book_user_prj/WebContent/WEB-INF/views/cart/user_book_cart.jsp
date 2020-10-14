<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>💖장바구니</title>

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
    <link rel="stylesheet" href="css/user_book_cart.css">


    <!-- JS -->
    <script src="js/scroll.js"></script>
    
<script type="text/javascript">
      window.onload = function () {
        cal_price();
      };

       function remove_book(){
		var book_isbn = document.getElementsByName("book_chk");
		var cart_list = document.getElementById("cart_list");
		var hidden_book_isbn = document.getElementsByName("hidden_book_isbn");
        cart_list.action = "remove_session.do";
		
		
		for(var ind = 0; ind < book_isbn.length; ind++){
			if(book_isbn[ind].checked){
				hidden_book_isbn[ind].value = book_isbn[ind].value;
				console.log("선택된 책 isbn ===> "+book_isbn[ind].value);
			}
		}
		
		cart_list.submit();
      } 
      
      
      function cal_price() {
        var book_chk = document.getElementsByName("book_chk");
        var cart_book = document.getElementsByName("cart_book");
        var book_cnt = document.getElementsByName("book_cnt");
        var book_price = document.getElementsByName("book_price");
        var total_book_price = 0;
        var shipping_price = 10000;

        for (var cart_ind = 0; cart_ind < cart_book.length; cart_ind++) {
          console.log(book_chk[cart_ind].value);


          //책수량이 0이 되면 경고창을 띄워줌
          if (book_cnt[cart_ind].value < 1) {
            alert("1개 이상부터 구매하실 수 있습니다.");
            book_cnt[cart_ind].value = 1;
          }

          //소계
          var sub_total =
            book_cnt[cart_ind].value * parseInt(book_price[cart_ind].innerText);

          //console.log("소계 " + sub_total);

          document.getElementsByName("sub_total")[
            cart_ind
          ].innerText = sub_total;

          if (book_chk[cart_ind].checked) {
            //책만 합한 값
            total_book_price += sub_total;

          }
            //배송비
            shipping_price = (total_book_price >= 10000) ? 0 : 3000;
            document.getElementById(
              "total_book_price"
            ).innerText = total_book_price;
            document.getElementById(
              "shipping_price"
            ).innerText = shipping_price;
            //결재금액
            document.getElementById("total_order_price").innerText = (
              total_book_price + shipping_price
            );
        }
      }

      function order(id) {
        var cart_list = document.getElementById("cart_list");
        cart_list.action = "payment.do";
        console.log(cart_list.action);

        var book_chk = document.getElementsByName("book_chk");
        var cart_book = document.getElementsByName("cart_book");

		var book_isbn = document.getElementsByName("book_chk");
        var book_title = document.getElementsByClassName("book_title");
        var book_price = document.getElementsByName("book_price");
        var book_cnt = document.getElementsByName("book_cnt");

        var sub_total = document.getElementsByName("sub_total");

        var hidden_book_isbn = document.getElementsByName("hidden_book_isbn");
        var hidden_book_title = document.getElementsByName("hidden_book_title");
        var hidden_book_price = document.getElementsByName("hidden_book_price");
        var hidden_book_cnt = document.getElementsByName("hidden_book_cnt");
        var hidden_sub_total = document.getElementsByName("hidden_sub_total");
        
        var hidden_total_book_price = document.getElementsByName("hidden_total_book_price");
        var hidden_shipping = document.getElementsByName("hidden_shipping");
        var hidden_total_price = document.getElementsByName("hidden_total_price");
        //console.log(hidden_book_title);
        //console.log(book_chk);

        // if (book_chk.checked.length == 0) {
        //   alert("선택된 상품이 없습니다.");
        //   return;
        // }

        var chk_flag = 0;
        for (var cart_ind = 0; cart_ind < cart_book.length; cart_ind++) {
          if (book_chk[cart_ind].checked) {
            chk_flag++;
          }
        }
        if (chk_flag == 0) {
          console.log(chk_flag);
          alert("선택된 상품이 없습니다.");
          return;
        }

        var price = 0;
        var shipping = 0;
        for (var cart_ind = 0; cart_ind < cart_book.length; cart_ind++) {
          hidden_book_title[cart_ind].value = "";
          hidden_book_price[cart_ind].value = "";
          hidden_book_cnt[cart_ind].value = "";
          hidden_sub_total[cart_ind].value = "";

          if (id == "order_selected") {
            console.log("선택만--------------------");
            if (book_chk[cart_ind].checked) {
              chk_flag++;
              console.log(chk_flag);

              hidden_book_isbn[cart_ind].value = book_isbn[cart_ind].value;
              hidden_book_title[cart_ind].value = book_title[cart_ind].innerText;
              hidden_book_price[cart_ind].value = book_price[cart_ind].innerText;
              hidden_book_cnt[cart_ind].value = book_cnt[cart_ind].value;
              hidden_sub_total[cart_ind].value = sub_total[cart_ind].innerText;

            } //end if
	        hidden_total_book_price[0].value = total_book_price.innerText;
	        hidden_shipping[0].value = shipping_price.innerText;
	        hidden_total_price[0].value = total_order_price.innerText;
          } //end if

          if (id == "order_all") {
            console.log("전체");

            hidden_book_isbn[cart_ind].value = book_isbn[cart_ind].value;
            hidden_book_title[cart_ind].value = book_title[cart_ind].innerText;
            hidden_book_price[cart_ind].value = book_price[cart_ind].innerText;
            hidden_book_cnt[cart_ind].value = book_cnt[cart_ind].value;
            hidden_sub_total[cart_ind].value = sub_total[cart_ind].innerText;

            price += sub_total[cart_ind].innerText*1;
            shipping = price < 10000 ? 3000 : 0;
            
            
            
            hidden_total_book_price[0].value = price;
	        hidden_shipping[0].value = shipping;
	        hidden_total_price[0].value = price + shipping;
          }
        }


        cart_list.submit();
      }
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
            <div class="section_title">장바구니</div>
            <ul>
                <li><span>01</span>장바구니<span class="arrow">></span></li>
                <li><span>02</span>주문서 작성/결제<span class="arrow">></span></li>
                <li><span>03</span>결제 완료</li>
            </ul>
        </div> <!-- title wrap -->

        <div class="cart_wrap">

        <form action="" id="cart_list">
          <!-- 카트에 들어가는 물건들 -->
          <ul>
            <li>
              <span></span>
              <span>상품명</span>
              <span>가격</span>
              <span>수량</span>
              <span>소계</span>
            </li>
          <c:if test="${ empty cart }">
        		<li>장바구니가 비어있어요</li>
          </c:if>
          <c:forEach var="cl" items="${ cart }">
            <li name="cart_book">
              <span
                ><input
                  type="checkbox"
                  id="chkbox1"
                  checked="checked"
                  class="book_chk"
                  name="book_chk"
                  value="${ cl.book_isbn }"
                  onchange="cal_price()"
              /></span>
              <span class="book_title"
                ><c:out value="${ cl.book_name }"/></span
              >
              <span class="book_price"
                ><span name="book_price"><c:out value="${ cl.book_price }"/></span> 원</span
              >
              <span
                ><input
                  type="number"
                  class="book_cnt"
                  name="book_cnt"
                  value="<c:out value="${ cl.order_book_cnt }"/>"
                  onchange="cal_price()"
              /></span>
              <span class="book_price2"
                ><span name="sub_total"></span> 원</span
              >
              <input type="hidden" name="hidden_book_isbn" />
              <input type="hidden" name="hidden_book_title" />
              <input type="hidden" name="hidden_book_price" />
              <input type="hidden" name="hidden_book_cnt" />
              <input type="hidden" name="hidden_sub_total" />
            </li>
         </c:forEach>

          </ul>
          <!-- 현재금액+배송비=총금액 -->
          <div class="cart_total_wrap">
            <div>
              <span>합계</span
              ><span><span id="total_book_price">0</span> 원</span>
            </div>
            <div><i class="fas fa-plus"></i></div>
            <div>
              <span>배송료</span>
              <span><span id="shipping_price">0</span> 원</span>
            </div>
            <div><i class="fas fa-equals"></i></div>
            <div>
              <span>최종 결제 금액</span>
              <span><span id="total_order_price">0</span> 원</span>
            </div>
            <input type="hidden" name="hidden_total_book_price" />
            <input type="hidden" name="hidden_shipping" />
            <input type="hidden" name="hidden_total_price" />
          </div> 
          <!-- 계산하는 부분 end-->

          <div class="btn_wrap">
            <input
              type="button"
              value="선택상품 삭제하기"
              class="btn_gray"
              id="delete_selected"
              onclick="remove_book()"
            />
            <input
              type="button"
              value="선택상품 주문하기"
              class="btn_gray"
              id="order_selected"
              onclick="order(id)"
            />
            <input
              type="button"
              value="전체상품 주문하기"
              class="btn_blk"
              id="order_all"
              onclick="order(id)"
            />
          </div>
        </form>
        </div>
    </section> <!-- main end -->

	<!-- footer -->
	<c:import url="../common/common_footer.jsp" />
	<!-- footer end -->

</body>
</html>