<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/shop-homepage.css">
 <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>CCcompany</title>
</head>
<body>
<%@ include file="./basis/footer.jsp" %>		<!-- footer 불러옴 --> 
<%@ include file="./basis/category.jsp" %>		<!-- category 불러옴 --> 
<%@ include file="./basis/navigation.jsp" %>	<!-- navigation 불러옴 --> 

<div class="col p-3" style="margin-top: 3%;"> <!-- 이 안에 내용 적어주세요 -->


 <!-- Page Content -->
  <form action="registeraction.jsp" method="post" class="loginForm">
      <h1>회원가입</h1><br>
       <div class="name">
       <h4>이름 : <input type="text" name="name" class="name" placeholder="Name"></h4> 
      </div><br>
      <div class="loginid">
        <h4>아이디 : <input type="text" name="id" class="id" placeholder="ID"></h4> 
   <!-- <button>중복확인</button> -->    
      </div><br>
      <div class="loginpassword">
       <h4> 비밀번호 : <input type="password" name="password" class="pw" placeholder="PW"></h4> 
      </div><br>
      <div class="email">
        <h4>이메일 : <input type="email" name="email" class="email" placeholder="Email"></h4> 
      </div><br>
      <div class="address">
      	<h4>주소 : <input type="text" name="address" class="address" placeholder="Address"></h4> 
      </div><br>
      
      <button class="btn btn-success">회원가입 </button>     
     
    </form>
  <!-- /.container -->

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 </div></div></div> <!-- 이 안에 내용 적어주세요 끝 -->
</body>
</html>