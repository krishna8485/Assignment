package com.lukkien.Entities;


import javax.persistence.*;

@Entity
public class Airport {
    @Id
    @Column(name = "iataCode")
    private  String iataCode;
    @Column(name = "cityAirportName")
    private  String cityAirportName;
    @Column(name = "country")
    private  String country;

    public String getIataCode() {
        return iataCode;
    }

    public void setIataCode(String iataCode) {
        this.iataCode = iataCode;
    }

    public String getCityAirportName() {
        return cityAirportName;
    }

    public void setCityAirportName(String cityAirportName) {
        this.cityAirportName = cityAirportName;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Airport() {
    }

    public Airport(String iataCode, String cityAirportName, String country) {
        this.iataCode = iataCode;
        this.cityAirportName = cityAirportName;
        this.country = country;
    }
}
