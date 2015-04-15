package ru.quizgame.entityclasses;

public class Pair {
	private int gameId;
	private int questionId;
	private int orderNumber;
	private Boolean isCorrect;
	
	
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public int getGameId() {
		return gameId;
	}
	public void setGameId(int gameId) {
		this.gameId = gameId;
	}
	public void setIsCorrect (Boolean isCorrect) {
		this.isCorrect = isCorrect;
	}
	public Boolean  getIsCorrect () {
		return isCorrect;
	}
	
	public Pair () {
		this.gameId = 0;
		this.questionId = 0;
		this.orderNumber = 0;
		this.isCorrect = null;
	}
	
	public Pair (int gameId, int questionId, int orderNumber, Boolean isCorrect) {
		this.gameId = gameId;
		this.questionId = questionId;
		this.orderNumber = orderNumber;
		this.isCorrect = isCorrect;
	}
	public Pair (Pair old) {
		this.gameId = old.getGameId();
		this.orderNumber = old.getOrderNumber();
		this.questionId = old.getQuestionId();
		this.isCorrect = old.getIsCorrect();
	}

}
