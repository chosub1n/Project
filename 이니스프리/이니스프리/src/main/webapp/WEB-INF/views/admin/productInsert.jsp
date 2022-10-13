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
	width: 150px; height: 150px; border: 1px solid red;
	text-align: center; font-size: 50px; line-height: 148px;
	cursor: pointer; box-sizing: border-box;
}
#preview{
	display: none;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>
<form class="container" enctype="multipart/form-data" method="post">
	<h2>제품 등록</h2>
	<div class="clearfix">
		<div class="float-left" style="width:auto; height: auto;">
			<div class="box-thumb">+</div>
			<input type="file" name="file">
			<img id="preview" width="150" height="150">
		</div>
		<div class="float-right" style="width:calc(100% - 150px - 10px)">
			<div class="form-group">
				<label>대분류</label>
				<select class="cate-1" name="lc_code"></select>
			</div>
			<div class="form-group">
				<label>중분류</label>
				<select class="cate-2" name="mc_name">
					<option>중분류</option>
				</select>			
			</div>
			<div class="form-group">
			  <input type="text" class="form-control" readonly value="제품 번호" name="pr_code">
			</div>
			<div class="form-group">
			  <input type="text" class="form-control" name="pr_price" placeholder="제품 가격 (정수)">원
			</div>
			<div class="form-group">
			  <input type="text" class="form-control" name="pr_deli" placeholder="배송비 (정수)">원(30,000원 이상 구매시 무료배송)
			</div>
			<div class="form-group">
			  <input type="text" class="form-control" name="pr_point" placeholder="포인트">
			</div>
			<div class="form-group" style="display:inline-block;">
			  <input type="number" class="form-control" name="pr_amount" placeholder="제품 수량">
			</div>
			<label> <제품 라인/고민 선택> </label>
			<div class="form-check-inline">
      			<label class="form-check-label">
        			<input type="checkbox" class="form-check-input" name="pr_line" value="greentea">그린티
      			</label>
    		</div>
    		<div class="form-check-inline">
      			<label class="form-check-label">
        			<input type="checkbox" class="form-check-input" name="pr_line" value="blacktea">블랙티
      			</label>
    		</div>
    		<div class="form-check-inline">
      			<label class="form-check-label">
        			<input type="checkbox" class="form-check-input" name="pr_worry" value="dry">건조함
      			</label>
    		</div>
    		<div class="form-check-inline">
      			<label class="form-check-label">
        			<input type="checkbox" class="form-check-input" name="pr_worry" value="wrinkle">주름
      			</label>
    		</div>
    		<div class="form-check-inline">
      			<label class="form-check-label">
        			<input type="checkbox" class="form-check-input" name="pr_worry" value="elasticity">탄력
      			</label>
    		</div>
		</div>
	</div>
	<div class="form-group">
	  <input type="text" class="form-control" name="pr_title" placeholder="제품 이름">
	</div>
	<div class="form-group">
	  <input type="text" class="form-control" name="pr_title_detail" placeholder="제품 부제목">
	</div>
	<div class="form-group">
	  <textarea class="form-control" name="pr_content" placeholder="제품 상세 정보"></textarea>
	</div>
	<button class="btn btn-outline-danger col-12">제품 등록</button>
</form>
<script type="text/javascript">
$(function(){
	getCategory('large_category', 0, '.cate-1');
	
	$('.cate-1').change(function(){
		
		getCategory('medium_category', $(this).val(), '.cate-2');	
	})
		
})
	function getCategory(tb_name, code, selector){
		let obj = {
				tb_name : tb_name,
				code : code
		}
		ajaxPost(false, obj, '/admin/category/ajax/get', function(data){
			let str = ''
			let list = data.list;
			if(tb_name == 'large_category'){
				str += '<option value="0">대분류</option>'
				for(ca of list){
					str += '<option value="'+ca.lc_code+'">'+ca.lc_name+'</option>'
				}
			}else if(tb_name == 'medium_category'){
				console.log(list)
				str += '<option value="0">중분류</option>'
				for(ca of list){
					str += '<option value="'+ca.mc_pr_code + ((ca.mc_count+1+'').padStart(4,'0'))+'">'+ca.mc_name+'</option>'
				}
			}
			$(selector).html(str);
		})
	}
	
$(function(){
	$('.box-thumb, #preview').click(function(){
		$('[name=file]').click();
	})
	
	$('[name=file]').on('change', function(event) {
		if(event.target.files.length == 0){
			$('.box-thumb').show();
			$('#preview').hide();
			return;
		}else{
			$('.box-thumb').hide();
			$('#preview').show();
		}
		var file = event.target.files[0];
	    var reader = new FileReader(); 
	    reader.onload = function(e) {
	    	$('#preview').attr('src', e.target.result);
	    }
	    reader.readAsDataURL(file);
		});
	
	$('[name=pr_content]').summernote({
    placeholder: '제품 상세 정보를 입력하세요.',
    tabsize: 2,
    height: 400
  });
	$('[name=mc_name]').change(function(){
		$('[name=pr_code]').val($(this).val());
	})
	$('form').submit(function(){
		let thumb_img = $('[name=file]').val();
		if(thumb_img == ''){
			alert('썸네일 이미지를 선택하세요.');
			$('[name=file]').click();
			return false;
		}
		let lc_code = $('[name=lc_code]').val();
		if(lc_code == '0'){
			alert('대분류를 선택하세요.');
			$('[name=lc_code]').focus();
			return false;
		}
		let mc_name = $('[name=mc_name]').val();
		if(mc_name == '0'){
			alert('중분류를 선택하세요.');
			$('[name=mc_name]').focus();
			return false;
		}
		let pr_price = $('[name=pr_price]').val();
		if(pr_price == '' || !/\d+/.test(pr_price)){
			alert('올바른 가격을 입력하세요.');
			$('[name=pr_price]').focus();
			return false;
		}
		let pr_deli = $('[name=pr_deli]').val();
		if(pr_deli == '' || !/\d+/.test(pr_deli)){
			alert('배송비를 입력하세요.');
			$('[name=pr_deli]').focus();
			return false;
		}
		let pr_point = $('[name=pr_point]').val();
		if(pr_point == ''){
			alert('포인트를 입력하세요.');
			$('[name=pr_point]').focus();
			return false;
		}
		let pr_amount = $('[name=pr_amount]').val();
		if(pr_amount == ''){
			alert('제품 수량은 한 개 이상이어야 합니다.');
			$('[name=pr_amount]').focus();
			return false;
		}
		let pr_title = $('[name=pr_title]').val();
		if(pr_title == ''){
			alert('제품 제목을 입력하세요.');
			$('[name=pr_title]').focus();
			return false;
		}
		let pr_title_detail = $('[name=pr_title_detail]').val();
		if(pr_title_detail == ''){
			alert('제품의 부제목을 입력하세요.');
			$('[name=pr_title_detail]').focus();
			return false;
		}
		let pr_content = $('[name=pr_content]').val();
		if(pr_content == ''){
			alert('제품의 상세정보를 입력하세요.');
			$('[name=pr_content]').focus();
			return false;
		}
	});
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
</html>