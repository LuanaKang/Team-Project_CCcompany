<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<%@include file="../basis_db.jsp" %>
<%
   int idx = Integer.parseInt(request.getParameter("idx"));
   String subject = request.getParameter("subject");
   String content = request.getParameter("content");
   content = content.replace("\r\n", "<br>");
   String id = request.getParameter("id");
   String name = request.getParameter("name");
   String admin = request.getParameter("admin");
   System.out.println("admin="+admin);
   System.out.println("update_db: " +id );
		   
  
	

         String sql = "update qanda set subject = '" + subject + "', content = '" + content +  "' where idx = " + idx + " and id='"+id+"'";
         pstmt = conn.prepareStatement(sql);
         pstmt.executeUpdate();
         
    
%>
<!-- DB 연결 끝 -->
<input type="text" id="idd" value="<%=id %>" >
<input type="text" id="nname" value="<%=name %>" >
<input type="text" id="admin" value="<%=admin %>" >

</body>
<script type="text/javascript">
	var admin = $('#admin').val();
	var id;
	var name;
	if(admin == "admin"){
		id = "admin";
		name = "관리자";
	}
	else{
		id = $('#idd').val();
		name = $('#nname').val();
	}
	alert('수정이 완료되었습니다.' );
	location.href="../../qanda.jsp?id="+id+"&name="+name;
</script>
</html>