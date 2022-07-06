<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ㅇㅇ홈페이지</title>
<link rel="stylesheet" href="./css/basis_Su.css">
<!-- 부트스트랩 4.6 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
</head>

<script type="text/javascript">
function check_onclick(){
	theForm=document.review;
	
	if(theForm.title.value==""){
		alert("제목을 입력해주세요.");
		return theForm.title.focus();
	}
	else if(!theForm.content.value.replace(/(^\s*)|(\s*$)/gi, "")){
	      alert("내용을 입력해주세요.");
	      return theForm.content.focus();
	}  
	else{
		theForm.submit();
	}
}

</script>

<!-- 로그인 기능과 연동해서 이름 자동으로 불러오게 하기 -->
<body>
<% 
	String id = request.getParameter("id");
 	int idx = Integer.parseInt(request.getParameter("idx"));
%>

<div class="col p-3"> <!-- 이 안에 내용 적어주세요 -->
	<div class="container">
		<h3 class="text-center">리뷰 작성</h3>
		<form name="review" action="../basis/review_db/insertreview_db.jsp?idx=<%=idx %>" method="post">
		  <div class="form-group align-items-center">
		    <label for="exampleFormControlInput1">ID</label>
		    <input readonly type=text class="form-control" id="exampleFormControlInput1" name="id" value="<%=id %>" >
		  </div>
		  
		  <div class="form-group align-items-center">
		    <label for="exampleFormControlInput1">별점</label><br>
		    <input type="radio"  id="star5" name="star" value="5" checked="checked"><label> ★★★★★</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <input type="radio"  id="star4" name="star" value="4" ><label> ★★★★☆</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <input type="radio"  id="star3" name="star" value="3" ><label> ★★★☆☆</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <input type="radio"  id="star2" name="star" value="2" ><label> ★★☆☆☆</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <input type="radio"  id="star1" name="star" value="1" ><label> ★☆☆☆☆</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  </div>
		  
		  <div class="form-group align-items-center">
		    <label for="exampleFormControlInput1">제목</label>
		    <input type=text class="form-control" id="exampleFormControlInput1" name="title" placeholder="제목을 입력해주세요.">
		  </div>
		 
		  
		  <div class="form-group">
		    <label for="exampleFormControlTextarea1">내용</label>
		    <textarea name="content" class="form-control" id="exampleFormControlTextarea1" rows="7"></textarea>
		  </div>
		  <div class="text-right">
			  <button type="button" class="btn btn-primary mb-2" onclick="check_onclick()">작성</button>
			  <button type="button" class="btn btn-secondary mb-2" onclick="history.back()">취소</button>
		  </div>
		</form>
	
	
	</div>


<!-- 이 안에 내용 적어주세요 끝 -->
</div></div></div> 
<br><br><br><br><br>
</body>
</html>