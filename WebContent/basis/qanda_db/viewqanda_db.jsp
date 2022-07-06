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
	int idx = Integer.parseInt(request.getParameter("idx"));
	String id = request.getParameter("id");
	String writeid = request.getParameter("writeid");
	System.out.println("viewwriteid="+writeid);
%>

<%!
	String name;
	String content;
	String subject;
	Date writedate;
	int seq;
	int gup;
	int lev;
	ArrayList<Integer> levarray = new ArrayList<Integer>();
	boolean flag;
%>
<%
         String sql = "SELECT * FROM qanda where idx="+idx + " and id='" + writeid + "'";
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         while (rs.next()) {
        	 name = URLEncoder.encode(rs.getString("name"));
        	 subject = URLEncoder.encode(rs.getString("subject"));
        	 content = URLEncoder.encode(rs.getString("content"));
        	 writedate = rs.getDate("writedate");
        	 seq = rs.getInt("seq");
        	 lev = rs.getInt("lev");
        	 gup = rs.getInt("gup");
        	 
         }
         
         sql = "SELECT * FROM qanda WHERE GUP = "+ gup + " AND lev > 0 and id='"+id+"'";
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         while (rs.next()) {
        	 levarray.add(rs.getInt("lev"));
         }
         if(levarray.size() == 0){	/* 답변이 달렸나 확인하기 위한 메소드 */
        	 flag = true;
         	 levarray.clear();
         }
         else{
        	 flag = false;
        	 levarray.clear();
         }
         
         String uurl = "../../qanda/viewqanda.jsp?name="+name+"&subject="+subject+"&content="+content+"&writedate="+writedate + 
        		 "&seq="+seq+"&gup="+gup+"&lev="+lev+"&idx="+idx+"&flag="+flag + "&id="+id+"&admin="+request.getParameter("admin")+"&writeid="+writeid;
         
         response.sendRedirect(uurl);   
         out.println(uurl);
   
%>
<!-- DB 연결 끝 -->


</body>
</html>