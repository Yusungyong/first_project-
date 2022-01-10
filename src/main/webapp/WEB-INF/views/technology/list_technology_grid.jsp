<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Tranning</title>
 
<link href="/css/exam.css" rel="Stylesheet" type="text/css">

    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>


<c:set var="api_no" value="${apiVO.api_no }" />
<c:set var="main_no" value="${mainVO.main_no }" />
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>
  <A href="../cate_main/list.do" class='title_link'>카테고리 그룹</A> > 
  <A href="../api/list_api.do?main_no=${main_no }" class='title_link'>${mainVO.main_name }</A> >
  <A href="./list_technology.do?api_no=${api_no }" class='title_link'>${apiVO.api_name }</A>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?api_no=${api_no }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_technology.do?api_no=${api_no }">기본 목록형</A>
  </ASIDE> 
  
  <DIV style="text-align: center; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_technology_grid.do'>
      <input type='hidden' name='api_no' value='${apiVO.api_no }'>
          <input type='text' name='word' id='word' value='${param.word }' style='width: 20%; height: 20%'>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_technology_grid.do?api_no=${apiVO.api_no}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>

  <DIV class='menu_line' ></DIV>
  
  <div style='width: 80%; '> <%-- 갤러리 Layout 시작 --%>
    <c:forEach var="techVO" items="${list }" varStatus="status">
        <c:set var="techno" value="${techVO.techno }" />
        <c:set var="size1" value="${techVO.size1 }" />
        <c:set var="thumb1" value="${techVO.thumb1 }" />
        <c:set var="tech_name" value="${techVO.tech_name }" />
        <c:set var="cnt" value="${techVO.cnt }" />
      <%-- 하나의 행에 이미지를 4개씩 출력후 행 변경 --%>
      <c:if test="${status.index % 4 == 0 && status.index != 0 }"> 
        <HR class='menu_line'>
      </c:if>
      
      <!-- 하나의 이미지, 24 * 4 = 96% -->
      <DIV style='width: 24%; 
              float: left; 
              margin: 0.5%; padding: 0.5%; background-color: #EEEFFF; text-align: center; border-radius: 45px;'>
        <c:choose>
          <c:when test="${size1 > 0}"> <!-- 파일이 존재하면 -->
            <c:choose> 
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}"> <!-- 이미지 인경우 -->
                <a href="./read.do?techno=${techno}">               
                  <IMG src="/contents/storage/${thumb1 }" style='width: 100%; height: 150px; border-radius: 45px;'>
                </a><br>
                ${tech_name} <br>
              </c:when>
              <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                <DIV style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                  <DIV style='display: table-cell; vertical-align: middle; text-align: center;'> <!-- 수직 가운데 정렬 -->
                    <a href="./read.do?techno=${techno}"></a><br>
                  </DIV>
                </DIV>
                ${tech_name} (${cnt})              
              </c:otherwise>
            </c:choose>
          </c:when>
          <c:otherwise> <%-- 파일이 없는 경우 기본 이미지 출력 --%>
            <a href="./read.do?techno=${techno}">
              <img src='/tech_img/none1.png' style='width: 100%; height: 150px;'>
            </a><br>
            이미지를 등록해주세요.
          </c:otherwise>
        </c:choose>         
      </DIV>  
    </c:forEach>
    <!-- 갤러리 Layout 종료 -->
    <br><br>
  </div>

</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>