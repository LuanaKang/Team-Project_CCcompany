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
<%@ include file="./basis_db.jsp" %>
<%int idx = Integer.parseInt(request.getParameter("idx"));%>
<!-- DB 연결 -->
<% 
	ArrayList<String> basket_product = new ArrayList<String>();
	ArrayList<String> basket_brand = new ArrayList<String>();
	ArrayList<Integer> basket_price = new ArrayList<Integer>();
	ArrayList<Integer> basket_idx = new ArrayList<Integer>();
	// DB연결
	      stmt = conn.createStatement();
	      String dtest = "select * from product where idx=" + idx;		/* 신제품 순서 */
	      pstmt = conn.prepareStatement(dtest);
	      rs = pstmt.executeQuery();
	      while (rs.next()) {
	    	  basket_product.add(rs.getString("PRODUCTNAME"));
	    	  basket_brand.add(rs.getString("brandname"));
	    	  basket_price.add(rs.getInt("PRICE"));
	    	  basket_idx.add(rs.getInt("idx"));
	      }
	  //    out.println(TV_idx);
	
	%>
<!-- DB 연결 끝 -->


<%-- <%=TV_ProductName%>
<%=TV_BrandName%>
<%=TV_Price%>
<%=TV_Storagedate%>
<%=TV_idx%> --%>


</body>
</html>