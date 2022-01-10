<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="tech_name" value="${techVO.tech_name }" />
<c:set var="contents" value="${techVO.contents }" />
<c:set var="techno" value="${techVO.techno }" />
<c:set var="word" value="${techVO.word }" />
         
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>수정</title>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
<DIV class='title_line'>
  <A href="../cate_main/list.do" class='title_link'>카테고리 그룹</A> > 
  <A href="../cate/list_api.do?main_no=${mainVO.main_no }" class='title_link'>${main_VO.main_name }</A> >
  <A href="./list_technology.do?api_no=${apiVO.api_no }" class='title_link'>${apiVO.api_name }</A> >
  ${tech_name } 수정
</DIV>

<DIV class='content_body'>
    <ASIDE class="aside_right">
      <A href="./create.do?api_no=${apiVO.api_no }">등록</A>
      <span class='menu_divide' >│</span>
      <A href="javascript:location.reload();">새로고침</A>
      <span class='menu_divide' >│</span>
      <A href="./list_technology.do?api_no=${apiVO.api_no }&now_page=${param.now_page}&word=${param.word }">기본 목록형</A>    
      <span class='menu_divide' >│</span>
      <A href="./list_technology_grid.do?api_no=${apiVO.api_no }">갤러리형</A>
      <span class='menu_divide' >│</span>
      <A href="./update_text.do?techno=${techno}&now_page=${param.now_page}">수정</A>
      <span class='menu_divide' >│</span>
      <A href="./update_file.do?techno=${techno}&now_page=${param.now_page}">파일 수정</A>  
      <span class='menu_divide' >│</span>
      <A href="./delete.do?techno=${techno}&now_page=${param.now_page}">삭제</A>  
    </ASIDE> 
  
    <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_technology.do'>
      <input type='hidden' name='api_no' value='${apiVO.api_no }'>
      <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_technology.do?api_no=${apiVO.api_no}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  <FORM name='frm' method='POST' action='./update_text.do' class="form-horizontal">
    <input type='hidden' name='techno' value='${techno }'>
    <input type="hidden" name="api_no" value="${apiVO.api_no }">
    <input type="hidden" name="adminno" value="1"> <%-- 관리자 개발후 변경 필요 --%>
    <input type='hidden' name='now_page' value='${param.now_page }'>
    
    <div class="form-group">
       <label class="control-label col-md-2">제목</label>
       <div class="col-md-10">
         <input type='text' name='tech_name' value='${tech_name }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">학습 내용</label>
       <div class="col-md-10">
         <textarea name='contents' required="required" class="form-control" rows="20" style='width: 100%;'>${contents }</textarea>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">검색어</label>
       <div class="col-md-10">
         <input type='text' name='word' value='${word }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>  
 

        <div class="form-group">
       <label class="control-label col-md-2">패스워드</label>
       <div class="col-md-10">
         <input type='password' name='passwd' value='' required="required" class="form-control" style='width: 100%;'>
       </div>
    </div>
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">저장</button>
      <button type="button" onclick="history.back();" class="btn btn-primary">취소</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 <link href="/css/exam.css" rel="Stylesheet" type="text/css">
</html>