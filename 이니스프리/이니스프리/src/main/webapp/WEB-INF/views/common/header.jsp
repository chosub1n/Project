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
.member .dropdown-toggle::after{
	display: none;
}
.cart em{
    display: inline-block; margin-left: 5px; width: 18px; height: 18px;
    line-height: 19px; border-radius: 50%; background: #167a68;
    color: #fff; font-size: 14px; text-align: center;
}
/*메인메뉴*/
.item-menu{
   width: 200px; line-height: 40px; font-size: 20px;
}
.link-menu, .link-sub-menu{
   color: black;
}
.link-menu:hover, .link-sub-menu:hover{
   color: black; text-decoration: none;
}
/*서브 메뉴*/
.list-sub-menu{
   display: none;
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
	  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar" style="cursor:pointer">
	    	<span class="navbar-toggler-icon"></span>
	  	</button>
  	<div class="collapse navbar-collapse" id="collapsibleNavbar">
    	<ul class="navbar-nav"  style="position:absolute; right: 0">
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
<nav class="navbar navbar-expand-sm bg-light navbar-light">
  <div class="container category">
     <ul class="list-menu category" style="display: flex;">
         <li class="item-menu">
            <a href="<c:url value="/product/list"></c:url>" class="link-menu">스킨케어</a>
            <ul class="list-sub-menu">
               <li class="item-sub-menu">
                  <a href="#" class="link-sub-menu">스킨</a>
               </li>
               <li class="item-sub-menu">
                  <a href="#" class="link-sub-menu">로션</a>
               </li>
               <li class="item-sub-menu">
                  <a href="#" class="link-sub-menu">에센스</a>
               </li>
            </ul>
         </li>
         <li class="item-menu">
            <a href="#" class="link-menu">클렌징</a>
            <ul class="list-sub-menu">
               <li class="item-sub-menu">
                  <a href="#" class="link-sub-menu">클렌징폼</a>
               </li>
               <li class="item-sub-menu">
                  <a href="#" class="link-sub-menu">클렌징오일/워터</a>
               </li>
            </ul>
         </li>
         <li class="item-menu">
            <a href="#" class="link-menu">팩/마스크</a>
            <ul class="list-sub-menu">
               <li class="item-sub-menu">
                  <a href="#" class="link-sub-menu">시트 마스크</a>
               </li>
               <li class="item-sub-menu">
                  <a href="#" class="link-sub-menu">워시 오프 팩</a>
               </li>
               <li class="item-sub-menu">
                  <a href="#" class="link-sub-menu">슬리핑 팩</a>
               </li>
            </ul>
         </li>
      </ul>
  </div>
</nav> 
<script type="text/javascript">
$('.item-menu').hover(function(){
	$(this).children('.list-sub-menu').stop().slideToggle(500)
})
$(function(){
	ajaxPost(false, null, '/category/list', function(data){
		if('${user.me_authority}' == 10){
			return;
		}
		let str = ''; 
		for(c of data.list){
			str += '<li class="item-menu">';
      str += 	'<a class="nav-link" href="<%=request.getContextPath()%>/product/list?mc_name='+mc.mc_name+'">'+mc.mc_name+'</a>';
     	str += '</li>' 
		}
		$('.category').prepend(str);
	})
})
function ajaxPost(async, dataObj, url, success){
	$.ajax({
	  async:async,
	  type:'POST',
	  data:JSON.stringify(dataObj),
	  url:"<%=request.getContextPath()%>"+url,
	  dataType:"json",
	  contentType:"application/json; charset=UTF-8",
	  success : function(data){
		  success(data);
	  }
  });
}
</script>
</body>