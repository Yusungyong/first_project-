<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Tranning</title>
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV><span class='title_line'>카테고리 그룹</span></DIV>

<DIV class='content_body'>
    
  <TABLE class='table table-striped'>
   
    <thead>  
    <TR>
      <TH class="th_bs">카테고리 번호</TH>
      <TH class="th_bs">이름</TH>
      <TH class="th_bs">출력 순서</TH>
      <TH class="th_bs">그룹 생성일</TH>
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
        <TD class="td_bs_no">${main_no }</TD>
        <TD class="td_bs"><a href="../api/list_api.do?main_no=${main_no }">${main_name }</a></TD>
        <TD class="td_bs_left"><a href="../api/list_api.do?main_no=${main_no}">${main_seqno }</TD>
        <TD class="td_bs">${rdate }</TD>
        
        <TD class="td_bs">
          <A href="./read_update.do?api_no=${api_no }&main_no=${main_no }" title="수정">수정</A>
          <A href="./read_delete.do?api_no=${api_no }&main_no=${main_no }" title="삭제">삭제</i></A>
          <A href="./update_seqno_up.do?main_no=${main_no }" title="우선순위 상향"><span>▲</span></A>
          <A href="./update_seqno_down.do?main_no=${main_no }" title="우선순위 하향"><span>▼</span></A>         
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 <link href="/css/exam.css" rel="Stylesheet" type="text/css">
</html>
 