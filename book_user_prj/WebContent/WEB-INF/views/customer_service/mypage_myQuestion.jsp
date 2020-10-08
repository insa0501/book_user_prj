<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🙏나의 문의 내역🙌</title>

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
    <link rel="stylesheet" href="css/my_page_myQuestion.css">


      <!-- JS -->
    <script src="js/scroll.js"></script>
   <script src="js/my_Question_board.js"></script>
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
                나의 문의 내역
            </div>

            <div class="faq_wrap">
                <div class="ques th">
                    <span>번호</span>
                    <span>분류</span>
                    <span>제목</span>
                </div>
                
               <!-- 번호, 분류, 제목 -->
                <c:forEach var="qs" items="${ qna_select }">
               	<div class="ques" id="q_${qs.qna_no}">
                 <div class="ques" id="q_${qs.qna_no}">
	                  <span><c:out value="${qs.qna_no}"/></span>
	                  <span><c:out value="${qs.qna_type}"/></span>
	                  <span><c:out value="${qs.qna_subject}"/></span>
                 </div>
              	</div>
              	
              
                 <!-- 내용 -->
                  <div class="ques_content hidden" id="q_${qs.qna_no}_con">
		              
		              <span><c:out value="${qs.qna_content}"/></span><br/>
                 
                  </div>
                
	            <!-- 답변 -->     
               <div class="ans hidden" id="q_${qs.qna_no}_a">
                    <span><i class="fas fa-arrow-right"></i></span>
                    <span>
                    
		                   <span><c:if test="${empty qs.qna_answer}">관리자가 확인중입니다. 조금만 더 기다려주시길 바랍니다.</c:if></span>
		                   <span><c:if test="${not empty qs.qna_answer}"><c:out value="${qs.qna_answer}"/></c:if></span>
                    </span>
                </div>
               </c:forEach>
                
	           
                
               
                <div class="ques_content hidden" id="q_01_con">
			                    내가쓴질문내용인데요
			                    내가쓴질문내용인데요
			                    내가쓴질문내용인데요
			                    내가쓴질문내용인데요
			                    내가쓴질문내용인데요
			                    내가쓴질문내용인데요
			                    내가쓴질문내용인데요
                </div>
                <div class="ans hidden" id="q_01_a">
                    <span><i class="fas fa-arrow-right"></i></span>
                    <span>
			                        답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변
			                        답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변
                    </span>
                </div>   

                <div class="ques" id="q_02">
                    <span>2</span>
                    <span>배송</span>
                    <span>내가쓴 질문 제목22 제목22  </span>
                </div>
                <div class="ques_content hidden" id="q_02_con">
			                    내가쓴질문내용인데요
			                    내가쓴질문내용인데요
			                    내가쓴질문내용인데요
			                    내가쓴질문내용인데요
			                    내가쓴질문내용인데요
			                    내가쓴질문내용인데요
			                    내가쓴질문내용인데요
                </div>
                <div class="ans hidden"  id="q_02_a">
                    <span><i class="fas fa-arrow-right"></i></span>
                    <span>
                        답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변
                        답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변답변
                    </span>
                </div>
                <div class="ques" id="q_03">
                    <span>3</span>
                    <span>배송</span>
                    <span>주문완료 후 배송지 변경 가능합니까?</span>
                </div>
                <div class="ques_content hidden" id="q_03_con">
                    내가쓴질문내용인데요
                    내가쓴질문내용인데요
                    내가쓴질문내용인데요
                    내가쓴질문내용인데요
                    내가쓴질문내용인데요
                    내가쓴질문내용인데요
                    내가쓴질문내용인데요
                </div>
                <div class="ans hidden" id="q_03_a">
                    <span><i class="fas fa-arrow-right"></i></span>
                    <span>
                        관리자가 확인중입니다. 조금만 더 기다려주시길 바랍니다. (디비에 답변이 등록되지 않은 경우)
                    </span>
                </div>    
            </div> <!-- faq wrap -->
            
           <form action="qna_add_form.do"> 
	            <div class="btn_wrap">
	                <input type="submit" value="문의 작성하기" >
	            </div>
            </form>

        </div> <!-- div main content -->
    </section> <!-- main end -->

 
	<!-- footer -->
	<c:import url="../common/common_footer.jsp" />
	<!-- footer end -->


</body>

</html>