package com.lukkien.model;

import java.util.Objects;

public class AddFlightRequest {
    Airport originAirport;
    Airport destAirport;
    String fare;

    public Airport getOriginAirport() {
        return originAirport;
    }

    public void setOriginAirport(Airport originAirport) {
        this.originAirport = originAirport;
    }

    public Airport getDestAirport() {
        return destAirport;
    }

    public void setDestAirport(Airport destAirport) {
        this.destAirport = destAirport;
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
        AddFlightRequest that = (AddFlightRequest) o;
        return Objects.equals(originAirport, that.originAirport) &&
                Objects.equals(destAirport, that.destAirport) &&
                Objects.equals(fare, that.fare);
    }

    @Override
    public int hashCode() {

        return Objects.hash(originAirport, destAirport, fare);
    }

    @Override
    public String toString() {
        return "AddFlightRequest{" +
                "originAirport=" + originAirport +
                ", destAirport=" + destAirport +
                ", fare='" + fare + '\'' +
                '}';
    }
}
