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
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#large">대분류 등록</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#medium">중분류 등록</a>
    </li>
  </ul>
  <div class="tab-content">
	 <div id="large" class="container tab-pane active"><br>
		<form role="form" method="post"> 
			<div class="input-group mb-3">
		    	<input type="text" class="form-control" name="lc_name" placeholder="대분류 카테고리명">
			    <div class="input-group-append">
			    	<button class="btn btn-outline-success">등록</button>
			  	</div>
			 </div>
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
  		</form>
	</div>	    
    <div id="medium" class="container tab-pane fade"><br>
      <form role="form" method="post"> 
 		<label>대분류</label>
		<select class="cate-1" name="lc_code"></select>
		<div class="input-group mb-3">
	    	<input type="text" class="form-control" name="mc_name" placeholder="중분류 카테고리명">
	    	<input type="text" class="form-control" name="mc_pr_code" placeholder="중분류 카테고리 코드">
	    <div class="input-group-append">
	    	<button class="btn btn-outline-success">등록</button>
	  	</div>
	  </div>
	  <table class="table table-striped">
	    <thead>
	      <tr>
	        <th>카테고리명</th>
	        <th>카테고리코드</th>
	      </tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${list}" var="mc">
		      <tr>
		        <td>${mc.mc_name}</td>
		        <td>${mc.mc_pr_code}</td>
		      </tr>
	      </c:forEach>
	    </tbody>
  	  </table>		
	 </form>
    </div>
  </div>
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
		}else if(tb_name == 'medium_category'){
			str += '<option value="0">중분류</option>'
			for(ca of list){
				str += '<option value="'+ca.mc_pr_code+'">'+ca.mc_name+'</option>'
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