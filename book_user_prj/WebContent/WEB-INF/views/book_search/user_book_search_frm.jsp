<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색결과🔍</title>

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
    <link rel="stylesheet" href="css/user_search.css">

    <!-- JS -->
    <!-- header nav용 js (scroll.js) -->
    <script src="js/scroll.js"></script>
    
    <script type="text/javascript">
       function formData(flag,obj) {
        //전체,국내,국내,베스트셀러
         // if(flag == 'cate'){
             hiddenFrm.bookCate.value = document.getElementById("selectBookCate").value;
             
             if(hiddenFrm.bookCate.value == "none"){
            	 hiddenFrm.bookCate.value="";
             }
           //  alert("cate:   "+hiddenFrm.bookCate.value);
          //}
        //아동,과학,소설
          //if(flag == 'cateDetail'){
             hiddenFrm.bookCateDetail.value =  document.getElementById("selectBookCateDetail").value;
             //alert("cateDetail:  "+hiddenFrm.bookCateDetail.value);
            /*  if(hiddenFrm.bookCateDetail.value == "none"){
            	 hiddenFrm.bookCateDetail.value="";
             } */
         // }
          //가격 1,2
          //if(flag == 'price'){
             hiddenFrm.price1.value = document.getElementById("bookPrice1").value;
             hiddenFrm.price2.value = document.getElementById("bookPrice2").value;
             if(hiddenFrm.price1.value == ""){
            	 hiddenFrm.price1.value="0";
             }
             
             if(hiddenFrm.price2.value == ""){
            	 hiddenFrm.price2.value="0";
             }
             
             if(hiddenFrm.price1.value !="0" &&  hiddenFrm.price2.value =="0"){ //price1에 0외에 값이 입력되면
            	 
            	 alert("최대값을 입력해주세요.");
            	 document.cate_form.bookPrice2.focus();
            	 return;
                
             }
             
             if(hiddenFrm.price2.value !="0" &&  hiddenFrm.price1.value =="0"){ //price2에 0외에 값이 입력되면
            	 
            	 alert("최소값을 입력해주세요.");
            	 document.cate_form.bookPrice1.focus();
            	 return;
                
             }
          
                          
            // alert("price1:  "+hiddenFrm.price1.value);
            // alert("price2:  "+hiddenFrm.price2.value);
         // }
          
          //저자, 제목, 출판사
          //if(flag == 'searchType'){
             hiddenFrm.searchType.value = document.getElementById("selectSearchType").value;
            /*  if(hiddenFrm.searchType.value == "none"){
            	 hiddenFrm.searchType.value="";
             } */
            // alert("searchType:  "+hiddenFrm.searchType.value);
          //}  
          //검색키워드
         // if(flag == 'searchkeyword'){
             
             hiddenFrm.searchkeyword.value = document.getElementById("searchkeyword").value;
           ///  alert("searchkeyword:  "+hiddenFrm.searchkeyword.value);
           
           
         // }
          alert(hiddenFrm.bookCate.value+" / " +hiddenFrm.bookCateDetail.value+" / " +hiddenFrm.price1.value+" / " +hiddenFrm.price2.value+" / " +
        	" / " +  hiddenFrm.searchType.value+" / " +  hiddenFrm.searchkeyword.value  );
          hiddenFrm.submit();  
     }
       
    </script>
    
</head>
<body>

	<!-- header -->
	<c:import url="../common/common_header.jsp" />
	<!-- header end -->

<form name="hiddenFrm" action = "book_search_result.do">
    <input type="hidden" name="bookCate"> <!-- selectBookCate : 전체/국내,국외,베스트셀러 -->
    <input type="hidden" name="bookCateDetail"> <!-- selectBookCateDetail : 아동,심리, 과학   -->
    <input type="hidden" name="price1"> <!-- bookPrice1 -->
    <input type="hidden" name="price2"> <!-- bookPrice2 -->
    <input type="hidden" name="searchType"> <!-- selectSearchType -->
    <input type="hidden" name="searchkeyword"> <!-- searchkeyword -->
</form>

<!-- main section -->
<section class="section_main">
    <!-- 카테고리 -->
    <div class="main_search_option">
        <form  name="cate_form" class="search_form">
            <div class="option_title">카테고리</div>
            <select class="select_book_cate" name="selectBookCate" id="selectBookCate" onchange="formData('cate', this)">
                <option value="none">---------선택---------</option>
                <option value="all"  <c:if test="${param.bookCate == 'all'}">selected</c:if>>전체</option>
                <option value="best"  <c:if test="${param.bookCate == 'best'}">selected</c:if>>베스트셀러</option>
                <option value="kor"  <c:if test="${param.bookCate == 'kor'}">selected</c:if>>국내 도서</option>
                <option value="for"  <c:if test="${param.bookCate == 'for'}">selected</c:if>>외국 도서</option>
            </select>
            <select class="select_book_cateDetail" name="selectBookCateDetail" id="selectBookCateDetail" onchange="formData('cateDetail',this)">
                <option value="none">---------선택---------</option>
                <option value="detail_all">전체</option>
                <option value="0"  <c:if test="${param.bookCateDetail == '0'}">selected</c:if>  >과학</option><!-- 다시 페이지를 보내서 안되는건가..? -->
                <option value="1"  <c:if test="${param.bookCateDetail == '1'}">selected</c:if>  >아동</option>
                <option value="2"  <c:if test="${param.bookCateDetail == '2'}">selected</c:if>  >소설</option>
                <option value="3"  <c:if test="${param.bookCateDetail == '3'}">selected</c:if>  >여행</option>
                <option value="4"  <c:if test="${param.bookCateDetail == '4'}">selected</c:if>  >요리</option>
                <option value="5"  <c:if test="${param.bookCateDetail == '5'}">selected</c:if>  >심리</option>
            </select>
            <div class="option_title">가격</div>
            <div class="input_price_wrap">
          
                <input class="input_book_price"  id="bookPrice1" name="bookPrice1"  type="text" value="${param.price1}" >~<br>
                <input class="input_book_price" id="bookPrice2" name="bookPrice2" type="text" value="${param.price2}"  >원
                <input type="button" class="search_btn" name="search_btn1" id="search_btn1" onclick="formData('price')"  value="가격 검색" >
            
            </div>
        </form>
    </div>
    <!-- 우측에 책 있는 부분 -->
    <div class="main_content">
        <div class="main_content_title">
           	 검색
        </div>
        <!-- 입력받는 창 -->
        <div class="input_keyword_wrap">
            <form  name ="keyword_form" class="search_form">
                <select name="selectSearchType" id="selectSearchType" class="select_search_type" onchange="formData('searchType', this)" >
                    <option value="book_name"   <c:if test="${param.searchType eq 'book_name'}">selected</c:if> >책 제목</option>
                    <option value="book_writer"  <c:if test="${param.searchType eq 'book_writer'}">selected</c:if> > 저자</option>
                    <option value="book_company"  <c:if test="${param.searchType eq 'book_company'}">selected</c:if>>출판사</option>
                </select>
                <input class="input_search_keyword" id="searchkeyword" name="searchkeyword" type="text" placeholder="검색어를 입력해주세요.">
                <input type="button" class="search_btn" name="search_btn2" id="search_btn2" value="검색"  onclick="formData('searchkeyword')" >
            </form>
            
	        <!-- 검색어를 보여주는 부분 -->
	         <c:if test="${not empty param.searchkeyword}">
	           <div class="search_show_keyword"><span>'${param.searchkeyword }'</span>으로 검색한 결과입니다.</div>
	        </c:if>
	        <c:if test="${ empty param.searchkeyword }">
	        	<div class="search_show_keyword">입력된 검색어가 없습니다.</div>
	        </c:if>
        </div>
        <!-- 검색해서 나온 책 wrapper -->
        	<!-- 검색결과가 없는 경우 -->
            <c:if test="${empty search_book_result}"> 
             <!-- 검색결과가 없을 경우에는 -->
               <div class="no_result">
                 <span>검색 결과가 없습니다.</span>
             </div>  
            </c:if>  
       		 <!-- 검색결과가 있는 경우 -->
	        <div class="content_wrap_books">
	              <c:forEach  var="bd" items="${search_book_result}"> 
			            <div class="content_book">
			                    <div class="book_list">
			                     <div class="book_img"> <img class="book_img" src="images/<c:out value="${bd.book_img}"/>"> </div> 
			                     <div class="book_discription">
			                       <div class="book_title"><a href="book_detail.do?book_isbn=${bd.book_isbn}">  <c:out value='${bd.book_name}'/> </a>  </div>
			                       <div class="book_price"><c:out value="${bd.book_price}"/>원</div>  
			                     </div>
			                    </div>
			            </div>
	              </c:forEach> 
	        </div>


    </div>
</section> <!-- main end -->

<!-- footer -->
	<c:import url="../common/common_footer.jsp" />
	<!-- footer end -->

</body>

</html>