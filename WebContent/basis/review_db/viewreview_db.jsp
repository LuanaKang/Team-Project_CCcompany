<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<%request.setCharacterEncoding("utf-8"); %>
<%@include file="../basis_db.jsp" %>
<%
	String userid = request.getParameter("userid");
	int product_idx = Integer.parseInt(request.getParameter("product_idx"));
	String review_num = request.getParameter("review_num");
	System.out.println("viewuserid="+userid);
%>

<%!
	String writeid;
	String review_content;
	String review_title;
	int review_star;
	Date review_regdate;
%>
<%
         String sql = "SELECT * FROM review_table where product_idx="+ product_idx + " and review_num=" + review_num;
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         while (rs.next()) {
        	 writeid = URLEncoder.encode(rs.getString("user_id"));
        	 review_title = URLEncoder.encode(rs.getString("REVIEW_TITLE"));
        	 review_content = URLEncoder.encode(rs.getString("REVIEW_CONTENT"));
        	 review_star = rs.getInt("review_star");
        	 review_regdate = rs.getDate("REVIEW_REGDATE");
        	 
         }
         System.out.println("viewreview_db: "+review_title);
      
         String uurl = "../../review/viewreview.jsp?writeid="+writeid+"&review_title="+review_title+"&review_content="+review_content+"&review_regdate="+review_regdate + 
        		 "&userid="+userid+"&product_idx="+product_idx+"&review_star="+review_star;
         
         response.sendRedirect(uurl);   
         out.println(uurl);
   
%>
<!-- DB 연결 끝 -->


</body>
</html>