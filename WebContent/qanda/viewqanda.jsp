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

<script type="text/javascript">
	function delete_ok(idx,id,name,admin){
		if(admin=="admin"){
			id = "admin";
		}
		 if (confirm("삭제하시겠습니까??") == true){    //확인
		     location.href="deleteqanda.jsp?idx="+idx+"&id="+id+"&name="+name;
		 }else{   //취소
		     return false;
		 }
		
	}
</script>

<body>
<%request.setCharacterEncoding("utf-8"); %>

<%
	String name = URLEncoder.encode(request.getParameter("name") );
	String subject = URLEncoder.encode(request.getParameter("subject"));
	String content = URLEncoder.encode(request.getParameter("content"));
	int lev = Integer.parseInt(request.getParameter("lev"));
	int idx = Integer.parseInt(request.getParameter("idx"));
	System.out.println("viewqanda"+idx);
	boolean flag = Boolean.parseBoolean(request.getParameter("flag"));
	String id = request.getParameter("id");
	String writeid = request.getParameter("writeid");
%>


<div class="col p-3"> <!-- 이 안에 내용 적어주세요 -->
	<div class="container">
		<h3 class="text-center" style="font-weight:bold;">문의글 보기</h3>
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
		      <th style="height:40vh;">내용</th>
		   	  <td><%=request.getParameter("content") %></td>
		   	</tr>
		   <tr>
		   		<td colspan="4" align="center">
		   			
		   			<button type="button" class="btn btn-secondary mb-2" onclick="history.back()">목록으로</button>
		   			<%
		   				if(flag && id.equals(writeid)){
		   			%>
		   			<button type="button" class="btn btn-secondary mb-2" onclick="location.href='./updateqanda.jsp?name=<%=name%>&subject=<%=subject%>&content=<%=content%>&idx=<%=idx%>&id=<%=id%>&admin=<%="admin"%>'">수정하기</button>
		   			<%
		   				} 
		   				else{
		   					
		   				}
		   				
		   			%>
		   			<%
		   				if(id.equals(writeid)){ 
		   			%>
		   				<button type="button" class="btn btn-secondary mb-2" onclick="delete_ok(<%=idx%>, '<%=id%>', '<%=name%>', '<%=request.getParameter("admin")%>')">삭제하기</button>
		   			<%
		   				}
		   				else{
		   					
		   				}
		   				if(lev == 0 && request.getParameter("admin").equals("admin")){ /* 답변이 아닐 때 */
		   			%>
		   			<button type="button" class="btn btn-secondary mb-2" onclick="location.href='./replyqanda.jsp?name=<%=name %>&subject=<%=subject%>&content=<%=content%>&lev=<%=request.getParameter("lev")%>&gup=<%=request.getParameter("gup")%>&seq=<%=request.getParameter("seq")%>&userid=<%=id%>'">답변하기</button>
		   			<%
		   				}
		   				else{
		   			%>		
		   			<button type="button" style="display: none;" class="btn btn-secondary mb-2" onclick="location.href='./replyqanda.jsp?name=<%=name %>&subject=<%=subject%>&content=<%=content%>&lev=<%=request.getParameter("lev")%>&gup=<%=request.getParameter("gup")%>&seq=<%=request.getParameter("seq")%>'">답변하기</button>
		   			
		   			<%	
		   				}
		   			%>
		   		</td>
		   </tr>
		</table>
	</div>
	<br><br><br>
</div>
</script>
</body>
</html>