<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<a class="dropdown-item" href="userLogin.jsp">로그인</a>
					<a class="dropdown-item" href="userJoin.jsp">회원가입</a>
					<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
				</div>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search" placeholder="내용 입력" aria-label="search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
		</form>
		</div>
	</nav>
	
	<section class="container">
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="BookDivide" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="픽션">픽션</option>
				<option value="논픽션">논픽션</option>
				<option value="기타">기타</option>
			</select>
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button> 
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">등록하기</a>
			<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#reportModal">신고하기</a>
		</form>
		
			<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">오감도&nbsp;<small>이상</small></div>
					<div class="col-12 text-right">
						종합<span style="color: red;">100</span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<h5 class="card-title">
					좋은 책이다. &nbsp;<small>(출판국가 아시아)</small>
				</h5>
				<p class="card-text">13인의 아해</p>
				<div class="row">
					<div class="col-9 text-left">
						종합 <span style="color: red;">80</span>
						추천 <span style="color: red;">완전추천</span>
						문체 <span style="color: red;">A</span>
						<span style="color: green;">(추천: 15)</span>
					</div>
					<div class="col-3 text-right">
						<a onclick="return confirm('추천하십니까?')" href="./likeAction.jsp?evaluationID=">추천</a>
						<a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?evaluationID=">삭제</a>
					</div>
				</div>
			</div>
		</div>
	
	</section>
	
	
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
								<input type="text" name="AuthorName" class="form-control" maxlength="20">
							</div>
						</div>	
						<div class="form-row">
							<div class="form-group col -sm-4">
								<label>출판 연도</label>
								<select name="PublishYear" class="form-control">
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
								<select name="reviewDivide" class="form-control">
									<option value = "아시아" selected>아시아</option>
									<option value = "미주">아시아</option>
									<option value = "유럽">미주</option>
									<option value = "기타">기타</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>분류</label>
								<select name="reviewDivide" class="form-control">
									<option value = "픽션" selected>픽션</option>
									<option value = "논픽션">논픽션</option>
									<option value = "기타">기타</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label>제목</label>
							<input type="text" name="evaluationTime" class="form-control" maxlength="30">
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
								<select name="recommandScore" class="form-control">
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>문체</label>
								<select name="WritingScore" class="form-control">
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>결말</label>
								<select name="WritingScore" class="form-control">
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