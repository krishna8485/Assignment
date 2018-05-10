package com.lukkien.dao;


import com.lukkien.model.Airport;
import com.lukkien.model.SearchResult;

import java.util.List;

public interface FlightDAO {

    public List<SearchResult> findFlights(String arrival, String destination) ;
    public List<Airport> findAirports(String airportStr);

}
