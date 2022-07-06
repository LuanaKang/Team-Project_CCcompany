<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/basis_Su.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<title>CCcompany</title>
</head>

<body>
<!-- 숫자 3자리마다 , 표시하기 위한 코드 -->

<%@ page import="java.text.*" %> 
<% NumberFormat nf = NumberFormat.getNumberInstance(); %>
<%@ include file="./basis/navigation.jsp" %>	<!-- navigation 불러옴 -->
<%@ include file="./basis/category.jsp" %>		<!-- category 불러옴 --> 
<%@ include file="./basis/footer.jsp" %>		<!-- footer 불러옴 --> 
<%@ include file="./basis/product_main_db.jsp" %>		<!-- TV_db정보 -->



<%
	
	String userid = String.valueOf(session.getAttribute("id"));
	System.out.println("cart id="+userid);
	
	ArrayList<Integer> productIdx = (ArrayList) (session.getAttribute("productIdx")); 
	System.out.println("productIdx= "+productIdx);

	ArrayList<Integer> productCount = (ArrayList) (session.getAttribute("productCount")); 
	System.out.println("productCount= "+productCount);

	ArrayList<Integer> productGup = (ArrayList) (session.getAttribute("productGup")); 
	System.out.println("productGup= "+productGup);

	ArrayList<String> productImg = (ArrayList) (session.getAttribute("productImg")); 
	System.out.println("productImg= "+productImg);

		ArrayList<String> pname = new ArrayList<String>();
		ArrayList<String> bname = new ArrayList<String>();
		ArrayList<Integer> price = new ArrayList<Integer>();
	
	if(productIdx.size()>0){
		for(int i=0; i<productIdx.size();i++){
			stmt = conn.createStatement();
			String dtest = "select * from product where idx = " + productIdx.get(i) ;	
			pstmt = conn.prepareStatement(dtest);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				 pname.add(rs.getString("productname"));
				 bname.add(rs.getString("brandName"));
				 price.add(rs.getInt("price"));
			} 
		}
	}
	else{}
	int tot = 0;
	
%>

<div class="col" style="margin-top: 3%;">
	<div class="container">
		<form name='form1' method='post'>
			<br><h4 style="font-weight: bold; margin-left: 10%;"  ><%=userid %>님의 장바구니</h4><br>
			<form name="form" method="get">
				<table style="margin-left:-50%; text-align:center; height: 80%; margin-right:10%;">
				    <thead border="1" width="1200" height="50" style="background-color: lightgray;">
				    	<tr>
				            <th width="5%"><input type="checkbox" id="all"></th>
				            <th width="20%">제품 사진</th>
				            <th width="20%">제품명</th>
				            <th width="10%">가격</th>
				            <th width="10%">수량</th>
				            <th width="10%">총가격</th>
				         </tr>
				    </thead>
				    <!-- 장바구니에 넣을 때 마다 하나씩 증가하는 데이터 for문 활용 -->
				    <tbody border="1" width="1200" height="50">
				    	<%
				    	if(productCount.size() == 0){
				    	%>
				    		<tr id="producttr">
				    			<td colspan="6" style="width: 80vw;">장바구니가 비어있어요!</td>
				    		</tr>
				    	<%
				    	}
				    	else{
					    	for(int i=0; i<productCount.size(); i++){
					    	int num=productCount.get(i);
					    		
					    		%>
					         <tr id="producttr">
					            <td><input type="checkbox" id="<%=i%>" name="checkProduct"></td>
					            <td  onclick="location.href='./productpage.jsp?idx=<%=productIdx.get(i)%>&img=<%=productImg.get(i)%>&gup=<%=productGup.get(i)%>'"><img alt="상품 이미지" src="<%=productImg.get(i) %>" style="width: 35%; height: 30%;"></td>
					         	<td  onclick="location.href='./productpage.jsp?idx=<%=productIdx.get(i)%>&img=<%=productImg.get(i)%>&gup=<%=productGup.get(i)%>'"><%=pname.get(i)%></td>
					            <td  onclick="location.href='./productpage.jsp?idx=<%=productIdx.get(i)%>&img=<%=productImg.get(i)%>&gup=<%=productGup.get(i)%>'"><span class="price" ><%=nf.format(price.get(i))%></span></td>
					            <td>
					           	 	
									<span class="amount"><%=productCount.get(i) %></span>&nbsp;
								</td>
					            <td  onclick="location.href='./productpage.jsp?idx=<%=productIdx.get(i)%>&img=<%=productImg.get(i)%>&gup=<%=productGup.get(i)%>'">
					           		 <span class="sum"><%=nf.format(price.get(i)*productCount.get(i))%></span>
					            </td>
					          
					        </tr>
					       
				        <%
				    		}
				    	
				    	%>
				    	<tr>
				    		<td colspan="6" style="text-align: center;">
								<%			
									for(int k=0; k<price.size(); k++){
										tot += price.get(k) * productCount.get(k);
									}
								%>
								
					            <h3 class="text-center" >합계: <span id="totPrint"><%=nf.format(tot) %></span></h3>	<br>			    		
				    		</td>
				    	</tr>
				    	<tr>
				    		<td colspan="6">
				    			<input type="button" class="btn btn-dark" type="button" id="1" value="삭제" onclick='checkDel();'>&nbsp;&nbsp;<input type="button" type="button" class="btn btn-dark" id="2" value="구매" onclick="checkOrder(<%=productCount%>,'<%=userid%>', '<%=productImg%>',<%=productIdx%>)">
				    		</td>
				    	</tr>
		
				    	
				    </tbody>
				</table>
				</form>
			
				
			<br><br><br><br><br>
			
			
		<%
			}
		%>
		</form>
	  </div> 

</div> <!-- 이 안에 내용 적어주세요 끝 -->
<script>
$(document).ready(function(){
    //체크박스 전체 선택&해제
    $('#all').click(function(){
         if($("#all").prop("checked")){
            $("input[type=checkbox]").prop("checked",true); 
        }else{
            $("input[type=checkbox]").prop("checked",false); 
        }
    });
});


	function checkDel(){
		var checkProduct = document.getElementsByName("checkProduct");
		var checkNum = new Array;
		
			for(var i=0; i<checkProduct.length; i++){
				if(checkProduct[i].checked == true){
					checkNum.push(i);
				}
			}
		if(checkNum.length == 0){
			alert('항목이 선택되지 않았습니다.');
		}
		else{
			var delq = confirm('선택 항목을 삭제하시겠습니까?');
			if(delq){
				location.href='./delCart.jsp?index='+checkNum;
			}
		}

	}

	function checkOrder(productCount,id,img,idx){
		var checkProduct = document.getElementsByName("checkProduct");
		var checkNum = new Array;
		var checkCount = new Array;
		var checkImg = new Array;
		var imgarray = new Array;
		img = img.replace('[','');
		img = img.replace(']','');
		imgarray = img.split(',');
		for(var i=0; i<checkProduct.length; i++){
			if(checkProduct[i].checked == true){
				checkNum.push(idx[i]);
				checkCount.push(productCount[i]);
				checkImg.push(imgarray[i]);
			}
		}
		
		if(checkNum.length == 0){
			alert('항목이 선택되지 않았습니다.');
		}
		else{
			var orderq = confirm('선택 항목을 주문하시겠습니까?');
			if(orderq){
				location.href='./orderform.jsp?index='+checkNum+'&id='+id+'&count='+checkCount+'&img='+checkImg;
			}
		}
	}
	

</script>

</body>
</html>