package com.lukkien.service.impl;

import com.lukkien.dao.FlightDAO;
import com.lukkien.dto.FlightResultsDto;
import com.lukkien.model.Airport;
import com.lukkien.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class FlightServiceImpl implements FlightService {

    @Autowired
    FlightDAO flightDao;

   // @Override
    public List<FlightResultsDto> findFlights(Airport arrival, Airport destination) {

        FlightResultsDto  flightResultsDto = new FlightResultsDto ("LHR", "SFO", "34 USD");
        List flightResultDtos = new ArrayList<FlightResultsDto>();
        flightResultDtos.add(flightResultsDto);
        return flightResultDtos;
    }

    @Override
    public List<Airport> findAirports(String airportStr) {
        System.out.println("Service Flight*****************");
        return flightDao.findAirports(airportStr);
    }
}
