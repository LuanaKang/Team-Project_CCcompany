<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="./css/basis_Su.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<title>Insert title here</title>
<body>
<%@ page import="java.text.*" %> 
<% NumberFormat nf = NumberFormat.getNumberInstance(); %>
<%@ include file="./basis/navigation.jsp" %>	<!-- navigation 불러옴 -->
<%@ include file="./basis/category.jsp" %>		<!-- category 불러옴 --> 
<%@ include file="./basis/footer.jsp" %>		<!-- footer 불러옴 --> 
<%@ include file="./basis/product_main_db.jsp" %>		<!-- TV_db정보 -->

<%
	String [] index = request.getParameterValues("index");

	String userid = String.valueOf(session.getAttribute("id"));
	
	ArrayList<Integer> productIdx = (ArrayList) (session.getAttribute("productIdx")); 
	
	ArrayList<Integer> productCount = (ArrayList) (session.getAttribute("productCount")); 

	ArrayList<Integer> productGup = (ArrayList) (session.getAttribute("productGup")); 

	ArrayList<String> productImg = (ArrayList) (session.getAttribute("productImg")); 
	
	for(int i=0; i<index.length; i++){
		productIdx.remove(Integer.parseInt(index[i]));
		productCount.remove(Integer.parseInt(index[i]));
		productGup.remove(Integer.parseInt(index[i]));
		productImg.remove(Integer.parseInt(index[i]));
	}
	
	System.out.println("delCart productIdx= "+productIdx);
	System.out.println("delCart productCount= "+ productCount);
	System.out.println("delCart productGup= "+productGup);
	System.out.println("delCart productImg= "+productImg);
	
	session.setAttribute("productCount", productCount);
	session.setAttribute("productIdx", productIdx);
	session.setAttribute("productImg", productImg);
	session.setAttribute("productGup", productGup);
	
	
%>

<script>
	alert('삭제가 완료되었습니다.');
	location.href='./cart.jsp';
</script>

</body>
</html>