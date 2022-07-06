<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
   <jsp:useBean id="user" class="user.userVO" scope="page">
   <jsp:setProperty name="user" property="id"/>
   <jsp:setProperty name="user" property="name"/>
   <jsp:setProperty name="user" property="address"/>
   <jsp:setProperty name="user" property="email"/>
   </jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/basis_Su.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="./js/orderform.js"></script>
<title>주문하기</title>
</head>
<body>
<!-- 숫자 3자리마다 , 표시하기 위한 코드 -->
<%@ page import="java.text.*" %> 
<% NumberFormat nf = NumberFormat.getNumberInstance(); %>
<%@ include file="./basis/navigation.jsp" %>	<!-- navigation 불러옴 -->
<%@ include file="./basis/category.jsp" %>		<!-- category 불러옴 --> 
<%@ include file="./basis/footer.jsp" %>		<!-- footer 불러옴 --> 

<%!
	ArrayList<Integer> idx = new ArrayList<>();
	ArrayList<Integer> count = new ArrayList<>() ;
	ArrayList<String> pname = new ArrayList<>();
	ArrayList<String> bname = new ArrayList<>();
	ArrayList<Integer> priceList = new ArrayList<>();
	int tot = 0;
%>
<%
	String index = request.getParameter("index");
	String [] iidx = index.split(",");
	String pcount = request.getParameter("count");
	String [] ccount = pcount.split(",");
	String pimg = request.getParameter("img");
	String [] img = pimg.split(",");
%>
<%
	for(int i=0; i<iidx.length; i++){
		idx.add(Integer.parseInt(iidx[i]));
		count.add(Integer.parseInt(ccount[i]));
	}

	System.out.println(idx);
	
	/* int [] productCount = Arrays.asList(request.getParameterValues("count")).stream().mapToInt(Integer::parseInt).toArray(); */
	String [] productCount = request.getParameterValues("count");
	/* System.out.println("idx="+idx[0]);
	System.out.println("img="+img[0]); */

	
%>
<% String ide = request.getParameter("id");%>
<%@ include file="./basis/product_main_db.jsp" %>		<!-- TV_db정보 -->
<%
	for(int i=0; i<idx.size(); i++){
		stmt = conn.createStatement();
		String dtest = "select * from product where idx = " + idx.get(i);
		System.out.println("sql= "+ dtest);
		pstmt = conn.prepareStatement(dtest);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			 pname.add(rs.getString("productname"));
			 bname.add(rs.getString("brandName"));
			 priceList.add(rs.getInt("price"));
		}
		System.out.println("pname="+pname);
	}
%>

<%
	stmt = conn.createStatement();
	String ttest = "select * from member where id= '" + ide + "'";	
	pstmt = conn.prepareStatement(ttest);
	rs = pstmt.executeQuery();
	while (rs.next()) {
		 name = rs.getString("name");
		 address = rs.getString("address");
		 email = rs.getString("email");
	}
%>

<!-- 내가 주문하기를 누른 db가져오기 -->

<div class="col p-1" style="margin-left: -25%; margin-top: 5%;"> <!-- 이 안에 내용 적어주세요 -->
<!-- 상품상세페이지에서 주문하기 누르면 나오는 페이지 주문페이지 -->
	<div><h1 class="text-center" style="margin-right: 7%;">주문/결제하기</h1></div><br>
	
		 <table style=" text-align:center; margin-right:10%;">
			    <thead border="1" width="1200" height="50" style="background-color: lightgray;">
			    	<tr>
			    		<th style="width:100vw; table-layout: fixed;">주문자 정보</th>
			    	</tr>
			    </thead>
			    <tbody border="1" width="1200" height="50">
			    
			    	<tr>
			    		<td width="10%" style="font-size: 1em;"> 이름: &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=name %>" id="name" name="name"></td>
					</tr>
			    	<tr>
			    		<td width="10%" style="font-size: 1em;"> 주소: &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=address%>" id="address" name="address"></td>
					</tr>
			    	<tr>
			    		<td width="10%" style="font-size: 1em;"> 이메일: &nbsp;<input type="text" value="<%=email%>" id="email" name="email"></td>
					</tr>
			</tbody>
		</table><br><br><br><br><br>
		<table style=" text-align:center; margin-right:10%;">
		    <thead border="1" width="1200" height="50" style="background-color: lightgray;">
		    	<tr>
		            <th width="20%">제품 사진</th>
		            <th width="20%">제품명</th>
		            <th width="20%">가격</th>
		            <th width="20%">수량</th>
		            <th width="20%">총가격</th>
		         </tr>
		    </thead>
		    <!-- 장바구니에 넣을 때 마다 하나씩 증가하는 데이터 for문 활용 -->
		    <tbody border="1" width="1200" >
	<%
		for(int i=0; i<img.length; i++){
	
	%>
			<tr id="ordertr">
	            <td><img alt="상품 이미지" src="<%=img[i] %>" style="width: 35%; "></td>
	         	<td><%=pname.get(i)%></td>
	            <td><span class="price" ><%=nf.format(priceList.get(i))%></span></td>
	            <td>
	           	 	
					<span class="amount"><%=count.get(i)%></span>&nbsp;
				</td>
	            <td>
	           		 <span class="sum"><%=nf.format(priceList.get(i)*count.get(i))%></span>
	            </td>
	          
	        </tr>
	       
        <%
    		}
    	
    	%>
    	<tr>
    		<td colspan="6" style="text-align: center;" style="height: 30%;">
				<%			
					for(int k=0; k<idx.size(); k++){
						tot += priceList.get(k) * count.get(k);
					}
				%>
				
	            <h3 class="text-center" >합계: <span id="totPrint"><%=nf.format(tot) %></span></h3>	<br>			    		
    		</td>
    	</tr>
    </tbody>
   </table><br><br><br><br><br>

	<button type="button" onclick="order(<%=idx %>, <%=count %>, '<%=ide %>')" class="btn btn-outline-success btn-lg  " style="width: 90%;">주문하기</button>
<br><br><br><br><br><br><br><br><br><br>
	

<%
	idx.clear();
	count.clear();
	pname.clear();
	bname.clear();
	priceList.clear();
	tot=0;

%>

</div></div></div> <!-- 이 안에 내용 적어주세요 끝 -->

</body>
</html>