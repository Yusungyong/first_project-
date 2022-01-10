<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="techno" value="${techVO.techno }" />
<c:set var="tech_name" value="${techVO.tech_name }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Tranning</title>
 
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
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?api_no=${apiVO.api_no }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_technology.do?api_no=${apiVO.api_no }">기본 목록형</A>    
    <span class='menu_divide' >│</span>
    <A href="./list_technology_grid.do?api_no=${apiVO.api_no }">갤러리형</A>
    <span class='menu_divide' >│</span>
    <A href="./update_text.do?techno=${techno}">수정</A>
    <span class='menu_divide' >│</span>
    <A href="./update_text.do?techno=${techno}">파일 수정</A>  
  </ASIDE> 
  
    <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_technology.do'>
      <input type='hidden' name='api_no' value='${apiVO.api_no }'>
          <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
          <%-- <input type='hidden' name='now_page' value='${param.now_page }'> --%>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_technology.do?api_no=${apiVO.api_no}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style='text-align: center; width: 50%; float: left;'>
          <c:set var="file1saved" value="${techVO.file1saved.toLowerCase() }" />
          <c:set var="thumb1" value="${techVO.thumb1 }" />
          <c:choose>
            <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
              <IMG src="/tech_img/storage/${file1saved }" style='width: 70%;'> 
            </c:when>
            <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
              상품 관련 이미지가 없습니다.
            </c:otherwise>
          </c:choose>
        </DIV>

        <DIV style='text-align: left; width: 47%; float: left;'>
          <span style='font-size: 1.5em;'>${tech_name}</span>
          <br>
          <FORM name='frm' method='POST' action='./delete.do'>
              <input type='hidden' name='techno' value='${param.techno}'>
              <input type='hidden' name='api_no' value='${apiVO.api_no}'>
              <input type='hidden' name='now_page' value='${param.now_page}'>
              
              <DIV id='panel1' style="width: 40%; text-align: center; margin: 10px auto;"></DIV>
                    
              <div class="form-group">   
                <div class="col-md-12" style='text-align: center; margin: 10px auto;'>
                  삭제 되는글: ${title }<br><br>
                  삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.<br><br>
           <label class="control-label col-md-3">패스워드</label>
           <div class="col-md-9">
             <input type='password' name='passwd' value='' required="required" class="form-control" style='width:40%;'><br>
           </div>                 
                  <button type = "submit" class="btn btn-info">삭제 진행</button>
                  <button type = "button" onclick = "history.back()" class="btn btn-info">취소</button>
                </div>
              </div>   
          </FORM>
        </DIV>
      </li>
      <li class="li_none">

      </li>   
    </ul>
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 <link href="/css/exam.css" rel="Stylesheet" type="text/css">
</html>