package com.example;

import java.util.Date;

public class Task {
    private String employeeName;
    private String role;
    private String project;
    private Date taskDate;
    private Date startTime;
    private Date endTime;
    private String category;
    private String description;

    public Task(String employeeName, String role, String project, Date startTime, Date endTime, String category, String description) {
        this.employeeName = employeeName;
        this.role = role;
        this.project = project;
        this.taskDate = startTime; // Assuming taskDate is the start date of the task
        this.startTime = startTime;
        this.endTime = endTime;
        this.category = category;
        this.description = description;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public String getRole() {
        return role;
    }

    public String getProject() {
        return project;
    }

    public Date getTaskDate() {
        return taskDate;
    }

    public Date getStartTime() {
        return startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public String getCategory() {
        return category;
    }

    public String getDescription() {
        return description;
    }
}
