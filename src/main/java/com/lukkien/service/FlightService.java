package com.lukkien.service;

import com.lukkien.dto.FlightResultsDto;
import com.lukkien.model.Airport;

import java.util.List;

public interface FlightService {
    List<FlightResultsDto> findFlights(Airport arrival, Airport destination);
}

