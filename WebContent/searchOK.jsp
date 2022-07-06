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
<title>slide Test</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 슬라이드 구현에 필요한 소스 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<!-- 슬라이드 css -->
<link rel="stylesheet" href="./css/slide_Test_Su.css">

<!-- 상품 목록 css -->

</head>
<body>

<br><br>
<!-- 베스트 -->
<h1 class="slide_title"><a class="slide_title">BEST PRODUCT</a></h1>

<!-- 클래스명은 변경하면 안 됨 -->
<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0339.jpg"></div>
		<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0573.jpg"></div>
		<div class="swiper-slide"><img src="https://ktsmemo.cafe24.com/p/0536.jpg"></div>
		<div class="swiper-slide"><img src="http://oldmidi.cdn3.cafe24.com/p/0325.jpg"></div>
		<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0231.jpg"></div>
		<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0166.jpg"></div>
		<div class="swiper-slide"><img src="https://ktsmemo.cafe24.com/p/0556.jpg"></div>
		<div class="swiper-slide"><img src="http://oldmidi.cdn3.cafe24.com/p/0740.jpg"></div>
		<div class="swiper-slide"><img src="http://oldmidi.cdn3.cafe24.com/p/0161.jpg"></div>
		<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0588.jpg"></div>
		<div class="swiper-slide"><img src="https://ktsmemo.cafe24.com/p/0388.jpg"></div>
		<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0539.jpg"></div>
		<div class="swiper-slide"><img src="http://oldmidi.cdn3.cafe24.com/p/0128.jpg"></div>
		<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0640.jpg"></div>
		<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0549.jpg"></div>
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>

<br><br><br><br><br><br>

	<!-- DB 연결 -->
		<%
		Connection conn = null;
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
		ArrayList<String> searchProductName = new ArrayList<String>();
		ArrayList<String> searchBrandName = new ArrayList<String>();
		ArrayList<Integer> searchPrice = new ArrayList<Integer>();
		ArrayList<Integer> searchIdx = new ArrayList<Integer>();
		
	//	검색단어
		String searchWord = request.getParameter("search");
	
		/* if (searchWord != null && searchWord.trim().length() != 0) { */
			
		//	DB연결
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				conn = DriverManager.getConnection(url, "su", "0000");
				stmt = conn.createStatement();
				String sql = "select * from product where productname like" + "'"+ "%" + searchWord + "%" +"'";
				// out.println("연결성공: " + conn + "<br/>");
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					searchProductName.add(rs.getString("PRODUCTNAME"));
					searchBrandName.add(rs.getString("brandname"));
					searchPrice.add(rs.getInt("PRICE"));
					searchIdx.add(rs.getInt("idx"));
					
				}
		//		out.println(searchProductName);
		//		out.println(searchBrandName);
		//		out.println(searchPrice);
		//		out.println(searchIdx);

			} catch (ClassNotFoundException e) {
				out.println("드라이버 클래스가 없거나 읽어올 수 없습니다.<br/>");
			} catch (SQLException e) {
				e.printStackTrace();
				out.println("데이터베이스 접속 정보가 올바르지 않습니다.<br/>");
			}
		/* } else {
			out.println("<script>");
			out.println("alert('검색어를 입력하세요.')");
			out.println("location.href='team_main.jsp'");
			out.println("</script>");
		} */
%>
<!-- DB 연결 끝 -->


<!-- 신상품 -->
<h1 class="slide_title" ><a>전체 메뉴</a></h1>
<!-- 클래스명은 변경하면 안 됨 -->
<div class="swiper-container1">
	<div class="swiper-wrapper">
	
	<!-- 여기부터 -->			
			<!-- 상품 정보 -->
<% 
	 		for (int i = 0; i < searchProductName.size(); i++) {
%>
			
		<div class="swiper-slide" onclick="location.href='productpage.jsp?idx=<%=searchIdx.get(i)%>'"> 
			<div class="col-lg-4 col-md-6 mb-4">
	            <div class="card h-100" OnClick="location.href ='#'" style="cursor:pointer;">
	              <a href="#"><img class="card-img-top" src="http://placehold.it/250X200" alt=""></a>
	              <div class="card-body">
	                <div class="card-title">
	                  <a href="#"><%=searchProductName.get(i)%></a>	<!-- 제품명 -->
	                </div><br>
	                <span class="price"><%=searchPrice.get(i)%></span><sapn class="won"> 원</sapn><!-- 가격 -->
	                <p class="card-text">24인치 TV</p>
	              </div>
	              <div class="card-footer">
	                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
	              </div>
	            </div>
	          </div>
	          <!-- 상품 정보 끝 -->
		<!-- 여기까지 반복문 돌려주시면 됩니다! -->
          </div>
<%	 			
	 		}
%>					
	
	
	</div>
	

</div>
<br><br><br>


<script>

new Swiper('.swiper-container', {

	slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});

</script>

<script>

new Swiper('.swiper-container1', { // 전체메뉴 

	slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

});

</script>


</body>
</html>