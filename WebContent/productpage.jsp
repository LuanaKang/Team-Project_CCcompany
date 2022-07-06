<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%-- <%@page import="user.userVO"%>--%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html style="overflow:scroll; width:auto; height:5000px;">
<link rel="stylesheet" href="./css/shop-homepage.css">
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
 <link href="./js/productpage.js" rel="stylesheet">
 <link href="./css/tab.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>CCcompany</title>
</head>
<script src="./js/productpage.js"></script>
<body onload="init();">

<%String img = request.getParameter("img"); %>
<%int idx = Integer.parseInt(request.getParameter("idx"));%> 
<%int gup = Integer.parseInt(request.getParameter("gup")); %>
<%boolean flag=false; %>

<link href="./css/tab.css" rel="stylesheet">
<%@ include file="./basis/footer.jsp" %>		<!-- footer 불러옴 --> 
<%@ include file="./basis/category.jsp" %>		<!-- category 불러옴 --> 
<%@ include file="./basis/navigation.jsp" %>	<!-- navigation 불러옴 --> 
<%@ include file="./basis/product_main_db.jsp" %>		<!-- TV_db정보 -->
<div class="col p-3"> <!-- 이 안에 내용 적어주세요 -->
<%
	stmt = conn.createStatement();
	String dtest = "select * from product where idx = " + idx ;	
	pstmt = conn.prepareStatement(dtest);
	rs = pstmt.executeQuery();
	while (rs.next()) {
		 productname = rs.getString("productname");
		 brandName = rs.getString("brandName");
		 price = rs.getInt("price");
		 storagedate = rs.getString("storagedate");
	}
	
%>


<br><br>
	<div class="container" style="width : 85%;">
			<div class="row" style="display: flex">
				<div class="product_pictures" style="width: 50%">
				<img src="<%=img%>" alt="product" class="productimage">
				</div>
				
				<div class="product_spec" style="width: 50%; margin-top: 20px;" >
					<h2>제품명:<%=productname%></h2> <!-- 제품명 -->
					<h3>브랜드명:<%=brandName%></h3> <!-- 상세설명 -->	
					<p>제조일자:<%=storagedate%></p>
					<hr/>
					
					
					<div style="display: flex">
						<div class="quantity" style="width: 70%">
							<form name="form" method="get">
							수량 : <input type=hidden name="sell_price" value="<%=price%>">
							<input type="text" name="amount" id="amount" value="1" size="3" onchange="change();">
							<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br>
							가격 : <%=price%>
							금액 : <input type="text" name="sum" size="11" id="sum" readonly>원
							<!-- <input type="hidden" id="total"></input> -->
							</form>		
						</div>
						
						<div class="totalprice" style="width: 15%">
						
							<%
				                if(id == null  || id.equals("null")) {
				            %>
							<input type="button" value="주문하기" onclick="location.href='loginpage.jsp'">
							<% 
				                } else {
							%>
							<input type="button" value="주문하기" onclick="order('<%=id%>', <%=idx%>, '<%=img%>')">
							<%
				                }
				            %>
						</div>	
						<div class="totalprice" style="width: 15%">
							<%
				                if(id == null  || id.equals("null")) {
				            %>
							<input type="button" value="장바구니" onclick="location.href='loginpage.jsp'">
							<% 
				                } else {
				                	/* 해당 id 장바구니에 동일 상품 있는지 검사 */
				                	ArrayList<Integer> productIdx = (ArrayList) (session.getAttribute("productIdx"));
				                	if (session.getAttribute("productIdx") == null) { }
				                	else{
					                	for(int j=0; j<productIdx.size(); j++){
					                		if(productIdx.get(j) == idx){
					                			flag = true;
					                		}
					                	}
				                	}	
					                	
				                	if(flag == true){
%>
										<input type="button" value="장바구니" onclick="already()">
<%
				                	}
				                	else{
				                		
							%>
										<input type="button" value="장바구니" onclick="cartgo('<%=id%>', <%=idx%>, '<%=img%>', <%=gup%>)">
							<%
				                	}
				                }
				            %>
						</div>	
					</div>
				<div>
				<hr/>
			 </div>	
	</div>	  
			  
  
	
<div>

<div class="tabmenu" style="width: 1200px">
  <ul>
    <li id="tab1" class="btnCon"> <input type="radio" checked name="tabmenu" id="tabmenu1">
      <label for="tabmenu1">상품설명</label>
      <div class="tabCon" style="width: 1200px">
		<br><br><br>
      	<div style="width: 1200px">
      	<div>
      		<%
      		String ss = "./images/electricimg/01-01-01.JPG";
      		ss = ss.substring(0,22);
      		System.out.println("ss=" + ss);
			
      		String mm ="";
      		if(gup == 1) {
      		 mm ="0" + idx; 
      		}else if (gup == 2) {
      		 mm = "0" + Integer.toString(idx - 8);
      		} else {
      		mm = "0" + Integer.toString(idx - 16);
      		}
      		%> 
    		<img src="<%=ss%><%=gup%>-<%=mm%>-01.JPG" alt="product1" class="productimage" style="max-width: 60Opx; height: auto;">
    	</div>
    	<div>
    		<img src="<%=ss%><%=gup%>-<%=mm%>-02.JPG" alt="product1" class="productimage" style="max-width: 60Opx; height: auto;">
    	</div>
    	<div>
    		<img src="<%=ss%><%=gup%>-<%=mm%>-03.JPG" alt="product1" class="productimage" style="max-width: 60Opx; height: auto;">
    	</div>    	
     	<div>
    		<img src="<%=ss%><%=gup%>-<%=mm%>-04.JPG" alt="product1" class="productimage" style="max-width: 60Opx; height: auto;">
    	</div>   	
    	<div>
    		<img src="<%=ss%><%=gup%>-<%=mm%>-05.JPG" alt="product1" class="productimage" style="max-width: 60Opx; height: auto;">
    	</div>    	
    	<div>
    		<img src="<%=ss%><%=gup%>-<%=mm%>-06.JPG" alt="product1" class="productimage" style="max-width: 60Opx; height: auto;">
    	</div>    	
    	</div>	
      </div>
    </li>
    <li id="tab2" class="btnCon" ><input type="radio" name="tabmenu" id="tabmenu2">
      <label for="tabmenu2">리뷰</label>
      <div class="tabCon" style="width: 1200px; height:80vh;">
      	<iframe src="./review.jsp?id=<%=id %>&product_idx=<%=idx %>" style="width:100%; height:100%;" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 vspace=0></iframe>
      </div>
      
    </li>    
    
  </ul>
</div>


</div></div></div> <!-- 이 안에 내용 적어주세요 끝 -->
</body>
</html>