<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>CCcompany</title>
<link rel="stylesheet" href="./css/basis_Su.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 슬라이드 구현에 필요한 소스 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<%@ page import="java.text.*" %> 
<% NumberFormat nf = NumberFormat.getNumberInstance(); %>

<%@ include file="./basis/footer.jsp" %>	 
<%@ include file="./basis/category.jsp" %>		 
<%@ include file="./basis/navigation.jsp" %> 	
<!-- 슬라이드 css -->
<link rel="stylesheet" href="./css/slide_Test_Su.css">

<!-- 상품 목록 css -->

</head>
<body>
<%@ include file="./basis/product_main_db.jsp" %>
<%
	int gup = Integer.parseInt(request.getParameter("gup"));
	System.out.println("gup="+gup);
	stmt = conn.createStatement();
	String dtest = "select * from product where gup = " + gup + "  order by PURCHASECOUNT desc";		/* 베스트 순서 */
	pstmt = conn.prepareStatement(dtest);
	rs = pstmt.executeQuery();
	while (rs.next()) {
		  best_ProductName.add(rs.getString("PRODUCTNAME"));
		  best_BrandName.add(rs.getString("brandname"));
		  best_Price.add(rs.getInt("PRICE"));
		  best_Storagedate.add(rs.getDate("storagedate"));
		  best_idx.add(rs.getInt("idx"));
	}
	
	stmt = conn.createStatement();
	dtest = "select * from product where gup = " + gup + "  order by STORAGEDATE desc";		/* 신제품 순서 */
	pstmt = conn.prepareStatement(dtest);
	rs = pstmt.executeQuery();
	while (rs.next()) {
		  new_ProductName.add(rs.getString("PRODUCTNAME"));
		  new_BrandName.add(rs.getString("brandname"));
		  new_Price.add(rs.getInt("PRICE"));
		  new_Storagedate.add(rs.getDate("storagedate"));
		  new_idx.add(rs.getInt("idx"));
	}
	
	stmt = conn.createStatement();
	String ttest = "select * from (select rownum as rnum, a1.* from (select * FROM PRODUCT where gup =" + gup + "ORDER BY purchasecount desc) a1) a2 where a2.rnum >= 1 and a2.rnum <=8" ;	/* 사진뿌리기 */
	pstmt = conn.prepareStatement(ttest);
	rs = pstmt.executeQuery();
	while (rs.next()) {
		  best_rnum.add(rs.getInt("rnum"));
		
	}
	System.out.println("0"+gup+"-0"+best_rnum.get(0));
	
	
%>
<div class="col p-1">

<!-- 베스트 -->

<h1 class="slide_title" style="margin-left: 10%;" >BEST PRODUCT</h1>
<!-- 클래스명은 변경하면 안 됨 -->
<div class="swiper-container" style="width: 70vw; margin-left: 15%;">
	<div class="swiper-wrapper">

		<!-- 여기부터 -->			
			<!-- 상품 정보 -->

<% 
	if(best_idx.size() > 4){
		for (int i = 0; i < 4; i++) {
%>
<%	
			int best_idx_1;
				if(gup ==1) {
					best_idx_1 = best_idx.get(i);
				}else if (gup ==2) {
					best_idx_1 = best_idx.get(i) - 8;
				}else {
					best_idx_1 = best_idx.get(i) - 16;
				}
	
%>
		<div class="swiper-slide" onclick="location.href='productpage.jsp?idx=<%=best_idx.get(i)%>&img=./images/electricimg/0<%=gup%>-0<%=best_idx_1%>-01.JPG&gup=<%=gup%>'" style="width:70vw;"> 
			<div class="card  box-shadow carddiv" OnClick="location.href ='#'" style="width: 14rem; height:80%; margin: 10% 20% 10% 20%;">
		              <img class="card-img-top mx-auto" src ="./images/electricimg/0<%=gup%>-0<%=best_idx_1%>-01.JPG" alt="Card image cap" style="width:250px; height: 100px"><br>
		              <div class="card-body h-100">
		                <h5 style="height: 3vh;"><a class="card-text ptitle" href="#"><%=best_ProductName.get(i) %>   </a></h5><br><br><br>
		                <!-- <span class="card-text">24인치<br>FHD</span> -->
		                <p class="card-text"><%=nf.format(best_Price.get(i)) %><span class="won"> 원</span></p>
		                <div class="d-flex justify-content-between align-items-center">
		                </div>
		              </div>
		            </div>
		         <!-- 상품 정보 끝 -->
		<!-- 여기까지 반복문 돌려주시면 됩니다! -->
		        </div>
	
<%	 				 		
	 		}
		
	}else{
		for (int i = 0; i < best_idx.size(); i++) {
%>

<% 
			int best_idx_1;
			if(gup ==1) {
				best_idx_1 = best_idx.get(i);
			}else if (gup ==2) {
				best_idx_1 = best_idx.get(i) - 8;
			}else {
				best_idx_1 = best_idx.get(i) - 16;
			}
%>
		<div class="swiper-slide" onclick="location.href='productpage.jsp?idx=<%=best_idx.get(i)%>&img=./images/electricimg/0<%=gup%>-0<%=best_idx_1%>-01.JPG&gup=<%=gup%>'">
			<div class="card  box-shadow carddiv" OnClick="location.href ='#'" style="width: 14rem; height:80%; margin: 10% 20% 10% 20%;">
                <img class="card-img-top mx-auto" src ="./images/electricimg/0<%=gup%>-0<%=best_idx_1%>-01.JPG" alt="Card image cap"><br>
                <div class="card-body h-100">
                  <h5 style="height: 3vh;"><a class="card-text ptitle" href="#"><%=best_ProductName.get(i) %>   </a></h5>
                  <!-- <span class="card-text">24인치<br>FHD</span> -->
                  <p class="card-text"><%=nf.format(best_Price.get(i)) %><span class="won"> 원</span></p>
                  <div class="d-flex justify-content-between align-items-center">
                  </div>
                </div>
              </div>
	          <!-- 상품 정보 끝 -->
		<!-- 여기까지 반복문 돌려주시면 됩니다! -->
          </div>


<%			
		}
	}
%>				
		
	</div>
	

	
</div>

<br><br><br><br><br><br>

<!-- 전체메뉴 -->
<h1 class="slide_title" style="margin-left: 15%; font-weight: bold;" >전체 메뉴</h1><br>
	<table style="width:85%; text-align: center; margin-left: 15%; height:80vh;">
      <tbody>
      <tr>
<%
		System.out.println("best_idx.size(): "+new_idx.size());
		System.out.println("new_idx: "+new_idx);
		for(int i=0; i<best_idx.size(); i++){	
		
%>
<%
			int best_idx_1;
			if(gup ==1) {
				best_idx_1 = best_idx.get(i);
			}else if (gup ==2) {
				best_idx_1 = best_idx.get(i) - 8;
			}else {
				best_idx_1 = best_idx.get(i) - 16;
			}
%>
               <td onclick="location.href='productpage.jsp?idx=<%=best_idx.get(i)%>&img=./images/electricimg/0<%=gup%>-0<%=best_idx_1%>-01.JPG&gup=<%=gup%>'">
				<div class="card  box-shadow carddiv" OnClick="location.href ='#'" style="width: 10rem; height:80%; margin: 10% 20% 10% 20%;">
	                <img class="card-img-top mx-auto" src ="./images/electricimg/0<%=gup%>-0<%=best_idx_1%>-01.JPG" alt="Card image cap"><br>
	                <div class="card-body h-100">
	                  <h5 style="height: 3vh;"><a class="card-text ptitle" href="#"><%=best_ProductName.get(i) %>   </a></h5><br><br><br>
	                  <!-- <span class="card-text">24인치<br>FHD</span> -->
	                  <p class="card-text"><%=nf.format(best_Price.get(i)) %><span class="won"> 원</span></p>
	                  <div class="d-flex justify-content-between align-items-center">
	                  </div>
	                </div>
	              </div>
	              <br> <br> <br> 
			</td>
<%			
			if((i+1) % 4 == 0){
%>
				</tr>
				<tr>
<%				
			}
		}
%>
		</tr>
      </tbody>
    </table>
 
   <br><br><br><br>
  </div>



<%
/* 새로고침 시 값이 중복적으로 들어가는 걸 막기 위해 arraylist 초기화 */
	new_ProductName.clear();
	new_BrandName.clear();
	new_Price.clear();
	new_Storagedate.clear();
	new_idx.clear();
	
	best_ProductName.clear();
	best_BrandName.clear();
	best_Price.clear();
	best_Storagedate.clear();
	best_idx.clear();
%>
<script>

new Swiper('.swiper-container', {

	slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true


});

</script>



</body>
</html>