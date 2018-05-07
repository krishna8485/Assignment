package com.lukkien.service.impl;

import com.lukkien.dao.FlightDAO;
import com.lukkien.dto.FlightResultsDto;
import com.lukkien.model.Airport;
import com.lukkien.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class FlightServiceImpl implements FlightService {

    @Autowired
    FlightDAO flightDao;

   // @Override
    public List<FlightResultsDto> findFlights(Airport arrival, Airport destination) {
        return null;
    }
}
