<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>💸결제하기💳</title>

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
    <link rel="stylesheet" href="css/user_book_payment.css" />

    <!-- JS -->
    <script src="js/scroll.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
    	if(${ empty sessionScope.id }){
    		alert("로그인 후에 사용가능합니다.");
    		location.href="login_form.do";
    	}
    </script>
    <script type="text/javascript">
    
    function pay() {
        var payment_final_chk = document.getElementById("payment_final_chk"); //결재하기 버튼
        var pay_frm = document.getElementById("pay_frm"); //결재 폼

        var card_no1 = document.getElementById("card_no1");
        var card_no2 = document.getElementById("card_no2");
        var card_no3 = document.getElementById("card_no3");
        var card_no4 = document.getElementById("card_no4");

        document.getElementById("order_name").value = document.getElementById(
          "user_name"
        ).value;

        console.log(card_no1);
        //카드번호를 4자리 제대로 입력했는지 확인
        if (
          card_no1.value.length !== 4 ||
          card_no2.value.length !== 4 ||
          card_no3.value.length !== 4 ||
          card_no4.value.length !== 4
        ) {
          alert("카드번호를 확인해주세요");
          return;
        }

        //필수 항목 체크됐는지 확인
        if (!payment_final_chk.checked) {
          alert("필수항목을 체크해주세요");
          return;
        }

        console.log("넘어감");
        pay_frm.submit();
      }
    
    function search_addr(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('user_zipcode').value = data.zonecode;
                document.getElementById("user_addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("user_addr2").focus();
            }
        }).open();
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
        <div class="section_title">결제하기</div>
        <ul>
          <li><span>01</span>장바구니<span class="arrow">></span></li>
          <li><span>02</span>주문서 작성/결제<span class="arrow">></span></li>
          <li><span>03</span>결제 완료</li>
        </ul>
      </div>
      <!-- title wrap -->

      <div class="cart_wrap">
        <form action="order.do" id="pay_frm" method="post">
          <!-- 결제할 물건들 목록 표 ul-->
          <ul class="cart_list_table">
            <li>
              <span>상품명</span>
              <span>가격</span>
              <span>수량</span>
              <span>소계</span>
            </li>
            <c:forEach var="book" items="${ paramValues.hidden_book_title }" varStatus="status">
            <c:set var="loop_flag" value="false" />
            <c:if test="${ empty book }">
	            <c:set var="loop_flag" value="true" />
            </c:if>
            <c:if test="${ not loop_flag }">
	            <li>
	              <span class="book_title"
	                ><c:out value="${ book }"/></span
	              >
	              <span class="book_price"><c:out value="${ paramValues.hidden_book_price[status.index] }"/> 원</span>
	              <!-- <span><input type="number" class="book_cnt" value="1" /></span> -->
	              <span class="book_cnt"><c:out value="${ paramValues.book_cnt[status.index] }"/></span>
	              <span class="book_price2"><c:out value="${ paramValues.hidden_sub_total[status.index] }"/> 원</span>
	              
	              <input type="hidden" name="book_isbn" value="${ paramValues.hidden_book_isbn[status.index] }"/>
	              <input type="hidden" name="book_title" value="${ book }"/>
	              <input type="hidden" name="order_book_cnt" value="${ paramValues.book_cnt[status.index] }"/>
	              <input type="hidden" name="book_price" value="${ paramValues.hidden_book_price[status.index] }"/>
	              <input type="hidden" name="book_price2" value="${ paramValues.hidden_sub_total[status.index] }"/>
	            </li>
            </c:if>
            </c:forEach>
            <!-- <li>
              <span class="book_title">책책췍</span>
              <span class="book_price">15,000 원</span>
              <span><input type="number" class="book_cnt" value="1" /></span>
              <span class="book_price2">15,000 원</span>
            </li> -->
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
              <span><c:out value="${ param.hidden_total_price }"/> 원</span>
            </div>
            <input type="hidden" name="hidden_total_book_price" value="${ param.hidden_total_book_price }"/>
            <input type="hidden" name="hidden_shipping" value="${ param.hidden_shipping }"/>
            <input type="hidden" name="order_price" value="${ param.hidden_total_price }"/>
          </div>
          <!-- 계산하는 부분 end-->

          <!-- 배송지정보, 결제정보, 결제방법 -->
          <div class="address_pay_wrap">
            <!-- 배송지 정보 -->
            <div class="table_title">배송지정보</div>
            <ul>
              <li>
                <span>받으시는 분</span>
                <span
                  ><input type="text" class="input_text" name="user_name" id="user_name" value="${ user_info.user_name }"
                />
                <input type="hidden" name="order_name" id="order_name" /></span>
              </li>
              <li>
                <span>주소</span>
                <span class="addr_wrap">
                  <input type="text" class="input_text zipcode" name="order_zipcode" id="user_zipcode" value="${ user_info.user_zipcode }" />
                  <input
                    type="button"
                    class="input_text"
                    value="우편번호 검색"
                    onclick="search_addr()"
                  />
                  <input
                    type="text"
                    class="input_text addr1"
                    name="order_addr1"
                    id="user_addr1"
                    value="${ user_info.user_addr1 }"
                  />
                  <input
                    type="text"
                    class="input_text addr2"
                    name="order_addr2"
                    id="user_addr2"
                    value="${ user_info.user_addr2 }"
                  />
                </span>
              </li>
              <li>
                <span>핸드폰 번호</span>
                <span
                  ><input type="text" class="input_text" name="order_phone" value="${ user_info.user_phone }"
                /></span>
              </li>
            </ul>
            <!-- 결제 정보 -->
            <div class="table_title">결제 정보</div>
            <ul>
              <li>
                <span>상품 합계 금액</span>
                <span><c:out value="${ param.hidden_total_book_price }"/> 원</span>
              </li>
              <li>
                <span>배송비</span>
                <span><c:out value="${ param.hidden_shipping }"/> 원</span>
              </li>
              <li>
                <span>최종 결제 금액</span>
                <span><c:out value="${ param.hidden_total_price }"/> 원</span>
              </li>
            </ul>
            <!-- 결제 방법 -->
            <div class="table_title">결제 방법</div>
            <ul class="payment_method">
              <li>
                <span>카드사</span>
                <span>
                  <select class="input_text" name="card_company">
                    <option>신한</option>
                    <option>BC</option>
                    <option>현대</option>
                    <option>롯데</option>
                    <option>삼성</option>
                  </select>
                </span>
              </li>
              <li>
                <span>카드번호</span>
                <span>
                  <input
                    type="text"
                    class="input_text"
                    name="card_no1"
                    id="card_no1"
                    onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
                  />
                  <input
                    type="text"
                    class="input_text"
                    name="card_no2"
                    id="card_no2"
                    onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
                  />
                  <input
                    type="text"
                    class="input_text"
                    name="card_no3"
                    id="card_no3"
                    onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
                  />
                  <input
                    type="text"
                    class="input_text"
                    name="card_no4"
                    id="card_no4"
                    onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
                  />
                </span>
              </li>
              <li>
                <span>유효기간</span>
                <span>
                  <select class="input_text" name="card_exp_date1">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
                    <option>11</option>
                    <option>12</option>
                  </select>
                  <select class="input_text" name="card_exp_date2" id="card_exp_date2">
                    <option>20</option>
                    <option>21</option>
                    <option>22</option>
                    <option>23</option>
                    <option>24</option>
                    <option>25</option>
                    <option>26</option>
<!--                     <option>2020</option>
                    <option>2021</option>
                    <option>2022</option>
                    <option>2023</option>
                    <option>2024</option>
                    <option>2025</option>
                    <option>2026</option> -->
                  </select>
                </span>
              </li>
            </ul>
          </div>
          <!-- address_pay_wrap end -->
          <div class="chk_wrap">
            <div>
              <input type="checkbox" id="payment_final_chk" />
              <label for="payment_final_chk"
                >(필수)구매하실 상품의 결제정보를 확인하였으며, 구매진행에
                동의합니다.</label
              >
            </div>
            <input type="button" class="btn_pay_submit" value="결제하기" onclick="pay()" />
          </div>
        </form>
      </div>
    </section>
    <!-- main end -->

    <!-- footer -->
    <section class="footer">
      <div class="footer_text">
        @copyright 2조 <br />
        Lorem ipsum dolor sit amet consectetur adipisicing elit.<br />
        Necessitatibus tenetur temporibus, enim nostrum soluta deleniti? <br />
        Veritatis maiores consequuntur magni
      </div>

      <div class="go_to_top">
        <a href=".section_header"><i class="fas fa-angle-up"></i></a>
      </div>
    </section>
  </body>
</html>
