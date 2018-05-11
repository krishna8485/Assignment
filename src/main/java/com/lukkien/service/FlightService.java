package com.lukkien.service;

import com.lukkien.Exception.ApplicationServiceException;
import com.lukkien.model.Airport;
import com.lukkien.model.SearchResult;

import java.util.List;

public interface FlightService {
    List<SearchResult> findFlights(String originIataCode, String destIataCode );
    List<Airport> findAirports(String airportStr) throws ApplicationServiceException;
    void addFlight(Airport originAirport, Airport destAirport, String fare);
}

