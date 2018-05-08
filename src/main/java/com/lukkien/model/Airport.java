package com.lukkien.model;

import java.io.Serializable;
import java.util.Objects;

public class Airport implements Serializable {

    private final String iataCode;

    private final String airportName;

    public  Airport(String iataCode, String airportName) {
        this.iataCode = iataCode;
        this.airportName = airportName;
    }


    public String getIataCode() {
        return iataCode;
    }

    public String getAirportName() {
        return airportName;
    }



    @Override
    public int hashCode() {

        return Objects.hash(iataCode, airportName);
    }

    @Override
    public String toString() {
        return "Airport{" +
                "iataCode='" + iataCode + '\'' +
                ", airportName='" + airportName + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Airport airport = (Airport) o;
        return Objects.equals(iataCode, airport.iataCode) &&
                Objects.equals(airportName, airport.airportName);
    }



}
