<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="./images/favicon-16x16.png">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/basis_Su.css"> 

<!-- 부트스트랩 4.6 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

</head>
<body>

	<% 
        String id = null;
        if(session.getAttribute("id") != null) {
            id = (String)session.getAttribute("id");
        }
        System.out.println("navigation id="+id);
    %>
<!-- Navigation -->
<form action="">
<nav class="navbar navbar-expand-lg fixed-top navbar-light  " style="background-color: #e3f2fd;">
         <a class="navbar-brand logotext" style="font-weight: bold; color: rgb(52, 152, 219); " href="team_main.jsp"> <img src="/team_main/images/comLogo.PNG" width="60" alt=""> CCcompany</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
         </button>
         <form class="form-inline my-2 my-lg-0 navbar-form">
            <div class="input-group input-group-search mx-auto">
               <input type="text" class="form-control" placeholder="검색어를 입력하세요." aria-label="Search" aria-describedby="search-button-addon" name="search" >
               <div class="input-group-append">
                  <button class="btn btn-success" type="submit" id="search-button-addon">&#128269;</button>
               </div>
            </div>
         </form>
         <%
             // 로그인이 되어있지 않은 경우만 나오게한다
                if(id == null || id.equals("null")) {
            %>

         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">

               <li class="nav-item">
                  <a class="nav-link text-nowrap" href="loginpage.jsp">로그인</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link text-nowrap" href="register.jsp">/ 회원가입</a>
               </li>
            </ul>
         </div>

            <%
             // 로그인이 되어있는 사람만 볼수 있는 화면
                }else {
                	
                	ArrayList<Integer> product_idx = (ArrayList<Integer>) (session.getAttribute("productIdx"));
                	
                	if (session.getAttribute("productIdx") == null) {
                		product_idx = new ArrayList<Integer>();
                    }
                	session.setAttribute("productIdx", product_idx);
                	
                	
                	ArrayList<Integer> product_count = (ArrayList<Integer>) (session.getAttribute("productCount"));
                	
                	if (session.getAttribute("productCount") == null) {
                		product_count = new ArrayList<Integer>();
                    }
                	session.setAttribute("productCount", product_count);

                	
                	ArrayList<Integer> product_gup = (ArrayList<Integer>) (session.getAttribute("productGup"));
                	
                	if (session.getAttribute("productGup") == null) {
                		product_gup = new ArrayList<Integer>();
                    }
                	session.setAttribute("productGup", product_gup);
                	
                	
                	session.setAttribute("id", id);
                	
                	ArrayList<String> productImg = (ArrayList<String>) (session.getAttribute("productImg"));
                	
                	if (session.getAttribute("productImg") == null) {
                		productImg = new ArrayList<String>();
                    }
                	session.setAttribute("productImg", productImg);
            %>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">

               <li class="nav-item">
                  <a class="nav-link text-nowrap" href="logoutaction.jsp">로그아웃</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link text-nowrap" href="mypage2.jsp?id=<%=id%>">마이페이지</a>
               </li>
               <li class="nav-item">
               	 <a class="nav-link text-nowrap" href="cart.jsp">장바구니</a>
               </li>
            </ul>
         </div>

            <%
                }
            %>
      </nav>

</form>
<!-- Navigation 끝 -->
</body>
</html>