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
.member .dropdown-toggle::after{
	display: none;
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
					<a class="nav-link" href="<c:url value="/login"></c:url>">로그인</a>
				</c:if>       	
	      	</li>
	      	<li class="nav-item">				
				<c:if test="${user == null}">
					<a class="nav-link" href="<c:url value="/signup"></c:url>">회원가입</a>
				</c:if>       	
	      	</li>
	      	<li class="nav-item">
				<c:if test="${user != null}">
					<a class="nav-link logout" href="<c:url value="/logout"></c:url>">로그아웃</a>
				</c:if>           	
	      	</li>
	      	<li class="nav-item dropdown">
	      	  <c:if test="${user != null }">
			  	<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">마이페이지</a>
			  </c:if>
			  <div class="dropdown-menu">			      
			  	<a class="dropdown-item" href="<c:url value="/member/update"></c:url>">회원정보 수정</a>				    
			  	<a class="dropdown-item" href="<c:url value="#"></c:url>">보유쿠폰</a>				    
			  	<a class="dropdown-item" href="<c:url value="#"></c:url>">포인트</a>				    
			  	<a class="dropdown-item" href="<c:url value="#"></c:url>">주문배송조회</a>				    
			  	<a class="dropdown-item" href="<c:url value="#"></c:url>">내 리뷰</a>				    
			  	<a class="dropdown-item" href="<c:url value="#"></c:url>">제품 문의 내역</a>				    
			  	<a class="dropdown-item" href="<c:url value="#"></c:url>">찜한 제품</a>				    
			  	<a class="dropdown-item" href="<c:url value="#"></c:url>">멤버십</a>				    
			  </div>
			</li> 
	      	<li class="nav-item">
				<a class="nav-link" href="<c:url value="/cart"></c:url>">장바구니</a>
	      	</li>    
    	</ul>
	</div>
  </div>
</nav>
</body>