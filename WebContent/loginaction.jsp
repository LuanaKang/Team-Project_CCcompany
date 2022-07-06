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
<title>Insert title here</title>
</head>
<body>
 <%
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	if (id != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert<'이미 로그인이 되어있습니다.'>");
		script.println("location.href = './team_main.jsp'");
		script.println("</script>");
	}
	userDAO userDAO = new userDAO();
	int result = userDAO.login(user.getId(), user.getPassword());
	if(result == 1){
		session.setAttribute("id", user.getId());
		PrintWriter script = response.getWriter();
		String inid = request.getParameter("id");
		String inpw = request.getParameter("password");
		String url = "team_main.jsp?id=";
		script.println("<script>");
		script.println("location.href = '" + url +  inid + "'" );
		/* out.println("id: " + inid + "    pw: " + inpw); */
		script.println("</script>");
	
	}
	else if(result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터 베이스 오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	%>
</body>
</html>