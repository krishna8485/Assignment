package com.lukkien.model;

import java.util.Objects;

public class FlightResultsResponse{

    private String origin;
    private String destination;
    private String fare;

    public FlightResultsResponse(String origin, String destination, String fare) {
        this.origin = origin;
        this.destination = destination;
        this.fare = fare;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getFare() {
        return fare;
    }

    public void setFare(String fare) {
        this.fare = fare;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FlightResultsResponse that = (FlightResultsResponse) o;
        return Objects.equals(origin, that.origin) &&
                Objects.equals(destination, that.destination) &&
                Objects.equals(fare, that.fare);
    }

    @Override
    public int hashCode() {

        return Objects.hash(origin, destination, fare);
    }


    @Override
    public String toString() {
        return "FlightResultsResponse{" +
                "origin='" + origin + '\'' +
                ", destination='" + destination + '\'' +
                ", fare='" + fare + '\'' +
                '}';
    }

}
