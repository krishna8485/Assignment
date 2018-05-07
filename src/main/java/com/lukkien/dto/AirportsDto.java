package com.lukkien.dto;

import com.lukkien.model.Airport;

import java.util.List;

public class AirportsDto {

    public List<Airport> getAirportNames() {
        return airports;
    }

    public void setAirportNames(List<Airport> airportNames) {
        this.airports = airportNames;
    }

    private List<Airport> airports;




}
