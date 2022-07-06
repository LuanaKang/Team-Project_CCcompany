<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/basis_Su.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<title>Insert title here</title>
<script type="text/javascript" src="./js/delete.js"></script>
</head>
<body>
<!-- 숫자 3자리마다 , 표시하기 위한 코드 -->

<%@ page import="java.text.*" %> 
<% NumberFormat nf = NumberFormat.getNumberInstance(); %>
<%@ include file="./basis/navigation.jsp" %>	<!-- navigation 불러옴 -->
<%@ include file="./basis/category.jsp" %>		<!-- category 불러옴 --> 
<%@ include file="./basis/footer.jsp" %>		<!-- footer 불러옴 --> 
<%@ include file="./basis/product_main_db.jsp" %>		<!-- TV_db정보 -->
<% int idx = Integer.parseInt(request.getParameter("idx")); %>
<% String userid = request.getParameter("id"); %>
<% int count = Integer.parseInt(request.getParameter("count")); %>	
<% int gup = Integer.parseInt(request.getParameter("gup")); %>	
<% String img = request.getParameter("img"); %>


<%
System.out.println(img);
	stmt = conn.createStatement();
	String dtest = "select * from product where idx = " + idx ;	
	pstmt = conn.prepareStatement(dtest);
	rs = pstmt.executeQuery();
	while (rs.next()) {
		 productname = rs.getString("productname");
		 
	}
	
	System.out.println("count="+count);
	/* System.out.println("cartadd id="+request.getSession().getAttribute("id"));*/
 
	ArrayList<Integer> product_idx = (ArrayList<Integer>) (session.getAttribute("productIdx"));
	
	if (session.getAttribute("productIdx") == null) {
		product_idx = new ArrayList<Integer>();
    }
	product_idx.add(idx);
	session.setAttribute("productIdx", product_idx);
	
	
	ArrayList<Integer> product_count = (ArrayList<Integer>) (session.getAttribute("productCount"));
	
	if (session.getAttribute("productCount") == null) {
		product_count = new ArrayList<Integer>();
    }
	product_count.add(count);
	session.setAttribute("productCount", product_count);

	
	ArrayList<Integer> product_gup = (ArrayList<Integer>) (session.getAttribute("productGup"));
	
	if (session.getAttribute("productGup") == null) {
		product_gup = new ArrayList<Integer>();
    }
	product_gup.add(gup);
	session.setAttribute("productGup", product_gup);
	
	
	session.setAttribute("id", userid);
	
	ArrayList<String> productImg = (ArrayList<String>) (session.getAttribute("productImg"));
	
	if (session.getAttribute("productImg") == null) {
		productImg = new ArrayList<String>();
    }
	productImg.add(img);
	session.setAttribute("productImg", productImg);

%>

<input type="text" style="display:none;" value=<%=productname %> id="productname" >
<input type="text" style="display:none;" value=<%=idx %> id="idx" >
<input type="text" style="display:none;" value=<%=img %> id="img" >
<input type="text" style="display:none;" value=<%=gup %> id="gup" >

<script>
	var cartgo = confirm($('#productname').val()+'이 장바구니에 추가되었습니다. \n 장바구니로 이동하시겠습니까?');
	if(cartgo){
		location.href='./cart.jsp'; 
	}
	else{
		location.href='./productpage.jsp?idx='+$('#idx').val()+'&img='+$('#img').val()+'&gup='+$('#gup').val(); 
	}
</script>


</body>
</html>