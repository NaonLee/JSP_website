<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import = "user.UserDAO" %>
<%@ page import = "evaluation.EvaluationDTO" %>
<%@ page import = "evaluation.EvaluationDAO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.net.URLEncoder" %>

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
	request.setCharacterEncoding("UTF-8");
	String genre = "전체";									//to show searched contents only
	String searchType = "최신순";								//defualt value for showing the contents
	String search = "";
	int pageNumber = 0;
			
	if(request.getParameter("genre") != null){				//if user try to search
		genre = (String) request.getAttribute("genre");
	}
	if(request.getParameter("searchType") != null){
		searchType = (String) request.getAttribute("searchType");
	}
	if(request.getParameter("search") != null){
		search = (String) request.getAttribute("search");
	}
	if(request.getParameter("pageNumber") != null){
		try{
			pageNumber = Integer.parseInt(request.getAttribute("pageNumber"));
	} catch (Exception e){
		System.out.println("검색 페이지 번호 오류");
	}
	}
			
			
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href = 'userLogin.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
	if(emailChecked == false){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이메일 인증이 필요합니다.');");
		script.println("location.href = 'emailSendConfirm.jsp");
		script.println("</script>");
		script.close();
		return;
	}
%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">책 평론 웹 사이트</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div id="navbar" class="collapse navbar-collapse">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active">
				<a class="nav-link" href="index.jsp">메인</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
					회원 관리
				</a>
				<div class="dropdown-menu" aria-labelledby="dropdown">
				<%
					if(userID == null){
				%>
					<a class="dropdown-item" href="userLogin.jsp">로그인</a>
					<a class="dropdown-item" href="userJoin.jsp">회원가입</a>
				<%
					} else{
				%>
					
					<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
				<%
					}
				%>	
				</div>
			</li>
		</ul>
		<form action="./index.jsp" method ="get" class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" input type="text" name="search" placeholder="내용 입력" aria-label="search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
		</form>
		</div>
	</nav>
	
	<section class="container">
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="genre" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="픽션" <% if(genre.equals("픽션")) out.println("selected"); %>>픽션</option>
				<option value="논픽션" <% if(genre.equals("논픽션")) out.println("selected"); %>>논픽션</option>
				<option value="기타" <% if(genre.equals("기타")) out.println("selected"); %>>기타</option>
			</select>
			<select name="searchType" class="form-control mx-1 mt-2">
				<option value="최신순">최신순</option>
				<option value="추천순" <% if(searchType.equals("추천순")) out.println("selected"); %>>추천순</option>
			</select>
			
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button> 
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">등록하기</a>
			<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#reportModal">신고하기</a>
		</form>
	<%
		ArrayList<EvaluationDTO> evaluationList = new ArrayList<EvaluationDTO>();
		evaluationList = new EvaluationDAO().getList(genre, searchType, search, pageNumber);
		if(evaluationList != null)
			for (int i = 0; i < evaluationList.size(); i++){
				if(i == 5) break;
				EvaluationDTO evaluation = evaluationList.get(i);

	%>
		
			<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left"><%= evaluation.getBookName()%>&nbsp;<small><%= evaluation.getAuthorName() %></small></div>
					<div class="col-12 text-right">
						종합<span style="color: red;"><%= evaluation.getTotalScore() %></span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<h5 class="card-title">
					><%= evaluation.getEvaluationTitle() %> &nbsp;<small>국가-<%= evaluation.getNationality() %></small>&nbsp;<small>장르-<%= evaluation.getGenre() %>
				</h5>
				<p class="card-text"><%= evaluation.getEvaluationContent() %></p>
				<div class="row">
					<div class="col-9 text-left">
						내용 <span style="color: red;"><%= evaluation.getContentScore() %></span>
						문체 <span style="color: red;"><%= evaluation.getWritingStyleScore() %></span>
						결말 <span style="color: red;"><%= evaluation.getEndingScore() %></span>
						<span style="color: green;"><%= evaluation.getLikeCount() %></span>
					</div>
					<div class="col-3 text-right">
						<a onclick="return confirm('추천하십니까?')" href="./likeAction.jsp?evaluationID=<%= evaluation.getEvaluationID()%>">추천</a>
						<a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?evaluationID=<%= evaluation.getEvaluationID()%>">삭제</a>
					</div>
				</div>
			</div>
		</div>
	
	<%
		}
	%>
	</section>
	
	<ul class="pagination justify-content-center mt-3">
		<li class="page-item">
		<%
			if(pageNumber <= 0){
		%>
		<a class="page-link disabled">이전</a>
		<%
			} else {
		%>
		<a class="page-link" href="./index.jsp?genre=<%= URLEncoder.encode(genre, "UTF-8") %>&searchType=
		<%= URLEncoder.encode(searchType,"UTF-8") %>&search=<%= URLEncoder.encode(search, "UTF-8") %>%pagenumber=
		<%= pageNumber -1 %>">이전</a>
		
		<%
		}
		%>
		</li>
		
		<li>
		<%
			if(evaluationList.size() <= 6){
		%>
		<a class="page-link disabled">다음</a>
		<%
			} else{
		%>
		<a class="page-link" href="./index.jsp?genre=<%=URLEncoder.encode(genre, "UTF-8") %>&searchType=
		<%= URLEncoder.encode(searchType,"UTF-8") %>&search=<%= URLEncoder.encode(search, "UTF-8") %>%pagenumber=
		<%= pageNumber + 1 %>">다음</a>
		
		<%
		}
		%>
		</li>
		
	</ul>
	<div class="modal fade" id="registerModal" tabindex="=1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">평가등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>				
				</div>
				<div class="modal-body">
					<form action="./evaluationRegisterAction.jsp" method="post">
						<div class="form-row">
							<div class="form-group col -sm-6">
								<label>책이름</label>
								<input type="text" name="BookName" class="form-control" maxlength="20">
							</div>
							<div class="form-group col -sm-6">
								<label>작가명</label>
								<input type="text" name="authorName" class="form-control" maxlength="20">
							</div>
						</div>	
						<div class="form-row">
							<div class="form-group col -sm-4">
								<label>출판 연도</label>
								<select name="publishYear" class="form-control">
									<option value="2010">2010</option>
									<option value="2011">2011</option>
									<option value="2012">2012</option>
									<option value="2013">2013</option>
									<option value="2014">2014</option>
									<option value="2015">2015</option>
									<option value="2016">2016</option>
									<option value="2017">2017</option>
									<option value="2018">2018</option>
									<option value="2019">2019</option>
									<option value="2020" selected>2020</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>출판 국가</label>
								<select name="nationality" class="form-control">
									<option value = "아시아" selected>아시아</option>
									<option value = "미주">아시아</option>
									<option value = "유럽">미주</option>
									<option value = "기타">기타</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>분류</label>
								<select name="genre" class="form-control">
									<option value = "픽션" selected>픽션</option>
									<option value = "논픽션">논픽션</option>
									<option value = "기타">기타</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label>제목</label>
							<input type="text" name="evaluationTitle" class="form-control" maxlength="30">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="evaluationContent" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-3">
								<label>종합</label>
								<select name="totalScore" class="form-control">
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>내용</label>
								<select name="contentScore" class="form-control">
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>문체</label>
								<select name="WritingStyleScore" class="form-control">
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>결말</label>
								<select name="EndingScore" class="form-control">
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="reportModal" tabindex="=1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">신고하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>				
				</div>
				<div class="modal-body">
					<form action="./reportAction.jsp" method="post">
						
						<div class="form-group">
							<label>신고 제목</label>
							<input type="text" name="reportTime" class="form-control" maxlength="30">
						</div>
						<div class="form-group">
							<label>신고 내용</label>
							<textarea name="reportContent" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-danger">신고하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
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