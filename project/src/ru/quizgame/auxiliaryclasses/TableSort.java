/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.quizgame.auxiliaryclasses;

import java.sql.SQLException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import javax.naming.NamingException;
import ru.quizgame.daoclasses.GameDao;
import ru.quizgame.daoclasses.UserDao;
import ru.quizgame.entityclasses.User;

/**
 *
 * @author Борисов
 */
public class TableSort {
    public enum Order {SCORE, HIT_RATIO, GAMES};
    private Order order = Order.SCORE;
    private Map<Integer, Double> usersMap;
    public void setOrder(Order order) {
        this.order = order;
    }
    public void sort(List<User> list) throws SQLException, NamingException{
        usersMap = new TreeMap<>();
        for(User user : list) {
            switch(order) {
                case SCORE:
                    usersMap.put(user.getId(), new Double(UserDao.getPoints(user.getId())));
                    break;
                case HIT_RATIO: 
                    usersMap.put(user.getId(), UserDao.getHitRatio(user.getId()));
                    break;
                case GAMES: 
                    usersMap.put(user.getId(), new Double(GameDao.getGameCount(user.getId())));
                    break;
            }
        }
        Collections.sort(list, new Comparator<User>() {
            public int compare(User user1, User user2) {
                if (usersMap.get(user2.getId()) > usersMap.get(user1.getId())) {
                    return 1;
                }
                else if (usersMap.get(user2.getId()) < usersMap.get(user1.getId())) {
                    return -1;
                }
                else return 0;
            }
        });
    }
}
