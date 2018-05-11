package com.lukkien.model;

import java.io.Serializable;
import java.util.Objects;

public class Airport implements Serializable {

    private  String iataCode;
    private  String airportName;
    private  String city ;
    private  String state ;
    private  String country;

    public Airport() {}

    public  Airport(String iataCode, String airportName, String city, String state, String country) {
        this.iataCode = iataCode;
        this.airportName = airportName;
        this.city = city;
        this.state = state;
        this.country = country;
    }

    public  Airport(String iataCode, String airportName, String country) {
        this.iataCode = iataCode;
        this.airportName = airportName;
        this.country = country;
    }


    public String getCity() {
        return city;
    }

    public String getState() {
        return state;
    }

    public String getCountry() {
        return country;
    }

    public String getIataCode() {
        return iataCode;
    }

    public String getAirportName() {
        return airportName;
    }


    public void setIataCode(String iataCode) {
        this.iataCode = iataCode;
    }

    public void setAirportName(String airportName) {
        this.airportName = airportName;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setCountry(String country) {
        this.country = country;
    }


    @Override
    public String toString() {
        return "Airport{" +
                "iataCode='" + iataCode + '\'' +
                ", airportName='" + airportName + '\'' +
                ", city='" + city + '\'' +
                ", state='" + state + '\'' +
                ", country='" + country + '\'' +
                '}';
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Airport airport = (Airport) o;
        return Objects.equals(iataCode, airport.iataCode) &&
                Objects.equals(airportName, airport.airportName) &&
                Objects.equals(city, airport.city) &&
                Objects.equals(state, airport.state) &&
                Objects.equals(country, airport.country);
    }

    @Override
    public int hashCode() {

        return Objects.hash(iataCode, airportName, city, state, country);
    }
}
