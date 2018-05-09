package com.lukkien.service.impl;

import com.lukkien.dao.FlightDAO;
import com.lukkien.model.FlightResultsResponse;
import com.lukkien.model.Airport;
import com.lukkien.service.FlightService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class FlightServiceImpl implements FlightService {

    private static final Logger logger = LogManager.getLogger(FlightServiceImpl.class);

    @Autowired
    FlightDAO flightDao;

    @Override
    public List<FlightResultsResponse> findFlights(Airport arrival, Airport destination) {

        FlightResultsResponse  flightResultsDto = new FlightResultsResponse ("LHR", "SFO", "34 USD");
        List flightResultDtos = new ArrayList<FlightResultsResponse>();
        flightResultDtos.add(flightResultsDto);
        return flightResultDtos;
    }


    @Override
    public List<Airport> findAirports(String airportStr) {
        System.out.println("Service Flight*****************");
        return flightDao.findAirports(airportStr);
    }
}
