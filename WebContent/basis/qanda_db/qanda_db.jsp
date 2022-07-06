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
   ArrayList<String> qandaname = new ArrayList<String>();
   ArrayList<Integer> qandaidx = new ArrayList<Integer>();
   ArrayList<String> qandasubject = new ArrayList<String>();
   ArrayList<String> qandacontent = new ArrayList<String>();
   ArrayList<Date> qandawritedate = new ArrayList<Date>();
   ArrayList<Integer> qandalev = new ArrayList<Integer>();
   ArrayList<Integer> qandarownum = new ArrayList<Integer>();
   ArrayList<String> userid = new ArrayList<String>();
   ArrayList<Integer>rnum;
   ArrayList<String> writeid = new ArrayList<String>();
   

      
%>


</body>
</html>