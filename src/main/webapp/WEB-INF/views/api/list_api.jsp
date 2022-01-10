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
 
<DIV class='title_line'><A href="../cate_main/list.do" class='title_link'>전체 목록</A> > ${mainVO.main_name }
<div class="create_api"><a href="/api/create.do?main_no=${mainVO.main_no }">새로운 기술 등록하기!</a></div></DIV>
<DIV class='content_body'>

  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 30%;'/>
      <col style='width: 15%;'/>    
      <col style='width: 20%;'/>
      <col style='width: 15%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">메인번호 </TH>
      <TH class="th_bs">API 그룹 번호</TH>
      <TH class="th_bs">API 이름</TH>
      <TH class="th_bs">사용 분야</TH>
      <TH class="th_bs">등록일 </TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="apiVO" items="${list}">
      <c:set var="api_no" value="${apiVO.api_no }" />
      <c:set var="main_no" value="${apiVO.main_no }" />
      <TR>
        <TD class="td_bs">${api_no }</TD>
        <TD class="td_bs">${apiVO.main_no }</TD>
        <TD class="td_bs_left"><a href="/technology/list_technology.do?api_no=${api_no }">${apiVO.api_name }</a></TD>
        <TD class="td_bs">${apiVO.position }</TD>
        <TD class="td_bs">${apiVO.rdate }</TD>
        <TD class="td_bs">
          <A href="./read_update.do?api_no=${api_no }&main_no=${main_no }" title="수정">수정</A>
          <A href="./read_delete.do?api_no=${api_no }&main_no=${main_no }" title="삭제">삭제</i></A>
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