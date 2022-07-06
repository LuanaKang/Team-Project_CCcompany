<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CCcompany</title>
<link rel="stylesheet" href="./css/basis_Su.css">
<!-- 슬라이드 css -->
<link rel="stylesheet" href="./css/slide_Test_Su.css">
<!-- 슬라이드 구현에 필요한 소스 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<!-- 부트스트랩 4.6 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="icon" href="./images/favicon-16x16.png">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
</head>
<body>
<!-- 숫자 3자리마다 , 표시하기 위한 코드 -->
<%@ page import="java.text.*" %> 
<% NumberFormat nf = NumberFormat.getNumberInstance(); %>
<%@ include file="./basis/navigation.jsp" %>	<!-- navigation 불러옴 -->
<%@ include file="./basis/category.jsp" %>		<!-- category 불러옴 --> 
<%@ include file="./basis/footer.jsp" %>		<!-- footer 불러옴 --> 
<%@ include file="./basis/main_db.jsp" %>		<!-- db 불러옴 --> <!-- db정보는 해당 파일에서 변경하시면 됩니다. -->

<div class="col p-2"> <!-- 이 안에 내용 적어주세요 -->

<!-- 배너 -->
<img class="banner" style="margin-top: 0;" alt="배너입니다람쥐" src="./images/bannerTest.png">


<!-- 베스트 -->
<h1 class="slide_title"><a href="#" class="slide_title">BEST PRODUCT</a></h1>

<!-- 클래스명은 변경하면 안 됨 -->
<div class="swiper-container">
	<div class="swiper-wrapper">
		<!-- 1페이지 -->
		<!-- 상품 -->
		<% for(int i=0; i<8; i++){  %>
		 		<% 
		 		int biidx_1;
                if (bigup.get(i) == 1) {
                	biidx_1 = biidx.get(i);
                }else if(bigup.get(i) ==2 ) {
                	biidx_1 = biidx.get(i) - 8;
                } else {
                	biidx_1 = biidx.get(i) - 16;
                }
                %>
                <div class="swiper-slide"> 
		  <div class="card  box-shadow carddiv" onclick="location.href='productpage.jsp?idx=<%=bidx.get(i)%>&img=./images/electricimg/0<%=bgup.get(i)%>-0<%=biidx_1%>-01.JPG&gup=<%=bgup.get(i)%>'" style="width: 14rem; height:80%; margin: 10% 20% 10% 20%;">
                <img  class="card-img-top mx-auto" src ="./images/electricimg/0<%=bgup.get(i)%>-0<%=biidx_1%>-01.JPG" alt="Card image cap" style="width:250px; height: 100px">
                <div class="card-body h-100">
                  <h5><a class="card-text ptitle" href="#"><%=bname.get(i) %>   </a></h5>
                  <!-- <span class="card-text">24인치<br>FHD</span> -->
                  <p class="card-text"><%=nf.format(bprice.get(i)) %><span class="won"> 원</span></p>
                  <div class="d-flex justify-content-between align-items-center">
                  </div>
                </div>
              </div>
           </div>
          	<% } %>
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>

<br><br><br><br><br><br>

<!-- 신상품 -->
<h1 class="slide_title" ><a href="#">NEW PRODUCT</a></h1>
<!-- 클래스명은 변경하면 안 됨 -->
<div style="margin-bottom:20%;" class="swiper-container">
	<div class="swiper-wrapper">
		<!-- 1페이지 -->
		<!-- 상품 -->
		<% for(int i=0; i<8; i++){  %>
				<% 
		 		int niidx_1;
                if (nigup.get(i) == 1) {
                	niidx_1 = niidx.get(i);
                }else if(nigup.get(i) ==2 ) {
                	niidx_1 = niidx.get(i) - 8;
                } else {
                	niidx_1 = niidx.get(i) - 16;
                }
                %>
		<div class="swiper-slide"> 
              <div class="card  box-shadow carddiv"onclick="location.href='productpage.jsp?idx=<%=nidx.get(i)%>&img=./images/electricimg/0<%=ngup.get(i)%>-0<%=niidx_1%>-01.JPG&gup=<%=ngup.get(i)%>'" style="width: 14rem; height:80%; margin: 10% 20% 10% 20%;">
                <img class="card-img-top mx-auto" src ="./images/electricimg/0<%=ngup.get(i)%>-0<%=niidx_1%>-01.JPG" alt="Card image cap" >
                <div class="card-body h-100">
                  <h5><a class="card-text ptitle" href="#"><%=nname.get(i) %>   </a></h5>
                  <!-- <span class="card-text">24인치<br>FHD</span> -->
                  <p class="card-text"><%=nf.format(nprice.get(i)) %><span class="won"> 원</span></p>
                  <div class="d-flex justify-content-between align-items-center">
                  </div>
                </div>
              </div>
           </div>
          	<% } %>
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>
</div></div></div> <!-- 이 안에 내용 적어주세요 끝 -->

<script>

new Swiper('.swiper-container', {

	slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

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

</body>
</html>