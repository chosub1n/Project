<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="container">
	<form method="post">
		<h1>회원정보 수정</h1>
			<div class="form-group">
		  		<label for="me_name">이름:</label>
		  		<input type="text" class="form-control" id="me_name" name="me_name" readonly value="${user.me_name}">
			</div>
			<div class="form-group">
		  		<label for="me_email">이메일:</label>
		  		<input type="text" class="form-control" id="me_email" name="me_email" readonly value="${user.me_email}">
			</div>
			<div class="form-group">
		  		<label for="me_pw">비밀번호:</label>
		  		<input type="password" class="form-control" id="me_pw" name="me_pw">
			</div>
			<div class="form-group">
		  		<label for="me_pw2">비밀번호 확인:</label>
		  		<input type="password" class="form-control" id="me_pw2" name="me_pw2">
			</div>
			<div class="form-group">
		  		<label for="me_birth">생년월일:</label>
		  		<input type="text" class="form-control" id="me_birth" name="me_birth" value="${user.me_birth_str}">
			</div>
			<div class="form-group">
		  		<label for="me_phonenum">전화번호</label>
		  		<input type="text" class="form-control" id="me_phonenum" name="me_phonenum" value="${user.me_phonenum}">
			</div>
			<div class="form-group">
				<div class="input-group mb-3">
		    		<input type="text" id="me_post_code" placeholder="우편번호" name="me_post_code" class="form-control" value="${user.me_post_code}">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="form-control">
		  		</div>
			<div class="input-group mb-3">
				<input type="text" id="me_addr" placeholder="주소" name="me_addr" class="form-control" value="${user.me_addr}">
			</div>
			<div class="input-group mb-3">
				<input type="text" id="me_addr_detail" placeholder="상세주소" name="me_addr_detail" class="form-control" value="${user.me_addr_detail}">
			</div>
		</div>
		<button class="btn btn-outline-success col-12">회원정보수정</button>
	</form>
</div>
<script type="text/javascript">
	$(function(){
		$( "#me_birth" ).datepicker({
	  changeMonth: true,
	  changeYear: true,
	  dateFormat: 'yy-mm-dd',
	  yearRange: "1900:2022"
		});
	})
	$(function(){
		$('form').submit(function(){
			let pw = $('[name=me_pw]').val();
			if(pw.trim() == ''){
				if(!confirm('기존 비밀번호로 유지하겠습니까?')){
					return false;
				}
			}
			let pw2 = $('[name=me_pw2]').val();
			if(pw != pw2){
				alert('비밀번호와 비밀번호 확인이 다릅니다.');
				return false;
			}
			return true;
		})	
	})
	function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
	
	    var addr = '';
	
	    if (data.userSelectedType === 'R') { 
	        addr = data.roadAddress;
	    } else { 
	        addr = data.jibunAddress;
	    }
	    document.getElementById('me_post_code').value = data.zonecode;
	    document.getElementById("me_addr").value = addr;
	    document.getElementById("me_addr_detail").focus();
		}						
	}).open();
}
</script>
</body>
</html>