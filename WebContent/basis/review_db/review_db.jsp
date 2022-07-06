<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
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
<body>

<!-- DB 연결 -->
<%@include file="../basis_db.jsp" %>

<%!
	int totalCount;
%>

<%
   ArrayList<Integer> review_num = new ArrayList<Integer>();
   ArrayList<String> review_goods_name = new ArrayList<String>();
   ArrayList<String> review_title = new ArrayList<String>();
   ArrayList<String> review_content = new ArrayList<String>();
   ArrayList<Date> review_regdate = new ArrayList<Date>();
   ArrayList<Integer> review_star = new ArrayList<Integer>();
   ArrayList<Integer> review_buy_opt = new ArrayList<Integer>();
   ArrayList<String> writeid = new ArrayList<String>();

   String wi;   
%>


</body>
</html>