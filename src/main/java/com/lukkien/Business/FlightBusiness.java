package com.lukkien.Business;

import com.lukkien.Exception.ApplicationBusinessException;
import com.lukkien.Exception.BadRequestException;
import com.lukkien.model.AddFlightRequest;
import com.lukkien.model.Airport;
import com.lukkien.model.SearchResult;

import java.util.List;

public interface FlightBusiness {
    List<SearchResult> findFlights(String originIataCode, String destIataCode ) throws BadRequestException;
    List<Airport> findAirports(String airportStr) throws ApplicationBusinessException;
    void addFlight(AddFlightRequest addFlightRequest);
}
