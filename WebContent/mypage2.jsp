<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="user.userVO"%>
<% request.setCharacterEncoding("UTF-8"); %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/qanda.css">
<link rel="stylesheet" href="./css/shop-homepage.css">
<link rel="stylesheet" href="./css/tab.css">
<!-- 부트스트랩 4.6 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script type="text/javascript" src="./js/delete.js"></script>
<script>
/* 흑흑.. ajax 아까워서 일단 둘게요.. */
function getParameterByName(name) {

    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");

    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),

            results = regex.exec(location.search);

    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));

}
	var id = getParameterByName('id');
	
	
/*
	 $.ajax({
	    url : "./qanda/qanda.jsp",
	    dataType : "html",
	    type : "get",  // post 또는 get
	    data : {id:iid},
	    success : function(result){
	        $("#tabcontent").html(result);
	    }
	   
	
	});   */
	/* window.onload = function() {
		for(var i=0; i<document.getElementsByClassName("button").length;i++){
			 document.getElementsByClassName("button")[i].onclick = function(){
				alert('클릭');
			}
		}
	} */
	

</script>
<title>CCcompany</title>
</head>
<body>
<%@ include file="./basis/navigation.jsp" %>		<!-- navigation 불러옴 --> 
<%@ include file="./basis/footer.jsp" %>		<!-- footer 불러옴 --> 
<%@ include file="./basis/category.jsp" %>		<!-- category 불러옴 --> 
<%String iid = request.getParameter("id"); %>

<%! 
	/* 구매내역에서 나의정보(tab1)에 나타나게 될 정보 */
	String mypageName;
	String mypageEmail;
	String mypageAddress;
	
	/* 구매내역에서 구매내역(tab2)에 나타나게 될 정보 */

	ArrayList<Integer> count = new ArrayList<Integer>();
	ArrayList<Integer> idx = new ArrayList<Integer>();
	ArrayList<String> ordername = new ArrayList<>();
	ArrayList<String> orderaddress = new ArrayList<>();
	ArrayList<String> orderemail = new ArrayList<>();

	ArrayList<Integer> price = new ArrayList<Integer>();
	ArrayList<Integer> gup = new ArrayList<Integer>();
	ArrayList<String> productname = new ArrayList<>();
	ArrayList<String> brandname = new ArrayList<>();
%>

	<% 
			
			if (iid == null || "null".equals(iid)){
				out.println("로그인안함");
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인 하세요')");
				script.println("location.href = 'loginpage.jsp'");
				script.println("</script>");
			
			} 
		%>

<%-- <%@ include file="./basis/qanda_db/qanda_db.jsp" %> --%>		<!-- qanda db 불러옴 --> 
<%@include file="./basis/basis_db.jsp" %>

<div class="col p-1"  style="margin-left: -25%;"> <!-- 이 안에 내용 적어주세요 -->


<!-- Page Content -->

<!-- DB 연결 -->
		<%
		
		//	DB연결 - mypage
			
				stmt = conn.createStatement();
				String sql = "select name, email, address from MEMBER where id = '" + iid + "'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					mypageName = rs.getString("name");
					mypageEmail = rs.getString("email");
					mypageAddress = rs.getString("address");
				}
	
	
%>
<!-- DB 연결 끝 -->

<!-- DB 연결 -->
		<%
		
		//	DB연결 - mypage 구매내역 
			
				stmt = conn.createStatement();
				String sql_1 = "select * from PURCHASE where id='"+id+"' order by orderdate desc";
				System.out.println("sql_1 = "+sql_1);
				pstmt = conn.prepareStatement(sql_1);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					count.add(rs.getInt("PURCHASE_COUNT"));
					idx.add(rs.getInt("PURCHASE_IDX"));
					ordername.add(rs.getString("ORDER_NAME"));
					orderaddress.add(rs.getString("ORDER_ADDRESS"));
					orderemail.add(rs.getString("ORDER_EMAIL"));
				}
%>
<!-- DB 연결(구매내역) 끝 -->

<!-- DB 연결 -->
		<%
		
		//	DB연결 - mypage 구매내역 상품정보
			for(int i=0; i< idx.size();i++){
				stmt = conn.createStatement();
				sql_1 = "select * from product where idx="+idx.get(i);
				pstmt = conn.prepareStatement(sql_1);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					gup.add(rs.getInt("GUP"));
					price.add(rs.getInt("PRICE"));
					brandname.add(rs.getString("BRANDNAME"));
					productname.add(rs.getString("PRODUCTNAME"));
				}
			}
%>
<!-- DB 연결(구매내역) 끝 -->



<!-- 꾸미기 -->
<h1 class="text-center" style="margin-top: 5%;"><%=id %>님의 마이페이지</h1>
<div class="tabmenu" style="width: 100%" >
  <ul>
    <li id="tab1" class="btnCon"> <input type="radio" name="tabmenu" id="tabmenu1" checked="!<%=request.getParameter("flag")%>">
      <label for="tabmenu1">나의 정보</label>
      <div class="tabCon" style="width: 100%">
		<br><br><br>
		<div>
        	이름 :  <%=mypageName%>
     	</div>
        <div>
	   		아이디 : <%=iid %>
	    </div>
	    <div>
	        이메일 :  <%=mypageEmail%>
	    </div>
	    <div>
	        주소 : <%=mypageAddress%>
	    </div>
      </div>

    </li>
    <li id="tab3" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu3" >
      <label for="tabmenu3">구매내역</label>
      <div class="tabCon" style="width: 100%;">
      	<table style="width: 100%; text-align: center;">
		    <thead border="1" width="100%" height="50">
		    	<tr>
		            <th width="10%">브랜드명</th>
		            <th width="20%">제품명</th>
		            <th width="10%">가격</th>
		            <th width="10%">수량</th>
		            <th width="10%">총가격</th>
		    		<th width="10%">주문자명</th> 
		    		<th width="10%">주소</th> 
		    		<th width="10%">이메일</th> 
		            <th width="10%">리뷰</th>
		         </tr>
		    </thead>
		    <!-- 구매에 넣을 때 마다 하나씩 증가하는 데이터 for문 활용 -->
		    <tbody border="1" width="1200" height="50">
<%		    
		if(idx.size() == 0){
%>
		<tr>
            <td colspan="9">구매 내역이 존재하지 않습니다.</td>
        </tr>
<%
		}
		else{
			 for(int i=0; i<idx.size(); i++){
%>
		         <tr>
		            <td><%=brandname.get(i)%></td>
		            <td><%=productname.get(i)%></td>
		            <td><%=price.get(i)%></td>
		            <td><%=count.get(i)%></td>
		            <td><%=price.get(i) * count.get(i)%></td>
		            <td><%=ordername.get(i)%></td>
		            <td><%=orderaddress.get(i)%></td>
		            <td><%=orderemail.get(i)%></td>
		            <td><a href="./review/insertreview.jsp?id=<%=id %>&idx=<%=idx.get(i)%>">리뷰쓰기</a></td>
		        </tr>
<%
			 }
		}
%>
		        
		    </tbody>
		</table>
    
      </div>
    </li>
    
    <li data-tab="./qanda/qanda" id="tab4" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu4">
      <label for="tabmenu4">Q&A</label>
      <div class="tabCon" style="width: 100%" id="tabcontent">
      
		 <div class="container">
		 	<iframe  id="iframe"  frameborder=0 framespacing=0 marginheight=0 marginwidth=0 vspace=0 src="./qanda.jsp?id=<%=iid%>&name=<%=mypageName%>"></iframe>
		 </div>
	</div>
      	
   </div>
      
    </li>
  </ul>
</div>

<script>
function review(id, idx, i){
	
}
</script>


<!-- 꾸미기 끝  -->


  </div></div></div> <!-- 이 안에 내용 적어주세요 끝 -->
  <%
  	count.clear();
	idx.clear();
	ordername.clear();
	orderaddress.clear();
	orderemail.clear();

	price.clear();
	gup.clear();
	productname.clear();
	brandname.clear();
  %>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>