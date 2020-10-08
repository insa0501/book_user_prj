<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>✏문의 작성하기✏</title>

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
    <link rel="stylesheet" href="css/my_page_write_question.css">


    <!-- JS -->
    <script src="../js/scroll.js"></script>
    <script src="../js/my_Question_board.js"></script>
    
    <script type="text/javascript">
    
          function cancelBtn() { //취소 버튼 클릭시 1 대 1 문의 리스트로 돌아가기
        	var con =  confirm("작성을 취소하시겠습니까?");
			
	          if(con == true){
	        	  
	         	 window.history.back();
	          } 
		   }//cancelBtn
    
          function insertBtn() {//작성 버튼 클릭시
        	  
        	  if(qnainsertFrm.qna_subject.value == "" ){
        		  alert("제목을 입력하세요.");
        		  document.qnainsertFrm.qna_subject.focus();
        		  return;
        	  }
          
        	  if(qnainsertFrm.qna_content.value == ""){
        		  alert("내용을 입력하세요.");
        		  document.qnainsertFrm.qna_content.focus();
        		  return;
        	  }
          
        	 	var con =  confirm("입력하신 정보로 1대 1문의를 등록하시겠습니까?");
    			
                if(con == true){
              	  
                	qnainsertFrm.submit();
              	  
                }   
        	  
		  }//insertBtn
          
          
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
        <div class="main_content">
            <div class="content_title">
                문의 작성하기
            </div>
            <form action="qna_add.do" name="qnainsertFrm" id="qnainsertFrm">
                <ul>
                    <li>
                        <span class="form_title">본문</span>
                        <select name="qna_type" class="input_select" id="qna_type">
                            <option value="도서">도서</option>
                            <option value="회원정보">회원정보</option>
                            <option value="결제">결제</option>
                          <!--   <option value="op4">옵션4</option>
                            <option value="op5">옵션5</option> -->
                        </select>
                    </li>
                    <li>
                        <span class="form_title">제목</span>
                        <input type="text" id="qna_subject" name="qna_subject" class="input_title" placeholder="제목을 작성해주세요">
                    </li>
                    <li>
                        <span class="form_title">내용</span>
                        <textarea name="qna_content" id="qna_content" cols="30" rows="10"></textarea>
                    </li>
                    <li>
                        <input type="button" class="btn_cancel" value="취소하기" onclick="cancelBtn()">
                        <input type="button" class="btn_submit" value="작성하기" onclick="insertBtn()">
                    </li>
                </ul>
            </form>

        </div>
    </section> <!-- main end -->

	<!-- footer -->
	<c:import url="../common/common_footer.jsp" />
	<!-- footer end -->


</body>

</html>