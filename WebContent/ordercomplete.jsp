<%@page import="javax.websocket.Session"%>
<%@page import="org.apache.catalina.connector.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CCcompany</title>
</head>
<body>
<%!
	ArrayList<Integer> idx = new ArrayList<>();
	ArrayList<Integer> count = new ArrayList<>() ;
%>
<%String id= request.getParameter("id");%> 
<%
	String index = request.getParameter("idx");
	String [] iidx = index.split(",");
%>
<%
	String pcount = request.getParameter("count");
	String [] ccount = pcount.split(",");
%>
<%
	for(int i=0; i<iidx.length; i++){
		idx.add(Integer.parseInt(iidx[i]));
		count.add(Integer.parseInt(ccount[i]));
	}

%>
<%String ordername = request.getParameter("ordername"); %>
<%String orderaddress = request.getParameter("orderaddress"); %>
<%String orderemail = request.getParameter("orderemail"); %>

<%@ include file="./basis/product_main_db.jsp" %>

<!--idx 해당하는 데이터의 정보를 select로 받아오고, 새로운 테이블에 insert로 넣는다. -->

<% 
for(int i=0; i<count.size();i++){
	stmt = conn.createStatement();
	String dtest = "insert into PURCHASE VALUES ("+ count.get(i) + ", " + idx.get(i) + ", '" + id + "', '" + ordername + "', '" + orderaddress + "', '" + orderemail +"'," + "sysdate)";
	System.out.println(dtest);
	pstmt = conn.prepareStatement(dtest);
	pstmt.executeUpdate();
}
%>  

<% 
	idx.clear();
	count.clear();
/* 장바구니 세션 초기화 */	

	session.removeAttribute("productIdx");
	session.removeAttribute("productCount");
	session.removeAttribute("productGup");
	session.removeAttribute("productImg");
	
%>

<%
	out.println("<script>alert('주문이 완료되었습니다.');</script>");
	out.println("<script>location.href='team_main.jsp';</script>");
%>

	

</body>
</html>