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
<%@include file="../basis/basis_db.jsp" %>
<%
   int idx = Integer.parseInt(request.getParameter("idx"));
   String id = request.getParameter("id");

   //   DB연결
         String sql = "delete from qanda where idx = "+idx+" and id='"+id+"'";
         pstmt = conn.prepareStatement(sql);
         pstmt.executeUpdate();
%>
<!-- DB 연결 끝 -->
<input type="text" id="iid" value="<%=id %>">
<input type="text" id="nname" value="<%=request.getParameter("name") %>">
</body>
<script type="text/javascript">
	var id = $('#iid').val();
	var name = $('#nname').val();
	alert('삭제가 완료되었습니다.');
	location.href="../qanda.jsp?id="+id+"&name="+name;
</script>
</html>