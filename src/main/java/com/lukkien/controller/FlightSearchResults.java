package com.lukkien.controller;

public class FlightSearchResults {

    private final long id;
    private final String content;

    public FlightSearchResults(long id, String content) {
        this.id = id;
        this.content = content;
    }

    public long getId() {
        return id;
    }

    public String getContent() {
        return content;
    }

}