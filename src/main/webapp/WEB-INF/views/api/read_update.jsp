<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Tranning</title>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>
  <A href="../cate_main/list.do" class='title_link'>카테고리 그룹</A> > 
  <A href="./list_api.do?main_no=${apiVO.main_no }" class='title_link'>${mainVO.main_name }</A> > 
  ${apiVO.api_name } 수정 
</DIV>

<DIV class='content_body'>

  <DIV id='panel_update' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm' id='frm' method='POST' action='./update.do'>
      <input type="hidden" name="api_no" value="${param.api_no }">
      
      <label>카테고리 그룹 번호</label>
      <input type='number' name='main_no' value='${apiVO.main_no }' 
                 required="required" min="1" max="100" step="1" autofocus="autofocus">
      <label>API 이름</label>
      <input type='text' name='api_name' value='${apiVO.api_name }' required="required" >
      <label>사용 분야</label>
      <input type='text' name='position' value='${apiVO.position }' 
                 required="required" style='width: 25%;'>    
  
      <button type="submit" id='submit'>저장</button>
      <button type="button" onclick="location.href='./list_api.do?main_no=${apiVO.main_no}'">취소</button>
    </FORM>
  </DIV>

  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 15%;'/>    
      <col style='width: 10%;'/>
      <col style='width: 15%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">카테고리<br> 번호</TH>
      <TH class="th_bs">카테고리<br> 그룹 번호</TH>
      <TH class="th_bs">카테고리 이름</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">관련<br> 자료수</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="apiVO" items="${list}">
      <c:set var="api_no" value="${apiVO.api_no }" />
      <c:set var="main_no" value="${apiVO.main_no }" />
      <c:set var="api_name" value="${apiVO.api_name }" />
      <c:set var="rdate" value="${apiVO.rdate }" />
      <c:set var="position" value="${apiVO.position }" />
      <TR>
        <TD class="td_bs">${api_no }</TD>
        <TD class="td_bs">${main_no }</TD>
        <TD class="td_bs_left">${api_name }</TD>
        <TD class="td_bs">${rdate }</TD>
        <TD class="td_bs">${position }</TD>
        <TD class="td_bs">
          <A href="./read_update.do?api_no=${api_no }&main_no=${main_no }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?api_no=${api_no }&main_no=${main_no }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
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
 
  