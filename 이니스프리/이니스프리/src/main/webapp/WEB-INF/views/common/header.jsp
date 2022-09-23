<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script src="https://kit.fontawesome.com/5e7711a31e.js" crossorigin="anonymous"></script>
<head>
<style>
.home{
	background-image: url(<%=request.getContextPath()%>/resources/img/logo_basic.png);
	width: 181px; height: 34px; display: block; background-size: 100% 100%
}
</style>
</head>    
<body>    
<nav class="navbar navbar-expand-sm bg-light navbar-light">
  <div class="container" style="position: relative;">
  	<a class="navbar-brand home" href="<c:url value="/"></c:url>"></a>
	  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	    	<span class="navbar-toggler-icon"></span>
	  	</button>
  	<div class="collapse navbar-collapse" id="collapsibleNavbar">
    	<ul class="navbar-nav">
    		<li class="nav-item">
				<a class="nav-link" href="<c:url value="/notice"></c:url>">고객센터</a>
			</li>	      	
	      	<li class="nav-item">				
				<c:if test="${user == null}">
					<a class="nav-link" href="<c:url value="/signup"></c:url>">회원가입</a>
					<a class="nav-link" href="<c:url value="/login"></c:url>">로그인</a>
				</c:if>        	
	      	</li>
	      	<li class="nav-item">
				<a class="nav-link" href="<c:url value="/logout"></c:url>">로그아웃</a>        	
	      	</li>
	      	<li class="nav-item">
				<a class="nav-link" href="<c:url value="/mypage"></c:url>">마이페이지</a>
	      	</li>
	      	<li class="nav-item">
				<a class="nav-link" href="<c:url value="/cart"></c:url>">장바구니</a>
	      	</li>     
    	</ul>
	</div>
  </div>
</nav>
</body>