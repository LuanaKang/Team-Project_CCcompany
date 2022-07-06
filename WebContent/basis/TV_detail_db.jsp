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
<%@include file="./basis_db.jsp" %>
<%int idx = Integer.parseInt(request.getParameter("idx"));%>
<!-- DB 연결 -->
<% 
	
	ArrayList<String> TV_ProductName = new ArrayList<String>();
	ArrayList<String> TV_BrandName = new ArrayList<String>();
	ArrayList<Integer> TV_Price = new ArrayList<Integer>();
	ArrayList<Date> TV_Storagedate = new ArrayList<Date>(); 
	ArrayList<Integer> TV_idx = new ArrayList<Integer>();
	// DB연결
    stmt = conn.createStatement();
    String dtest = "select * from product where gup = '티비' and idx=" + idx;		/* 신제품 순서 */
    pstmt = conn.prepareStatement(dtest);
    rs = pstmt.executeQuery();
    while (rs.next()) {
  	  TV_ProductName.add(rs.getString("PRODUCTNAME"));
  	  TV_BrandName.add(rs.getString("brandname"));
  	  TV_Price.add(rs.getInt("PRICE"));
  	  TV_Storagedate.add(rs.getDate("storagedate"));
  	  TV_idx.add(rs.getInt("idx"));
    }
%>
<!-- DB 연결 끝 -->

</body>
</html>