package org.example.model;

public class Discipline {

    private int id;
    private String discipline;

    public Discipline() {
    }

    public Discipline(int id, String discipline) {
        this.id = id;
        this.discipline = discipline;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDiscipline() {
        return discipline;
    }

    public void setDiscipline(String discipline) {
        this.discipline = discipline;
    }
}
