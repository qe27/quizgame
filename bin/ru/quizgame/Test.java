/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.quizgame;

import static java.lang.Thread.sleep;
import ru.quizgame.daoclasses.QuestionDao;
import ru.quizgame.entityclasses.QuestionEntity;

/**
 *
 * @author artve_000
 */
public class Test {
    public static void main (String args[]) throws InterruptedException {
        QuestionDao dao = new QuestionDao();
        dao.insertQuestion(new QuestionEntity(8, "How much is the fish?", "lalala", 1, 1));
        //sleep(5000);
        QuestionEntity question = dao.getQuestion(8);
        System.out.println(question.getQuestion());
    }
}
