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
   
   
   String content = request.getParameter("content");
   content = content.replace("\r\n", "<br>");   
   System.out.println("insertdb: "+id);

   //   DB연결
     
         String sql = "INSERT INTO qanda (idx, NAME, SUBJECT, CONTENT, gup, gup2, lev, seq, id)"+
        		 "VALUES (qanda_"+id+"_seq.nextval, '" + request.getParameter("name") + "', '"
        				 + request.getParameter("title") + "', '"
        				 + content + "' ,qanda_" + id + "_seq.currval, '" + id + "', 0, 0, '" + id + "')"; 
        				 
        				 
        		 
        out.println("insertdb:"+sql);
        		 
         pstmt = conn.prepareStatement(sql);
         pstmt.executeUpdate();
         
      PrintWriter script = response.getWriter();
      script.println("<script>");
      String url="location.href='../../qanda.jsp?id="+id+"'";
		script.println(url);
		script.println("</script>"); 
%>
<!-- DB 연결 끝 -->

</body>
</html>