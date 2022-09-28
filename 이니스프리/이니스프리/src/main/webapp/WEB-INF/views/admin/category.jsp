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
  <form method="post">
	  <div class="input-group mb-3">
	    <div class="cate_wrap">
            <span>대분류</span>
            <select class="cate1">
               <option selected value="none">선택</option>
               <option selected value="none">스킨케어</option>
            </select>
         </div>
         <div class="cate_wrap">
            <span>중분류</span>
            <select class="cate2">
               <option selected value="none">선택</option>
               <option selected value="none">스킨</option>
            </select>
         </div>
         <div class="cate_wrap">
            <span>소분류</span>
            <select class="cate3">
               <option selected value="none">선택</option>
               <option selected value="none">그린티 씨드 스킨</option>
            </select>
         </div> 
	    <div class="input-group-append">
	    	<button class="btn btn-outline-success">등록</button>
	  	</div>
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