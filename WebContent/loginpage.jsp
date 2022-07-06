<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
   <jsp:useBean id="user" class="user.userVO" scope="page">
   <jsp:setProperty name="user" property="id"/>
   <jsp:setProperty name="user" property="password"/>
   </jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/shop-homepage.css">
 <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>CCcompany</title>
<link rel="icon" href="./images/favicon-16x16.png">
</head>
<body>
<%@ include file="./basis/footer.jsp" %>		<!-- footer 불러옴 --> 
<%@ include file="./basis/category.jsp" %>		<!-- category 불러옴 --> 
<%@ include file="./basis/navigation.jsp" %>	<!-- navigation 불러옴 --> 



<div class="col p-3" style="margin-top: 3%;"> <!-- 이 안에 내용 적어주세요 -->

 <!-- Page Content -->
<form action="loginaction.jsp" method="post" class="loginForm">
      <h1>로그인</h1><br>
      <div class="loginid">
      <h4>아이디 : <input type="text" class="id" name="id" placeholder="ID"></h4>
      </div><br>
      <div class="loginpassword">
      <h4>비밀번호 : <input type="password" class="pw" name="password" placeholder="PW"></h4> 
      </div><br>
      <!-- <button type="submit" value="로그인">로그인</button><br><br> -->
      <button class="btn btn-success" type="submit" value="로그인">로그인</button><br><br>
      <div class="bottomText">
        회원가입하시겠습니까? <a class="btn btn-link" href="register.jsp">sign up</a>
      </div>
    </form>

<!-- 부트스트랩 활용 로그인 페이지 구현 -->

 
<!-- 부트스트랩 활용 로그인 페이지 구현 끝-->



 <!-- Page Content 끝 -->
  

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  </div></div></div> <!-- 이 안에 내용 적어주세요 끝 -->
</body>
</html>