package com.lukkien.service.impl;

import com.lukkien.dao.FlightDAO;
import com.lukkien.model.Airport;
import com.lukkien.model.SearchResult;
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
    public List<SearchResult> findFlights(String origin, String destination) {

        return flightDao.findFlights(origin,  destination);
    }


    @Override
    public List<Airport> findAirports(String airportStr) {
        System.out.println("Service Flight*****************");
        return flightDao.findAirports(airportStr);
    }
}
