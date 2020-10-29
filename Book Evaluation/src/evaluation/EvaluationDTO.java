package evaluation;

public class EvaluationDTO {

	int evaluationID;
	String userID;
	String BookName;
	String authorName;
	int publishYear;
	String nationality;
	String genre;
	String evaluationTitle;
	String evaluationContent;
	String totalScore;
	String contentScore;
	String writingStyleScore;
	String endingScore;
	int likeCount;
	
	public int getEvaluationID() {
		return evaluationID;
	}
	public void setEvaluationID(int evaluationID) {
		this.evaluationID = evaluationID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBookName() {
		return BookName;
	}
	public void setBookName(String bookName) {
		BookName = bookName;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public int getPublishYear() {
		return publishYear;
	}
	public void setPublishYear(int publishYear) {
		this.publishYear = publishYear;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getEvaluationTitle() {
		return evaluationTitle;
	}
	public void setEvaluationTitle(String evaluationTitle) {
		this.evaluationTitle = evaluationTitle;
	}
	public String getEvaluationContent() {
		return evaluationContent;
	}
	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}
	public String getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}
	public String getContentScore() {
		return contentScore;
	}
	public void setContentScore(String contentScore) {
		this.contentScore = contentScore;
	}
	public String getWritingStyleScore() {
		return writingStyleScore;
	}
	public void setWritingStyleScore(String writingStyleScore) {
		this.writingStyleScore = writingStyleScore;
	}
	public String getEndingScore() {
		return endingScore;
	}
	public void setEndingScore(String endingScore) {
		this.endingScore = endingScore;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public EvaluationDTO() {
		
	}
	
	public EvaluationDTO(int evaluationID, String userID, String bookName, String authorName, int publishYear,
			String nationality, String genre, String evaluationTitle, String evaluationContent, String totalScore,
			String contentScore, String writingStyleScore, String endingScore, int likeCount) {
		this.evaluationID = evaluationID;
		this.userID = userID;
		BookName = bookName;
		this.authorName = authorName;
		this.publishYear = publishYear;
		this.nationality = nationality;
		this.genre = genre;
		this.evaluationTitle = evaluationTitle;
		this.evaluationContent = evaluationContent;
		this.totalScore = totalScore;
		this.contentScore = contentScore;
		this.writingStyleScore = writingStyleScore;
		this.endingScore = endingScore;
		this.likeCount = likeCount;
	}
	
	
}
