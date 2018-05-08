package com.lukkien.dao;

import com.lukkien.dto.FlightResultsDto;
import com.lukkien.model.Airport;

import java.util.List;

public interface FlightDAO {

    public List<FlightResultsDto> findFlights(Airport arrival, Airport destination) ;
    public List<Airport> findAirports(String airportStr);

}
