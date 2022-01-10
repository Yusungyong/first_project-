<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

  <!-- top.jsp start -->



    <div class="navbar">
         <ul class="login_bar">
         
      <c:choose>
        <c:when test="${sessionScope.id eq null}"> <%-- 로그인 안 한 경 우 --%>
          <li><A class='menu_link'  href='/member/login.do' >로그인</A><span class='top_menu_sep'> </span></li>
          <li><a href="/member/create.do">회원가입</a></li>
        </c:when>
        <c:otherwise>
          <li>${sessionScope.id }님 반갑습니다.<A class='menu_link'  href='/member/logout.do' >로그아웃</A><span class='top_menu_sep'> </span></li>
          <li><a href="/member/list.do">회원목록</a></li>
        </c:otherwise>
      </c:choose>       
         
          
          
          
      </ul>
    </div>
    <div class="logo">
      <p><a href="http://localhost:9091/">tranning</a></p>
    </div>
  <nav>

     

      <ul class="menu_bar">
        <li><a class="active" href="http://localhost:9091/">Home</a></li>
        <li><a href="/api/list_api.do?main_no=1">PYTHON</a></li>
        <li><a href="/api/list_api.do?main_no=2">JAVA</a></li>
        <li><a href="/api/list_api.do?main_no=3">HTML</a></li>
        <li><a href="/api/list_api.do?main_no=4">SQL</a></li>
        <li><a href="/api/list_api.do?main_no=5">CSS</a></li>
        <li><a href="/api/list_api.do?main_no=6">JAVA SCRIPT</a></li>
        <li><a href="/api/list_api.do?main_no=7">R</a></li>
        <li><a href="/api/list_api.do?main_no=8">DOCKER</a></li>
        <li><a href="/api/list_api.do?main_no=9">BASIC</a></li>
      </ul>
     

  </nav>

  <!-- top.jsp end -->
