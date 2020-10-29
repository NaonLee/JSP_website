<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="evaluation.EvaluationDTO"%>
<%@ page import="evaluation.EvaluationDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.');");
		script.println("location.href = 'userLogin.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	String BookName = null;
	String authorName = null;
	int publishYear = 0;
	String nationality = null;
	String genre = null;
	String evaluationTitle = null;
	String evaluationContent = null;
	String totalScore = null;
	String contentScore = null;
	String writingStyleScore = null;
	String endingScore = null;

	
	if(request.getParameter("BookName") != null){
		BookName = request.getParameter("BookName");
	}
	if(request.getParameter("authorName") != null){
		authorName = request.getParameter("authorName");
	}
	if(request.getParameter("publishYear") != null){
		try{
			publishYear = Integer.parseInt(request.getParameter("publishYear"));
		} catch (Exception e){
			System.out.println("강의연도 데이터 오류");
		}
	}
	if(request.getParameter("nationality") != null){
		nationality = request.getParameter("nationality");
	}
	if(request.getParameter("genre") != null){
		genre = request.getParameter("genre");
	}
	if(request.getParameter("evaluationTitle") != null){
		evaluationTitle = request.getParameter("evaluationTitle");
	}
	if(request.getParameter("evaluationContent") != null){
		evaluationContent = request.getParameter("evaluationContent");
	}
	if(request.getParameter("totalScore") != null){
		totalScore = request.getParameter("totalScore");
	}
	if(request.getParameter("contentScore") != null){
		contentScore = request.getParameter("contentScore");
	}
	if(request.getParameter("writingStyleScore") != null){
		writingStyleScore = request.getParameter("writingStyleScore");
	}
	if(request.getParameter("endingScore") != null){
		endingScore = request.getParameter("endingScore");
	}
	
	if(BookName == null || authorName == null || publishYear == 0 || nationality == null || genre == null || 
			evaluationTitle == null || evaluationContent == null || totalScore == null || contentScore == null || 
			writingStyleScore == null || endingScore == null | evaluationTitle.equals("") || evaluationContent.equals("")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다');");
		script.println("history.back(();");
		script.println("</script>");
		script.close();
		return;
	}
	
	EvaluationDAO evaluationDAO = new EvaluationDAO();
	
	int result = evaluationDAO.write(new EvaluationDTO(0, userID, BookName, authorName, publishYear, nationality, genre,
			evaluationTitle, evaluationContent, totalScore, contentScore, writingStyleScore, endingScore, 0));
	
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('평가 등록이 실패했습니다.');");
		script.println("history.back(();");
		script.println("</script>");
		script.close();
		return;
	} else{
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('등록 성공!');");
		script.println("location.href = index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
	
	
%>