<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.URLEncoder"%>
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

<body>
<%request.setCharacterEncoding("utf-8"); %>

<%
	String userid = URLDecoder.decode(request.getParameter("userid") );
	String review_title = URLDecoder.decode(request.getParameter("review_title"));
	String review_content = URLDecoder.decode(request.getParameter("review_content"));
	String writeid = request.getParameter("writeid");
	int review_star = Integer.parseInt(request.getParameter("review_star"));
	String review_regdate = request.getParameter("review_regdate");
%>


<div class="col p-3"> <!-- 이 안에 내용 적어주세요 -->
	<div class="container">
		<table class="table table-bordered" >
		    <tr style="height:5vh;">
		      <th style="width:10%;">평점</th>
		      <td>
   
	                <% if(review_star == 1) {%>
	                	<span>★☆☆☆☆</span>
	                <%} 
	                 else if(review_star == 2) {%>
	                	<span>★★☆☆☆</span>
	                <%} 
	                 else if(review_star == 3) {%>
	                	<span>★★★☆☆</span>
	                <%} 
	                 else if(review_star == 4) {%>
	                	<span>★★★★☆</span>
	                <%} 
	                 else{
	                %>
	                <span>★★★★★</span>
	                <%} %>
			</td>
		    </tr>
		    <tr style="height:5vh;">
		      <th style="width:10%;">아이디</th>
		      <td><%=writeid%></td>
		    </tr>
		    <tr style="height:5vh;">
		      <th>제목</th>
		      <td><%=review_title %></td>
		    </tr>
		    <tr rowspan="5">
		      <th style="height:40vh;">내용</th>
		   	  <td><%=review_content %></td>
		   	</tr>
		   <tr>
		   		<td colspan="4" align="center">
		   			<button type="button" class="btn btn-secondary mb-2" onclick="history.back()">목록으로</button>
		   		</td>
		   </tr>
		</table>
	</div>
	<br><br><br>
</div>
</script>
</body>
</html>