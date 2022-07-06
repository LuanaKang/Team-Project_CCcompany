<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<%@include file="../basis_db.jsp" %>
<%
   String id = request.getParameter("id");
   int idx = Integer.parseInt(request.getParameter("idx"));
   int star = Integer.parseInt(request.getParameter("star"));
   
   String title = request.getParameter("title");
   String content = request.getParameter("content");
   content = content.replace("\r\n", "<br>");   

   //   DB연결
     
       String sql = "INSERT INTO review_table (PRODUCT_IDX, USER_ID, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_STAR, REVIEW_NUM)"+
        		 "VALUES (" + idx + ", '" + id + "', '"
        				 + title + "', '"
        				 + content + "', " + star+", REVIEW_NUM.nextval )"; 
        				 
        				 
        		 
        System.out.println("insertdb:"+sql);
        		 
         pstmt = conn.prepareStatement(sql);
         pstmt.executeUpdate();
         
    
%>
<!-- DB 연결 끝 -->

<script>
	alert('리뷰가 저장되었습니다.');
    var url="/CCcompany/team_main.jsp"; 
	location.href=url;
</script>
</body>
</html>