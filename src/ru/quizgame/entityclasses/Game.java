

package ru.quizgame.entityclasses;

public class Game {
    private int id;
    private int player_id;
    private int score;
    private boolean finished;
    
    public Game(int id, int player_id, int score, boolean finished ) {
        this.id = id;
        this.player_id = player_id;
        this.score = score;
        this.finished = finished;
    }
    
    public int getId() {
        return id;
    }
    public int getPlayer_id() {
        return player_id;
    }
    
    public int getScore() {
        return score;
    }
    public boolean getFinished() {
        return finished;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public void setPlayer_id(int player_id) {
        this.player_id = player_id;
    }
    
    public void setScore(int score) {
        this.score = score;
    }
    public void setFinished(boolean finished) {
        this.finished = finished;
    }
    
}
