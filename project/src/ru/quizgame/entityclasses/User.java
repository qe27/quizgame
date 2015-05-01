package ru.quizgame.entityclasses;

public class User {
	private int id;
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User () {
		this.id = 0;
		this.name = null;
	}
	public User (int id, String name) {
		this.id = id;
		this.name = name;
	}
	public User (User old) {
		this.id = old.getId();
		this.name = old.getName();
	}
	
}

