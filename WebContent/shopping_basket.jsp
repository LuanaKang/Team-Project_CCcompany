<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CCcompany</title>
</head>
<body>
<%-- <%@ include file="./productpage.jsp" %> --%>
<%@ include file="./basis/shopping_basket_db.jsp" %>

제품번호:<%=basket_idx.get(0)%>
상품이름: <%=basket_product.get(0)%>
브랜드명: <%=basket_brand.get(0)%>
가격: <%=basket_price.get(0)%>

<input type="button" value="확인" onclick="btn()">

<script type="text/javascript">
function btn() {
	if (confirm("장바구니 확인하시겠습니까?")) {
		location.href="orderform.jsp?idx=" + <%=basket_idx.get(0)%>;
	}else{
		window.history.back();
	}
}
</script>

<!-- <button onclick="javascript:btn()">확인</button> -->
</body>
</html>