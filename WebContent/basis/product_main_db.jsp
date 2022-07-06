<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="./basis_db.jsp" %>
<!-- DB 연결 -->
<%!
	ArrayList<String> best_ProductName = new ArrayList<String>();
	ArrayList<String> best_BrandName = new ArrayList<String>();
	ArrayList<Integer> best_Price = new ArrayList<Integer>();
	ArrayList<Date> best_Storagedate = new ArrayList<Date>(); 
	ArrayList<Integer> best_idx = new ArrayList<Integer>();
	ArrayList<String> new_ProductName = new ArrayList<String>();
	ArrayList<String> new_BrandName = new ArrayList<String>();
	ArrayList<Integer> new_Price = new ArrayList<Integer>();
	ArrayList<Date> new_Storagedate = new ArrayList<Date>(); 
	ArrayList<Integer> new_idx = new ArrayList<Integer>();
	
	ArrayList<Integer> best_rnum = new ArrayList<Integer>();
	ArrayList<Integer> new_rnum = new ArrayList<Integer>();
	
	
	
	String productname;
	String brandName; 
	int price;
	String storagedate;
	
	String img;
	
	String name;
	String address; 
	String email;
%>



</body>

</html>