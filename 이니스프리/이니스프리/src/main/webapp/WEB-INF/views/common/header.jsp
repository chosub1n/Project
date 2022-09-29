<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script src="https://kit.fontawesome.com/5e7711a31e.js" crossorigin="anonymous"></script>
<head>
<style>
.home{
	background-image: url(<%=request.getContextPath()%>/resources/img/logo_basic.png);
	width: 181px; height: 34px; display: block; background-size: 100% 100%; margin-top: 55px;
}
.headersearch{
	position: relative; height: 40px; padding-right: 60px; width: 400px;
	border: 2px solid #d9d9d9; border-radius: 21px; overflow: hidden; margin-top: 55px;
}
.fa-solid{
	font-size: 23px; margin-left: 350px; margin-top: 7px;
}
.list{
	margin-left: 100px; 
}
.member .dropdown-toggle::after{
	display: none;
}
.cart em{
    display: inline-block; margin-left: 5px; width: 18px; height: 18px;
    line-height: 19px; border-radius: 50%; background: #167a68;
    color: #fff; font-size: 14px; text-align: center;
}
</style>
</head>    
<body>    
<nav class="navbar navbar-expand-sm bg-light navbar-light">
  <div class="container" style="position: relative;">
  	<a class="navbar-brand home" href="<c:url value="/"></c:url>"></a>
  	  <div class="headersearch">
  	  	<input type="hidden" name="schText" id="schText" value="">
  	  	<i class="fa-solid fa-magnifying-glass"></i>
  	  </div>
	  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	    	<span class="navbar-toggler-icon"></span>
	  	</button>
  	<div class="collapse navbar-collapse list" id="collapsibleNavbar">
    	<ul class="navbar-nav">
    	   <c:if test="${user.me_authority != 10 }">
    		  <li class="nav-item">
				 <a class="nav-link" href="<c:url value="/notice/list?no_type=NOTICE"></c:url>">고객센터</a>
			  </li>
			</c:if>	      	
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
					<a class="nav-link" href="<c:url value="/logout"></c:url>" onclick="return confirm('로그아웃 하시겠습니까?');">로그아웃</a>
				</c:if>           	
	      	</li>
	      	<li class="nav-item dropdown member">
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
				<a class="nav-link" href="<c:url value="/cart"></c:url>">장바구니<em id="btn-cart cart">0</em></a>
	      	</li>
	      	<c:if test="${user.me_authority == 10 }">
		    	<li class="nav-item">
		        	<a class="nav-link" href="<c:url value="/admin"></c:url>">관리자</a>
		      	</li>   
  			</c:if>    
    	</ul>
	</div>
  </div>
</nav>
</body>