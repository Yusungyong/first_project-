<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Tranning</title>
 
<link href="/css/exam.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script type="text/javascript"></script>

</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>카테고리 그룹 > ${mainVO.main_name } 조회(수정)</DIV>
<DIV class='content_body'>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='main_no' id='main_no' value='${mainVO.main_no }'>
      
       <label>그룹 이름</label>
      <input type='text' name='main_name' value="${mainVO.main_name }" required="required" 
                 autofocus="autofocus" style='width: 25%;'>     
                 
      <label>순서</label>
      <input type='number' name='main_seqno' value="${mainVO.main_seqno }" required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
       
      <button type="submit" id='submit'>저장</button>
      <button type="button" onclick="location.href='./list.do'">취소</button>
    </FORM>
  </DIV>

  
     
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>    
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">순서</TH>
      <TH class="th_bs">대분류명</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">출력</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="mainVO" items="${list}"> <!-- getattribute(list) -->
      <c:set var="main_no" value="${mainVO.main_no }" />
      <c:set var="main_name" value="${mainVO.main_name }" />
      <c:set var="main_seqno" value="${mainVO.main_seqno }" />
      <c:set var="rdate" value="${mainVO.rdate }" />
      
      <TR>      
        <TD class="td_bs">${main_no }</TD>
        <TD class="td_bs">${main_name }</TD>
        <TD class="td_bs_left"><a href="../cate/list.do?main_no=${main_no}">${main_seqno }</TD>
        <TD class="td_bs">${rdate }</TD>
        
        <TD class="td_bs">
          <A href="./read_update.do?main_no=${main_no }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?main_no=${main_no }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
          <A href="./update_seqno_up.do?main_no=${main_no }" title="우선순위 상향"><span class="glyphicon glyphicon-arrow-up"></span></A>
          <A href="./update_seqno_down.do?main_no=${main_no }" title="우선순위 하향"><span class="glyphicon glyphicon-arrow-down"></span></A>         
        </TD>  
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
 
 