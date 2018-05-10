package com.lukkien.service;

import com.lukkien.model.Airport;
import com.lukkien.model.SearchResult;

import java.util.List;

public interface FlightService {
    List<SearchResult> findFlights(String arrival, String destination);
    List<Airport> findAirports(String airportStr);
}

