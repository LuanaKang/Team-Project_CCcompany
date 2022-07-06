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
	if(theForm.title.value==""){
		alert("제목을 입력해주세요.");
		return theForm.title.focus();
	}
	else if(!theForm.content.value.replace(/(^\s*)|(\s*$)/gi, "")){
	      alert("내용을 입력해주세요.");
	      return theForm.content.focus();
	}  
	else{
		if (confirm("수정하시겠습니까?") == true){    
			theForm.submit();
		 }else{   //취소
		     return false;
		 }
	}
}
</script>

<body>
<%! String id; %>
<%
	request.setCharacterEncoding("utf-8"); 
	id = request.getParameter("id");
	System.out.println("update:"+id);
%>
<div class="col p-3"> <!-- 이 안에 내용 적어주세요 -->
<div class="container">
		<h3 class="text-center">Q&A수정하기</h3>
		<form name="qanda" action="../basis/qanda_db/updateqanda_db.jsp" method="get">
		<input type="text" name="id" id="id" value="<%=id %>" style="display:none;">
		<input type="text" name="admin" id="admin" value="<%=request.getParameter("admin") %>" style="display:none;">
		<input type="text" name="name" id="name" value="<%=request.getParameter("name") %>" style="display:none;">
		  <div class="form-group align-items-center">
		    <label for="exampleFormControlInput1">이름</label>
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("name") %>
		  </div>
		  
		  <div class="form-group align-items-center">
		    <label for="exampleFormControlInput1">제목</label>
		    <input type=text class="form-control" id="exampleFormControlInput1" name="subject" placeholder="제목을 입력해주세요." value=<%=request.getParameter("subject") %>>
		    <input type=text class="form-control" id="exampleFormControlInput1" name="idx"  value=<%=request.getParameter("idx") %> style="display:none;">
		  </div>
		 
		  
		  <div class="form-group">
		    <label for="exampleFormControlTextarea1">내용</label>
		    <textarea name="content" class="form-control" id="exampleFormControlTextarea1" rows="7">
<%=request.getParameter("content").replace("<br>", "\r\n") %>

		    </textarea>
		  </div>
		  <div class="text-right">
			  <button type="button" class="btn btn-primary mb-2" onclick="check_onclick()">수정하기</button>
			  <button type="button" class="btn btn-secondary mb-2" onclick="history.back()">취소</button>
		  </div>
		</form>
	
	
	</div>



</div></div></div> <!-- 이 안에 내용 적어주세요 끝 -->
<br><br><br><br><br><br><br><br>
</body>
</html>