package net.pwebf.usermanagement.model;

public class User {
    protected int id;
    protected String name;
    protected String email;
    protected String phone;
    protected String username;
    protected String password;
    protected boolean notify;
    protected int notify_before;

    // Constructor
    public User() {}

    public User(int id, String name, String email, String phone, String username, String password, boolean notify, int notify_before) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.username = username;
        this.password = password;
        this.notify = notify;
        this.notify_before = notify_before;
    }
    public User(String username, String password) {
    	this.username = username;
    	this.password = password;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isNotify() {
        return notify;
    }

    public void setNotify(boolean notify) {
        this.notify = notify;
    }

    public int getNotifyBefore() {
        return notify_before;
    }

    public void setNotifyBefore(int notify_before) {
        this.notify_before = notify_before;
    }
}

