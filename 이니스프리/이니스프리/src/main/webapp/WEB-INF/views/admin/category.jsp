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
  <h2>카테고리 등록</h2>
  	<form role="form" method="post"> 
 		<label>1차 분류</label>
		<select class="cate-1" name="lc_code"></select>
	    <input class="input-group-append" name="mc_name" style="display:inline-block;">
 		<div class="input-group-append">
	    	<button class="btn btn-outline-success">등록</button>
	  	</div>		
	</form>
<!--
서비스
 카테고리VO에 있는 lc_code == 0이면 name은 대분류에 등록
 lc_code !=0이고, mc_code == 0이면 name은 중분류에 등록
 lc_code !=0이고, mc_code != 0이면 name은 소분류에 등록
 -->
  <%-- <table class="table table-striped">
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
      <c:forEach items="${list}" var="mc">
	      <tr>
	        <td>${mc.mc_name}</td>
	        <td>${mc.mc_code}</td>
	      </tr>
      </c:forEach>
      <c:forEach items="${list}" var="sc">
	      <tr>
	        <td>${sc.sc_name}</td>
	        <td>${sc.sc_code}</td>
	      </tr>
      </c:forEach>
    </tbody>
  </table> --%>
</div>
<script type="text/javascript">
$(function(){
	getCategory('large_category', 0, '.cate-1');	
})
//제품 등록할 때 활용
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
		}else if(tb_name == 'midium_category'){
			str += '<option value="0">중분류</option>'
			for(ca of list){
				str += '<option value="'+ca.mc_code+'">'+ca.mc_name+'</option>'
			}
		}
		$(selector).html(str);
	})
}

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