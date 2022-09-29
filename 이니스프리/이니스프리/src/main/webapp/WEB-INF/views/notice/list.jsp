<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btn-del{
	padding : 0; border: none; background-color: transparent; color : #ffc107;
}
form.btn:hover .btn-del{
	color : #fff;
}
form.btn{
	margin-bottom: 0;
}
</style>
</head>
<body>
<div class="container">
  <h2>공지사항</h2>
  <table class="table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성일</th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach items="${list}" var="no" varStatus="status">
	      <tr>
	        <td>${pm.totalCount - (pm.cri.page-1)*pm.cri.perPageNum - status.index}</td>
	        <td>
	        	<a href="<c:url value="/notice/select?no_num=${no.no_num}"></c:url>">${no.no_title}</a>
	        </td>
	        <td>${no.no_reg_date_str}</td>
	      </tr>
      </c:forEach>
    </tbody>
  </table>
  <ul class="pagination justify-content-center">
  	<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
  		<a class="page-link" href="<c:url value="/notice/list?page=1&search=${pm.cri.search}&no_type=${no_type}"></c:url>">처음</a>
  	</li>
  	<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
  		<a class="page-link" href="<c:url value="/notice/list?page=${pm.startPage-1}&search=${pm.cri.search}&no_type=${no_type}"></c:url>">이전</a>
  	</li>

  	<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="i">
    	<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
    		<a class="page-link" href="<c:url value="/notice/list?page=${i}&search=${pm.cri.search}&no_type=${no_type}"></c:url>">${i}</a>
    	</li>
    </c:forEach>

    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
    	<a class="page-link " href="<c:url value="/notice/list?page=${pm.endPage+1}&search=${pm.cri.search}&no_type=${no_type}"></c:url>">다음</a>
    </li>
    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
    	<a class="page-link" href="<c:url value="/notice/list?page=${pm.finalPage}&search=${pm.cri.search}&no_type=${no_type}"></c:url>">마지막</a>
    </li>
  </ul>
  <form>
  	<div class="input-group mb-3">
  		<input type="text" class="form-control" placeholder="제목으로 검색하세요." name="search" value="${pm.cri.search}">
		  <div class="input-group-append">
		    <button class="btn btn-success" type="submit">검색</button>
		  </div>
		  <input type="hidden" name="no_type" value="${no_type}">
		</div>
  </form>
</div>
</body>
</html>