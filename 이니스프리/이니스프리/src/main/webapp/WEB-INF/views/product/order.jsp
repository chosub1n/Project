<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
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
<style>
.error{
	color:red;
}
</style>
</head>
<body>
<div class="container">
	<form action="<%=request.getContextPath()%>/product/orderList" method="post">
		<h1 style="text-align: center;">결제하기</h1>
		<h4 style="font-weight: bold;">주문/배송정보</h4>
		<div class="form-group">
			<label for="me_name">*주문자</label>
			<input type="text" class="form-control" id="me_name" name="me_name" value="${user.me_name}">
		</div>
		<div class="form-group">
		  	<label for="me_phonenum">*연락처</label>
		  	<input type="text" class="form-control" id="me_phonenum" name="me_phonenum" value="${user.me_phonenum}" oninput="autoHyphen(this)" maxlength="13" autofocus>
		</div>
		<div class="form-group">
			<label for="me_email">*이메일</label>
		  	<input type="text" class="form-control" id="me_email" name="me_email" value="${user.me_email}">
		  	<label id="me_email-error" class="error" for="me_email"></label>
		</div>
		<div class="form-group">
			<label for="me_post_code">기본 배송지</label> <button type="button" class="btn btn-outline-secondary" id="manualAddDlvAddr">배송지 추가</button>
			<div class="input-group mb-3">
		    	<input type="text" id="me_post_code" placeholder="우편번호" name="me_post_code" class="form-control" value="${user.me_post_code}">
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="form-control ">
		  	</div>
			<div class="input-group mb-3">
				<input type="text" id="me_addr" placeholder="주소" name="me_addr" class="form-control" value="${user.me_addr}">
			</div>
			<div class="input-group mb-3">
				<input type="text" id="me_addr_detail" placeholder="상세주소" name="me_addr_detail" class="form-control" value="${user.me_addr_detail}">
			</div>
		</div>
		<div class="form-group">
			<label for="or_request">배송 요청사항</label>
				<select id="category" name="category">
					<option value="or_request1" selected>배송 요청사항을 선택해주세요.</option>
			  		<option value="or_request2">부재시 경비(관리)실에 맡겨주세요.</option>
			  		<option value="or_request3">부재시 문앞에 놓아주세요.</option>
			  		<option value="or_request4">파손의 위험이 있는 상품이 있으니, 배송에 주의해주세요.</option>
			  		<option value="or_request5">배송전에 연락주세요.</option>
					<option value="direct">메시지 직접입력</option>
					<c:forEach var="categoryValue" items="${categoryValue}">
						<option value="${categoryValue}">${categoryValue}</option>
					</c:forEach>
				</select>
			<input type="text" id="category" class="categoryValue" name="categoryValue" maxlength=45 placeholder="배송 요청사항을 입력해주세요.(최대 45자까지 입력가능)">
		</div>	
		<h4 style="font-weight: bold;">주문 상품 정보</h4>
		<table class="table">
    		<thead>
      			<tr>
        			<th>제품 이미지</th>
        			<th>제품명</th>
        			<th>구매 수량</th>
        			<th>가격</th>
        			<th>배송비</th>
        			<th>최종 결제 금액</th>
      			</tr>
    		</thead>
    		<tbody>
	      		<tr>
	        		<td>
	          			<img alt="제품이미지" src="<c:url value="${product.pr_thumb_url}"></c:url>" width="150" height="150">
	        		</td>
		    		<td>${product.pr_title}</td>
		    		<td>${pr_count}&nbsp;개</td>
		    		<td class="pr_price">
                    	<fmt:formatNumber pattern="###,###,###" value="${pr_count * product.pr_price}" />원
                    </td>
                    <td class="pr_deli">
                    	<fmt:formatNumber pattern="###,###,###" value="${product.pr_deli}" />원     	
                    </td>
                    <td class="totalprice">
                    	<fmt:formatNumber pattern="###,###,###" value="${(pr_count * product.pr_price) + product.pr_deli}" />원
                    </td>		    		
	      		</tr>
  	  		</tbody>
  		</table>
		<h4 style="font-weight: bold;">결제수단 선택</h4>
		<div class="form-group">
		  <div class="form-check-inline">
		  	 <label class="form-check-label">
		    	<input type="radio" class="form-check-input" name="me_gender" value="P">신용카드 결제
		  	 </label>
		   </div>
		   <div class="form-check-inline">
		  	 <label class="form-check-label">
		    	<input type="radio" class="form-check-input" name="me_gender" value="N">무통장 입금
		  	 </label>
			</div>
		</div>
		<button class="btn btn-outline-success col-12 mb-5">결제하기</button>
	</form>
</div>
<script type="text/javascript">
	//전화번호 자동 하이프
	const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
	
	$(function(){
   	$("form").validate({
       rules: {
    	 me_name: 	{required : true},  
         me_email: {
           required : true,
           email : true
         },
         me_phonenum: {required : true}
       },
       //규칙체크 실패시 출력될 메시지
       messages : {
    	 me_name: {required : "주문자 성명을 입력해주세요."},
         me_phonenum: {required : "주문자 연락처를 입력해주세요."},
         me_email: {
       	  required : "주문자 이메일을 입력해주세요.",
       	  email : "이메일 형식에 맞지 않습니다."
         }
       	 },   
   	  });
	})
	$.validator.addMethod(
    "regex",
    function(value, element, regexp) {
        var re = new RegExp(regexp);
        return this.optional(element) || re.test(value);
    },
    "Please check your input."
	);
	
	$(function(){
		$('[name=me_email]').on('input',function(){
			idCheck = false;
			let me_email = $(this).val();
			console.log(me_email)
			if(me_email.length == 0)
				return;
			
			let obj = {
					me_email : me_email
			}
			ajaxPost(false, obj, '/check/email', function(data){
				idCheck = data.res;
			})
		})	
	})
	let idCheck = false;
	
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
	
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
	
	    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	    var addr = ''; // 주소 변수
	
	    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	        addr = data.roadAddress;
	    } else { // 사용자가 지번 주소를 선택했을 경우(J)
	        addr = data.jibunAddress;
	    }
	
	    // 우편번호와 주소 정보를 해당 필드에 넣는다.
	    document.getElementById('me_post_code').value = data.zonecode;
	    document.getElementById("me_addr").value = addr;
	    // 커서를 상세주소 필드로 이동한다.
	    document.getElementById("me_addr_detail").focus();
		}						
	}).open();
}

/* 카테고리 직접 입력선택 시 인풋 박스 띄워주는 Jquery */
$(function(){
      //직접입력 인풋박스 기존에는 숨어있다가
$(".categoryValue").hide();
$("#category").change(function() {
                //직접입력을 누를 때 나타남
		if($("#category").val() == "direct") {
			$(".categoryValue").show();
		}  else {
			$(".categoryValue").hide();
		}
	}) 
});
</script>
</body>
</html>