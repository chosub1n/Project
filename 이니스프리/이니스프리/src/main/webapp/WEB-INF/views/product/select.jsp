<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
[name=file]{
	display: none;
}
.box-thumb{
	width: 150px; height: 150px; border:1px solid red;
	text-align: center; font-size : 50px; line-height: 148px;
	cursor: pointer; box-sizing: border-box;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>
<div class="container">
	<h2>제품 상세</h2>
	<div class="clearfix">
		<form  method="get" action="<c:url value="/product/order/${p.pr_code}"></c:url>">
			<div class="float-left" style="width:auto; height: auto">
				<img id="preview" width="250" height="250" src="<c:url value="${p.pr_thumb_url}"></c:url>">
			</div>
			<div class="float-right" style="width:calc(100% - 250px - 10px)">
				<div class="form-group" style="display:inline-block;">
			  		<input type="text" class="form-control" value="제품종류 : ${p.pr_mc_name}" readonly>
				</div>
				<div class="form-group" style="display:inline-block;">
			  		<input type="text" class="form-control" value="제품번호 : ${p.pr_code}" readonly>
				</div>
				<div class="form-group" style="display:inline-block;">
				  <input type="text" class="form-control" value="제품가격 : ${p.pr_price}원" readonly>
				</div>
				<div class="form-group">
				  <input type="text" class="form-control" value="배송비 : ${p.pr_deli}원 (40,000원이상 구매시 무료배송)" readonly>
				</div>
				<div class="form-group">
				  <input type="text" class="form-control" value="포인트 : ${p.pr_point}" readonly>
				</div>
				<div class="form-group">
				  <input type="text" class="form-control" value="제품라인과 고민 : ${p.pr_line}, ${p.pr_worry}" readonly>
				</div>
				<div class="form-group count" style="display:inline-block;">
					<label>구매수량</label>
					<input type="number" min="1" max="10" value="1" name="pr_count">&nbsp;개
					<button class="btn btn-light btn-buy">구매하기</button> 
				</div>
			</div>
		</form>
	</div>
	<div class="form-group">
	  <input type="text" class="form-control" value="${p.pr_title}" readonly>
	</div>
	<div class="form-group">
	  <input type="text" class="form-control" value="${p.pr_title_detail}" readonly>
	</div>
	<div class="form-group">
	  <div class="form-control" style="height:auto">${p.pr_content}</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$('.btn-buy').click(function(e){
		if('${user.me_email}' == ''){
			if(confirm('로그인 한 회원만 구매가 가능합니다. 로그인 하시겠습니까?')){
				e.preventDefault();
				location.href = '<%=request.getContextPath()%>/login'
			}
		}
		
	//구매수량 제한 
	$('.count input').change(function(){
		if($(this).val() > 10){
			alert('이 제품의 1회 최대 구매 가능한 수량은 10개 입니다.');
			$(this).val(10)
			return;
		}
	});
})
</script>
</body>
</html>