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
	theForm=document.qanda;
	if(theForm.name.value==""){
		alert("이름을 입력해주세요.");
		return theForm.name.focus();
	}
	else if(theForm.title.value==""){
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
%>

<div class="col p-3"> <!-- 이 안에 내용 적어주세요 -->
	<div class="container">
		<h3 class="text-center">Q&A 남기기</h3>
		<form name="qanda" action="../basis/qanda_db/insertqanda_db.jsp?id=<%=id %>" method="post">
		  <div class="form-group align-items-center">
		    <label for="exampleFormControlInput1"></label>
		    <input type=text class="form-control" id="exampleFormControlInput1" name="name" value="<%=request.getParameter("name") %>" placeholder="이름을 입력해주세요.">
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
			  <button type="button" class="btn btn-primary mb-2" onclick="check_onclick()">접수</button>
			  <button type="button" class="btn btn-secondary mb-2" onclick="history.back()">취소</button>
		  </div>
		</form>
	
	
	</div>


<!-- 이 안에 내용 적어주세요 끝 -->
</div></div></div> 
<br><br><br><br><br>
</body>
</html>