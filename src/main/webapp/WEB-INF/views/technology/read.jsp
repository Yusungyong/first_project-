<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="techno" value="${techVO.techno }" />
<c:set var="api_no" value="${apiVO.api_no }" />
<c:set var="tech_name" value="${techVO.tech_name }" />
<c:set var="file1" value="${techVO.file1 }" />
<c:set var="file1saved" value="${techVO.file1saved }" />
<c:set var="contents" value="${techVO.contents }" />
<c:set var="recom" value="${techVO.recom }" />
<c:set var="thumb1" value="${techVO.thumb1 }" />
<c:set var="word" value="${techVO.word }" />


  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>${tech_name }</title>
 
<link href="/css/exam.css" rel="Stylesheet" type="text/css">
     
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">

</script>

</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
<DIV class='title_line'>
  <A href="../cate_main/list.do" class='title_link'>카테고리 그룹</A> > 
  <A href="../api/list_api.do?main_no=${mainVO.main_no }" class='title_link'>${mainVO.main_name }</A> >
  <A href="./list_technology.do?api_no=${api_no }" class='title_link'>${apiVO.api_name }</A>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?api_no=${api_no }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_technology.do?api_no=${api_no }&now_page=${param.now_page}&word=${param.word }">기본 목록형</A>    
    <span class='menu_divide' >│</span>
    <A href="./list_technology_grid.do?api_no=${api_no }">갤러리형</A>
    <span class='menu_divide' >│</span>
    <A href="./update_text.do?techno=${techno}&now_page=${param.now_page}">수정</A>
    <span class='menu_divide' >│</span>
    <A href="./update_file.do?techno=${techno}&now_page=${param.now_page}">파일 수정</A>  
    <span class='menu_divide' >│</span>
    <A href="./delete.do?techno=${techno}&now_page=${param.now_page}&api_no=${api_no }">삭제</A>  
  </ASIDE> 
  
  <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_technology.do'>
      <input type='hidden' name='api_no' value='${api_no }'>
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_technology.do?api_no=${api_no}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <c:set var="file1saved" value="${file1saved.toLowerCase() }" />
        <DIV class="contents_center" >${contents }</DIV>
        <DIV style="width: 30%; float: right; ">
            <c:choose>
              <c:when test="${file1saved.endsWith('jpg') || file1saved.endsWith('png') || file1saved.endsWith('gif')}">
                <%-- /static/contents/storage/ --%>
                    <IMG src="/contents/storage/${file1saved }" style="width: 50%; border-radius: 70%;"> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/contents/images/none1.png" style="width: 50%;"> 
              </c:otherwise>
            </c:choose>
        </DIV>
        

        
      </li>
      <li class="li_none">
        <DIV class="contents_center" style='text-decoration: none; '>
          검색어(키워드): ${word }
        </DIV>
      </li>
      <li class="li_none">

        <DIV class="contents_center">
          <c:if test="${file1.trim().length() > 0 }">
            첨부 파일: <A href='/download?dir=/contents/storage&filename=${file1saved}&downname=${file1}'>${file1}</A> (${size1_label})  
          </c:if>
        </DIV>
      </li>   
    </ul>
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>