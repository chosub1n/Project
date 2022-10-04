<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <h2>카테고리 목록</h2>
  	<form role="form" method="post"> 
 		<label>1차 분류</label>
 			<select class="category1">
  				<option value="">전체</option>
  				<option value="">스킨케어</option>
 			</select> 
 		<label>2차 분류</label>
 			<select class="category2">
  				<option value="">전체</option>
  				<option value="">스킨</option>
 			</select>
 		<label>3차 분류</label>
 			<select class="category3">
  				<option value="">전체</option>
  				<option value="">그린티 씨드 스킨</option>
 			</select>
 		<div class="input-group-append">
	    	<button class="btn btn-outline-success">등록</button>
	  	</div>		
	</form>
  <table class="table table-striped">
    <thead>
      <tr>
        <th>카테고리명</th>
        <th>카테고리코드</th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach items="${list}" var="lc">
	      <tr>
	        <td>${lc.lc_name}</td>
	        <td>${lc.lc_code}</td>	 
	      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>