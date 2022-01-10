<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>${apiVO.api_name }</title>

 <link href="/css/exam.css" rel="Stylesheet" type="text/css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head> 
  
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>
  <A href="../cate_main/list.do" class='title_link' > 카테고리 그룹</A> >  
  <A href="../api/list_api.do?main_no=${mainVO.main_no }" class='title_link'>${mainVO.main_name }</A> > 
  <A href="./list_technology.do?api_no=${apiVO.api_no }" class='title_link'>${apiVO.api_name }</A>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right" style="text-align: right;" >
    <A href="./create.do?api_no=${apiVO.api_no }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_technology_grid.do?api_no=${apiVO.api_no }">갤러리형</A>
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
  
<table class="type07" style="width: 100%;">
  <colgroup>
    <col style="width: 20%;"></col>
    <col style="width: 20%;"></col>
    <col style="width: 40%;"></col>
    <col style="width: 20%;"></col>
    
  </colgroup>  
  
  
  <thead>
  <tr>
    <th scope="cols">타이틀</th>
    <th scope="cols">제목</th>
    <th scope="cols">내용</th>
    <th scope="cols">기타</th>
  </tr>
  </thead>
  <tbody>
    <c:forEach var="techVO" items="${list }" varStatus="status">
      <c:set var="techno" value="${techVO.techno }" />
      <c:set var="tech_name" value="${techVO.tech_name }" />
      <c:set var="contents" value="${techVO.contents }" />
      <c:set var="file1" value="${techVO.file1 }" />
      <c:set var="file1saved" value="${techVO.file1saved }" />
      <c:set var="thumb1" value="${techVO.thumb1 }" />
      <c:set var="api_no" value="${techVO.api_no }" />
      
      <tr> 
        <td style='vertical-align: middle; text-align: center;'>
          <c:choose>
            <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
              <%-- /static/contents/storage/ --%>
              <a href="./read.do?techno=${techno}&now_page=${param.now_page }"><IMG src="/contents/storage/${thumb1 }" style="width: 120px; height: 80px; border-radius: 50px;"></a> 
            </c:when>
            <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
              <IMG src="/contents/storage/none1.png" style="width: 120px; height: 80px;">
            </c:otherwise>
          </c:choose>
        </td>  
        <td style='vertical-align: middle;'>
          <a href="./read.do?techno=${techno}&now_page=${param.now_page }&word=${param.word }"><strong>${tech_name}</strong></a> 
        </td> 
        <td style='vertical-align: middle;'>
          <a href="./read.do?techno=${techno}&now_page=${param.now_page }&word=${param.word }">${contents}</a> 
        </td> 
        <td style='vertical-align: middle; text-align: center;'>
          <A href="./update_text.do?techno=${techno}&now_page=${now_page }&api_no=${api_no }"><span>수정</span></A>
          <A href="./delete.do?techno=${techno}&now_page=${now_page }&api_no=${apiVO.api_no }"><span>삭제</span></A>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>
  
  <!-- 페이지 목록 출력 부분 시작 -->
  <DIV class='bottom_menu'>${paging }</DIV> <%-- 페이지 리스트 --%>
  <!-- 페이지 목록 출력 부분 종료 -->
  
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
</html>
 