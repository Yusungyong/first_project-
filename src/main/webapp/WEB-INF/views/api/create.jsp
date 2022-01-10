<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Tranning</title>
    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
<DIV class='title_line'>메인 카테고리  > 등록</DIV>
 
<DIV class='content_body'>
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
    <input type='hidden' name='main_no' value='${param.main_no }' >   
    <div class="form-group">
       <label class="control-label col-md-3">메인 카테고리 이름</label>
       <div class="col-md-8">
         <input type='text' name='api_name' value='api이름 입력' required="required" placeholder="이름"
                    autofocus="autofocus" class="form-control" style='width: 50%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-3">출력 순서</label>
       <div class="col-md-8">
         <input type='number' name='api_seqno' value='1' required="required" 
                   placeholder="출력 순서" min="1" max="1000" step="1" 
                   style='width: 30%;' class="form-control" >
       </div>
    </div>  
    
    <div class="form-group">
       <label class="control-label col-md-3">사용 분야</label>
       <div class="col-md-8">
         <input type='text' name='position' value='api사용 분야' required="required" 
                   placeholder="사용 분야" style='width: 30%;' class="form-control" >
       </div>
    </div>      
  
    <div class="content_body_bottom" style="padding-right: 20%;">
      <button type="submit" class="btn">등록</button>
      <button type="button" onclick="location.href='/api/list_api.do?main_no=${mainVO.main_no }'">목록</button>
    </div>
  
  </FORM>
  
</DIV>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 <link href="/css/exam.css" rel="Stylesheet" type="text/css">
</html>
 
 