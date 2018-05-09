package com.lukkien.service;

import com.lukkien.model.FlightResultsResponse;
import com.lukkien.model.Airport;

import java.util.List;

public interface FlightService {
    List<FlightResultsResponse> findFlights(Airport arrival, Airport destination);
    List<Airport> findAirports(String airportStr);
}

