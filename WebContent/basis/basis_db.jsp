<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- 페이지마다 db 연결정보 바꾸는게 화딱지나서 만든 db 기본 정보 파일 -->
		<!-- db 기본 정보가 들어있으니 각 db를 불러오는 페이지마다 import 해서 사용하시면 됩니다. -->
		<!-- db 연결 정보 id만 입력하시면 됩니다. -->
		
<% 
	Connection conn = null;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	// DB연결
	   try {
	      Class.forName("oracle.jdbc.driver.OracleDriver");
	      String url = "jdbc:oracle:thin:@localhost:1521:xe";
	      conn = DriverManager.getConnection(url, "su", "0000");
	      // out.println("연결성공: " + conn + "<br/>");
	     
	   } catch (ClassNotFoundException e) {
	      out.println("드라이버 클래스가 없거나 읽어올 수 없습니다.<br/>");
	   } catch (SQLException e) {
	      e.printStackTrace();
	      out.println("데이터베이스 접속 정보가 올바르지 않습니다.<br/>");
	   }
	
	%>
<!-- DB 연결 끝 -->


</body>
</html>