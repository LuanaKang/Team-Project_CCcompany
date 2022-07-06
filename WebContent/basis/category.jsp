<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/basis_Su.css"> 
<!-- 부트스트랩 4.6 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<style type="text/css">
	.categorytext{
		font-size: 1.5em;
	}
	
	.categorytext:hover{
		font-size: 2em;
	}
	
		
</style>
</head>
<body>

<div class="container-fluid px-0" >
    <div class="row collapse show no-gutters d-flex h-100 position-relative">
        <div class="col-5 p-0 h-100 w-sidebar navbar-collapse collapse d-none d-md-flex sidebar">
            <!-- fixed sidebar -->
            <div class="navbar-light text-white position-fixed h-100 align-self-start w-sidebar  border-right">
                <h6 class="px-3 pt-3">Fixed Menu <a data-toggle="collapse" class="px-1 d-inline d-md-none text-white" href="#" data-target=".collapse"><i class="fa fa-bars"></i></a></h6>
                <ul class="nav flex-column flex-nowrap text-truncate">
                    <li class="nav-item ">
                        <a class="nav-link active categorytext" href="./product_main.jsp?gup=1" style="color: #4489FF;">TV</a>
                    </li>
                    <li class="nav-item ">
                         <a class="nav-link active categorytext" href="./product_main.jsp?gup=2" style="color: #4489FF;">냉장고</a>
                    </li>
                    <li class="nav-item ">
                         <a class="nav-link active categorytext" href="./product_main.jsp?gup=3" style="color: #4489FF;">에어컨</a>
                    </li>
                </ul>
            </div>
        </div>
        
</body>
</html>