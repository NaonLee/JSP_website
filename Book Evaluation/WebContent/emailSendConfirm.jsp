<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
	<meta tyyp-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>책 평론 사이트</title>
	
	<!-- Add Bootstrap CSS -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- Add custom CSS -->
	<link rel="stylesheet" href="./css/custom.css">
	
	
</head>

<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href = 'userLogin.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
%>
	
	<section class="container mt-3" style="max-width:560px;">
		<div class="alert alert-warning mt-4" role="alert">
			이메일 주소 인증을 하셔야 이용 가능합니다.
		</div>
		<a href="emailSendAction.jsp" class="btn btn-primary">인증 메일 재 전송</a>
		
	</section>
	
	
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 2020 이나온 All Rights Reserved.
	</footer>
	
	<!-- add JQuery javascript -->
	<script src="./js/jquery.min.js"></script>
	<!-- add Popper javascript -->
	<script src="./js/popper.js"></script>
	<!-- add Bootstrap javascript -->
	<script src="./js/bootstrap.min.js"></script>
	
	
</body>
</html>