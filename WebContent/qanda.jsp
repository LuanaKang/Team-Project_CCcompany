<%@page import="java.util.Collections"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ㅇㅇ홈페이지</title>
<link rel="stylesheet" href="./css/basis_Su.css">
<link rel="stylesheet" href="./css/qanda.css">
<!-- 부트스트랩 4.6 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
</head>

<script type="text/javascript">
	function click_url(iidx){
		console.log(iidx);
	}

</script>

<body>
<%@ include file="./basis/qanda_db/qanda_db.jsp" %>		<!-- db 불러옴 --> 

<%!
//	페이지 작업에 사용할 8개의 변수를 선언한다. => 계산에 의한 값을 가져와야 하는 변수는 0으로 초기화한다.
 	int pageSize=7;		// 한 페이지에 표시할 글의 개수
 	int totalPage=0;	// 전체 페이지 개수
 	int currentPage=1;	// 현재 브라우저에 표시되는 페이지 번호
 	int startNo=0;		// 현재 브라우저에 표시되는 글의 시작 인덱스 번호 => mysql의 인덱스는 0부터 시작된다.
 	int endNo=0;		// 현재 브라우저에 표시되는 글의 마지막 인덱스 번호
 	int startPage=0;	// 페이지 이동 하이퍼링크 또는 버튼에 표시될 시작 페이지 번호
 	int endPage=0;		// 페이지 이동 하이퍼링크 또는 버튼에 표시될 마지막 페이지 번호
 	int gup;
	int seq;
	String id;
	String name;
	
%>

<% 
	name = request.getParameter("name");
	id = request.getParameter("id");
	System.out.println(name);
%>

<%
	if(id.equals("admin")){
		String ssql = "SELECT COUNT(*) FROM qanda" ;	
		pstmt = conn.prepareStatement(ssql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
		 totalCount = rs.getInt(1);
		}	
		System.out.println(totalCount);
		name = "관리자";
	}
	else{
		String ssql = "SELECT COUNT(*) FROM qanda where id='"+id+"' or id='admin'" ;	
		pstmt = conn.prepareStatement(ssql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
		 totalCount = rs.getInt(1);
		}	
		System.out.println(totalCount);
	}
	
//	===========================================================================================================	

//	테이블에 저장된 글이 있으면 저장된 글의 개수를 얻어와서 ResultSet 객체에 저장하고 테이블에 저장된 글이 없으면 
//	0을 ResultSet 객체에 저장할 것이므로 ResultSet 객체에 저장되는 데이터가 무조건 있기 때문에 물어보는 동작을 
//	할 필요가 없다.
	
	/* out.println("테이블에 저장된 전체 글의 개수: "+totalCount+"개<br/>"); */
	
//	totalPage 변수에 전체 페이지 개수를 계산해 저장한다.
//	totalPage = totalCount / 10;
//	totalPage += totalCount % 10 > 0 ? 1 : 0;
	totalPage = (totalCount-1) / pageSize + 1;
	/* out.println("페이지 수: "+totalPage); */

//	===========================================================================================================	


//	이전 페이지에서 넘어오는 브라우저에 표시할 페이지 번호를 받는다.
//	정상적으로 currentPage가 넘어오면 넘어온 currentPage를 숫자로 바꿔서 currentPage 변수에 저장함변 되고 ]
// 	그렇지 않을 경우 초기값으로 지정한 1을 유지하게 하면 된다.
	try{
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
//		현재 화면에 표시되는 페이지 번호는 전체 페이지 개수보다 클 수 없으므로 화면에 표시할 페이지 번호가 전체
//		페이지 개수보다 큰 값이 넘어왔을 때 현재 페이지 번호를 전체 페이지 개수로 수정한다.
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		
	}
	catch(NumberFormatException e){
		
	}
	
//	===========================================================================================================	

//	startNo 변수에 현재 화면에 표시할 글의 시작 인덱스 번호를 계산한다.
//	mysql은 select sql 명령을 실행했을 때 맨 처음 나오는 글의 인덱스가 0부터 시작되고 oracle은 1부터 시작된다.
	startNo = (currentPage - 1) * pageSize + 1;	// oracle은 결과에 1을 더한다. => 더했음
	System.out.println("aaa" + startNo);
//	mysql은 limit를 사용하면 되기 때문에 endNo를 계산할 필요가 없지만 oracle은 limit가 없기 때문에 endNo를
//	계산해야 한다.
	endNo = startNo + pageSize - 1;
//	마지막 페이지에 표시되는 글의 개수는 반드시 화면에 표시할 글의 개수(pageSize)만큼 표시되지 않는다.
//	한 페이지에 표시할 마지막 글의 인덱스는 전체 글의 개수보다 커지면 안되므로 마지막 글의 인덱스 번호가 전체 글의
//	개수보다 커지면 전체 글의 개수로 마지막 글의 인덱스 번호를 수정한다.
	endNo = endNo > totalCount ? totalCount : endNo;

//	===========================================================================================================	


//	브라우저에 표시할 한 페이지 분량의 글을 limit를 이용해서 얻어온다. =>  db파일
	String sql;
	System.out.println("여기 옴");
	System.out.println("startno: "+startNo + "  endno:"+endNo);
	/* sql = "SELECT *FROM (SELECT ROWNUM AS NO, idx,name,subject,writedate FROM qanda order by idx asc ) WHERE  NO >="+ startNo + "AND  NO <="  + endNo  ; */
	/* sql = "select * from qanda WHERE idx <=" +startNo + " AND idx >="+ endNo +  
			" AND id='" + id + "' OR id='admin' order by gup DESC, seq ASC" ; */
		if(id.equals("admin")){
			sql = "select * from ("+
					"select rownum rnum, TT.* from ("+
							"select * from qanda order by gup2 desc, seq asc, gup desc"+
						") TT where rownum <= "+endNo+
					") where rnum >= "+startNo;
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println(sql);
			while (rs.next()) {
		      	qandaname.add(rs.getString("name"));
		      	qandasubject.add(rs.getString("subject"));
		      	qandaidx.add(rs.getInt("idx"));
		      	qandawritedate.add(rs.getTimestamp("writeDate"));
		      	qandalev.add(rs.getInt("lev"));
		      	userid.add(rs.getString("id"));
		      	writeid.add(rs.getString("id"));
		   }
			System.out.println("userid: "+userid);
	}
		else{
			
			sql = "select * from ("+
					"select rownum rnum, TT.* from ("+
							"select * from qanda WHERE id='" + id + "' OR id='admin' and gup2 = '" + id + "' order by gup desc, seq asc"+
						") TT where rownum <= "+endNo+
					") where rnum >= "+startNo;
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println(sql);
			while (rs.next()) {
		      	qandaname.add(rs.getString("name"));
		      	qandasubject.add(rs.getString("subject"));
		      	qandaidx.add(rs.getInt("idx"));
		      	qandawritedate.add(rs.getTimestamp("writeDate"));
		      	qandalev.add(rs.getInt("lev"));
		      	writeid.add(rs.getString("id"));
		      	
		      
		   }
			rnum = new ArrayList<>(qandaidx);
			System.out.println("rnum: "+rnum);
			System.out.println("qandaidx="+qandaidx);
			System.out.println("qandaidx="+qandaidx.size());
		}
	
	

%>

<div class="col p-3"> <!-- 이 안에 내용 적어주세요 -->
<div class="container">
	<h3 class="text-center">Q&A</h3><br>
	<div class="table-responsive" >
	     <table class="table table-hover table-sm" >	<!-- 게시글 목록에 글이 7개까지 나와야 예쁨 -->
	         <thead>
	             <tr class="text-center headtr" >
	                 <th style="width: 55%;">제목</th>
	                 <th style="width: 15%;">글쓴이</th>
	                 <th style="width: 20%;">날짜</th>
	             </tr>
	         </thead>
	         <tbody id="items" >
		        <%
		        int iidx;
		        System.out.println("qandaidx: "+qandaidx.size());
		        if(qandaidx.size() != 0){
					for(int i=0;i<qandaidx.size();i++) {
						iidx = qandaidx.get(i);						
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E)");
						if(id.equals("admin")){
					%>
 				             <tr class="list_tr" onclick="location.href='./basis/qanda_db/viewqanda_db.jsp?idx=<%=qandaidx.get(i) %>&id=<%=userid.get(i)%>&admin=admin&writeid=<%=writeid.get(i)%>'">
				    <%
						}
						else{
				    %>
					        <tr class="list_tr" onclick="location.href='./basis/qanda_db/viewqanda_db.jsp?idx=<%=qandaidx.get(i) %>&id=<%=id%>&admin=no&writeid=<%=writeid.get(i)%>'">
					<%
						}
					%>
				                 <td>
				                <%
						      			System.out.println(qandalev);
						      		if(qandalev.get(i)>0){
						      	%>
						      				
						      			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;↪
						      	<%
						      		}
						      	%> 
				                	 <%=qandasubject.get(i) %>
				                 
				                 </td>
				                 <td class="text-center"><%=qandaname.get(i) %></td>
				                 <td class="text-center"><%=sdf.format(qandawritedate.get(i))%></td>
				             </tr>
		            <% 			
			
					}
				}
	else{
%>
	<tr>
		<td colspan="4">
			<marquee>작성된 Q&A가 없습니다.</marquee>
		</td>
	</tr>

<%		
	}
		
%>
	
	<tr>
		<td colspan="4" align="center" class="paging_td">
				<%
			//	페이지 이동 버튼의 시작 페이지 번호와 마지막 페이지 번호를 계산한다.
				startPage = (currentPage-1) / 10 * 10 +1;
				endPage = startPage + 9;
			//	페이지 이동 버튼의 마지막 페이지 번호가 전체 페이지 수 보다 커지면 존재하지 않는 페이지 번호가 표시되므로 
			//	마지막 페이지 번호를 전체 페이지 수로 변경한다.
				endPage = endPage > totalPage ? totalPage : endPage;
				
			//	맨 앞으로	
			//	현재 보고있는 페이지가 1보다 크다면 맨 앞으로 이동할 수 있다.
				if(currentPage > 1){
			%>
				<button type="button" title="첫 페이지로 이동" onclick="location.href='?currentPage=1&id=<%=id %>'" class="button button1">처음</button>
			<% 		
				}else{
			%>
				<button type="button" title="이미 첫 페이지 입니다."  class="button button2">처음</button>
				
			<% 
				}
				
			
			//	10페이지 앞으로	
				if(startPage > 1){
			%>
				<button type="button" title="이전 10페이지로" onclick="location.href='?currentPage=<%=currentPage-10%>&id=<%=id %>'" class="button button1">이전</button>
			<% 		
				}else{
			%>
				<button type="button" title="이미 첫 10페이지 입니다."  class="button button2">이전</button>
				
			<% 
				}
					
			
			
			//	10페이지 단위로 페이지 이동 버튼을 출력한다.	
				for(int i=startPage;i<=endPage;i++){
					if(currentPage==i){
						
			%>			
						<button type="button"  class="button button2"><%=i%></button>
			
			<%			
					}else{
			%>
					<button type="button" onclick="location.href='?currentPage=<%=i%>&id=<%=id %>'"  class="button button1"><%=i%></button>
			
			<%			
					}
				}
			
			//	10페이지 뒤로
				if(endPage < totalPage){
			%>
				<button type="button" title="다음 10페이지로" onclick="location.href='?currentPage=<%=currentPage+10%>&id=<%=id %>'" class="button button1">다음</button>
			<% 		
				}else{
			%>
				<button type="button" title="마지막 페이지입니다."  class="button button2">다음</button>
				
			<% 
				}
			//	맨 뒤로
				if(endPage < totalPage){
			%>
				<button type="button" title="다음 10페이지로" onclick="location.href='?currentPage=<%=totalPage%>&id=<%=id %>'" class="button button1">맨뒤</button>
			<% 		
				}else{
			%>
				<button type="button" title="마지막 페이지입니다."  class="button button2">맨뒤</button>
				
			<% 
				}
			%>
			<br><button class="button" id="writebtn" onclick="location.href='./qanda/insertqanda.jsp?id=<%=id %>&name=<%=name%>'">글쓰기</button>
					</td>
				</tr>	
			</tbody>
	   	</table>
			<br><br><br><br>
	</div>

</div>

</div> <!-- 이 안에 내용 적어주세요 끝 -->
</script>
</body>
</html>