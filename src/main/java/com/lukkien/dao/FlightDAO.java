package com.lukkien.dao;

import com.lukkien.Exception.ApplicationServiceException;
import com.lukkien.model.Airport;
import com.lukkien.model.SearchResult;

import java.util.List;

public interface FlightDAO {

    List<SearchResult> findFlights(String arrival, String destination) ;
    List<Airport> findAirports(String airportStr) throws ApplicationServiceException;
    void addFlight(Airport originAirport, Airport destAirport, String fare);
}
