package com.lukkien.dao;


import com.lukkien.model.FlightResultsResponse;
import com.lukkien.model.Airport;

import java.util.List;

public interface FlightDAO {

    public List<FlightResultsResponse> findFlights(Airport arrival, Airport destination) ;
    public List<Airport> findAirports(String airportStr);

}
