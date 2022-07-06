<%@page import="java.net.URLEncoder"%>
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
<script type="text/javascript">
	location.href="../../qanda.jsp?id=admin&name=관리자";
</script>

<body>
<%request.setCharacterEncoding("utf-8"); %>
<%@include file="../basis_db.jsp" %>
<%
   String name = request.getParameter("name");
   String subject = request.getParameter("subject");
   String content = request.getParameter("content");
   int gup = Integer.parseInt(request.getParameter("gup"));
   int lev = Integer.parseInt(request.getParameter("lev"));
   int seq = Integer.parseInt(request.getParameter("seq"));
   String gup2 = request.getParameter("userid");
   
   content = content.replace("\r\n", "<br>");

   //   DB연결
         String sql = "update qanda set seq = seq + 1 where gup = " + gup + " and seq >= " + seq + "and gup2='"+gup2+"'";
         pstmt = conn.prepareStatement(sql);
         pstmt.executeUpdate();
         sql = "insert into qanda (idx, name, subject, content, gup, gup2, lev, seq, id)" +  
        			"values (qanda_admin_seq.nextval,'"+  name + "', '" +
         			subject + "', '" + content + "', '" + gup + "', '" + gup2 + "', '" + lev + "', '" + seq + "', 'admin' )";  
         pstmt = conn.prepareStatement(sql); 
         pstmt.executeUpdate(); 
        
%>



</body>
</html>