package org.example.model;

import java.sql.Date;

public class Student {
    private Long id;
    private String surname;
    private String name_student;
    private String group_student;
    private Date date_student;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getName_student() {
        return name_student;
    }

    public void setName_student(String name_student) {
        this.name_student = name_student;
    }

    public String getGroup_student() {
        return group_student;
    }

    public void setGroup_student(String group_student) {
        this.group_student = group_student;
    }

    public Date getDate_student() {
        return date_student;
    }

    public void setDate_student(Date date_student) {
        this.date_student = date_student;
    }

    public Student(Long id, String surname, String name_student, String group_student, Date date_student) {
        this.id = id;
        this.surname = surname;
        this.name_student = name_student;
        this.group_student = group_student;
        this.date_student = date_student;


    }
}
