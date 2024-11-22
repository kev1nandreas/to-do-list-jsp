package net.pwebf.taskmanagement.model;

import java.sql.Timestamp;

public class Task {
	protected int id;
	protected String name;
	protected Timestamp duedate;
	protected String description;
	protected boolean status;
	protected int u_id;
	
	public Task() {
	}

	public Task(String name, Timestamp duedate, String description, boolean status, int u_id) {
		super();
		this.name = name;
		this.duedate = duedate;
		this.description = description;
		this.status = status;
		this.u_id = u_id;
	}

	public Task(int id, String name, Timestamp duedate, String description, boolean status, int u_id) {
		super();
		this.id = id;
		this.name = name;
		this.duedate = duedate;
		this.description = description;
		this.status = status;
		this.u_id = u_id;
	}

    // Getter and Setter for id
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    // Getter and Setter for id
    public int getUid() {
        return id;
    }

    public void setUid(int u_id) {
        this.u_id = u_id;
    }

    // Getter and Setter for name
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Getter and Setter for duedate
    public Timestamp getDuedate() {
        return duedate;
    }

    public void setDuedate(Timestamp duedate) {
        this.duedate = duedate;
    }

    // Getter and Setter for description
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    // Getter and Setter for status
    public boolean isStatus() { // Use 'is' for boolean getter
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
