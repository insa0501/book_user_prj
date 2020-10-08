<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/user_dup_id.css" />
<title>아이디 확인</title>

<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
	$(function(){
	   $("#btn").click(function(){
	      chkNull();
	   });//click
	   
	   $("[name='check_id']").keydown(function(evt){
	      if(evt.which == 13 ){
	         chkNull();
	      }//end if
	   });//keydown
	});//ready

   function chkNull(){
      if($("[name='check_id']").val().trim()==""){
         alert("중복검사에 사용할 아이디는 필수 입력입니다.");
         return;
      }//end if
      
      if($("[name='check_id']").val().replace(/[0-9A-Za-zㄱ-힣]/g, "") != ""){
         alert("아이디는 숫자, 소문자, 대문자,한글로만 이루어질 수 있습니다.");
         $("[name='id']").val("");
         return;
      }//end if
      
      $("[name='cFrm']").submit();
   }//chkNull

   function useId(id){
      opener.window.document.frm.user_id.value=id;
      self.close();
      return;
   }//useId
   

</script>
</head>
<body>
<div class="top_line"></div>

<div id="idWrap" class="id_wrap">
   <form name="cFrm" action="dup_id.do" method="get">
	   <div id="idFrm" class="id_form">
	      <label>아이디</label>
	      <input type="text" name="check_id" class="inputBox" id="check_id"/>
	      <input type="text" style="display:none"/>
	      <input type="button" value="사용" id="btn" name="btn" class="useBtn" />
	   </div>
	   <c:if test="${ DupFlag }">
   			<c:if test="${ empty user_id }">
			<div id="id_possible">
			   	<c:out value="${ check_id }"/> 아이디는 사용 가능합니다.
			   	<a href="#void" id="use" class="use_id" onclick="useId('${check_id}')">사용하기</a>
			</div>
   			</c:if>
   			<c:if test="${ not empty user_id }">
			<div id="id_warning">
			   	<c:out value="${ user_id }"/> 아이디는 중복된 아이디 입니다.
			</div>
   			</c:if>
	   </c:if>
   </form>
</div>
</body>
</html>