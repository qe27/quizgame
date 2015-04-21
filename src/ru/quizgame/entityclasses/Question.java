/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.quizgame.entityclasses;

/**
 *
 * @author artve_000
 */
public class Question {
    
    private int id;
    private String question;
    private String answers;
    private int correctAnswer;
    private int difficulty;
    
    public Question(int id, String question, String answers, int correctAnswer, int difficulty) {
        this.id = id;
        this.question = question;
        this.answers = answers;
        this.correctAnswer = correctAnswer;
        this.difficulty = difficulty;
    }
    
    public int getId() {
        return id;
    }
    public String getQuestion() {
        return question;
    }
    public String getAnswers() {
        return answers;
    }
    public int getCorrectAnswer() {
        return correctAnswer;
    }
    public int getDifficulty() {
        return difficulty;
    }
    public void setId(int id) {
        this.id = id;
    }
    public void setQuestion(String question) {
        this.question = question;
    }
    public void setAnswers(String answers) {
        this.answers = answers;
    }
    public void setCorrectAnswer(int correctAnswer) {
        this.correctAnswer = correctAnswer;
    }
    public void setDifficulty(int difficulty) {
        this.difficulty = difficulty;
    }
    
}

