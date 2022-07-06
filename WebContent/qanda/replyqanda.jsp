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
		theForm.submit();
	}
}

</script>

<body>

<% request.setCharacterEncoding("utf-8"); %>
<%
	String username = request.getParameter("name");
	String usersubject = request.getParameter("subject");
	String usercontent = request.getParameter("content");
	int seq = Integer.parseInt(request.getParameter("seq"));
	int gup = Integer.parseInt(request.getParameter("gup"));
	int lev = Integer.parseInt(request.getParameter("lev"));  
	
	lev = lev+1;
	seq = seq+1;
%>

<div class="col p-3"> <!-- 이 안에 내용 적어주세요 -->
	<div class="container">
		<h5 class="text-center" style="font-weight:bold;">문의 내역 답변하기</h5>
		<table class="table table-bordered" >
		    <tr style="height:5vh;">
		      <th style="width:10%;">이름</th>
		      <td><%=request.getParameter("name") %></td>
		    </tr>
		    <tr style="height:5vh;">
		      <th>제목</th>
		      <td><%=request.getParameter("subject") %></td>
		    </tr>
		    <tr rowspan="5">
		      <th>내용</th>
		   	  <td><%=request.getParameter("content") %></td>
		   	</tr>
		</table>
		<br>
		<form name="qanda" action="../basis/qanda_db/replyqanda_db.jsp?" method="get">
		  
		  <div class="form-group align-items-center" style="display:none;">
		  <input type=text class="form-control" id="exampleFormControlInput1" name="gup" value=<%=gup %> >
		  <input type=text class="form-control" id="exampleFormControlInput1" name="seq" value=<%=seq %> >
		  <input type=text class="form-control" id="exampleFormControlInput1" name="lev" value=<%=lev %> >
		  </div>
		  
		  <div class="form-group align-items-center">
		    <label for="exampleFormControlInput1" style="font-weight:bold;">이름</label>
		    <!-- &nbsp;&nbsp;&nbsp;&nbsp;관리자 -->
		    <input type=text class="form-control" id="exampleFormControlInput1" name="name" value="관리자" placeholder="이름을 입력해주세요.">
		    <input type=text name="userid" value="<%=request.getParameter("userid") %>" style="display: none;">
		  </div>
		  
		  <div class="form-group align-items-center">
		    <label for="exampleFormControlInput1" style="font-weight:bold;">제목</label>
		    <input type=text class="form-control" id="exampleFormControlInput1" name="subject"  value= "<%=username.trim()%>님 답변드립니다.^^"  placeholder="제목을 입력해주세요.">
		  </div>
		 
		  
		  <div class="form-group">
		    <label for="exampleFormControlTextarea1" style="font-weight:bold;">내용</label>
		    <textarea name="content" class="form-control" id="exampleFormControlTextarea1" rows="7"  cols="20" wrap="hard">
<%=username.trim() %>님 안녕하세요.
저희 홈페이지를 찾아주셔서 감사드립니다.
.
.
.
더 궁금하신 점이 있으시면 1588-****번으로 전화 주시면 친절히 상담해드리겠습니다.
감사합니다.
		    </textarea>
		  </div>
		  <div class="text-right">
			  <button type="button" class="btn btn-primary mb-2" onclick="check_onclick()">저장</button>
			  <button type="button" class="btn btn-secondary mb-2" onclick="history.back()">취소</button>
		  </div>
		</form>
		<br><br><br><br><br><br>
		
		
		
	</div>
	
</div></div></div> <!-- 이 안에 내용 적어주세요 끝 -->
</script>
</body>
</html>