package com.lukkien.service.impl;


import com.lukkien.Exception.ApplicationServiceException;
import com.lukkien.dao.FlightDAO;
import com.lukkien.model.Airport;
import com.lukkien.model.SearchResult;
import com.lukkien.service.FlightService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FlightServiceImpl implements FlightService {

    private static final Logger logger = LogManager.getLogger(FlightServiceImpl.class);

    @Autowired
    FlightDAO flightDao;

    /**
     *
     * @param originIataCode
     * @param destIataCode
     * @return
     */
    @Override
    public List<SearchResult> findFlights(String originIataCode, String destIataCode )  {
        logger.info("Service addFlight********str str*********");
            return flightDao.findFlights(originIataCode,  destIataCode);

    }

    /**
     *
     * @param airportStr
     * @return
     */
    @Override
    public List<Airport> findAirports(String airportStr) throws ApplicationServiceException {
        logger.info("Service findAirports*****************");
            return flightDao.findAirports(airportStr);

    }

    /**
     *
     * @param originAirport
     * @param destAirport
     * @param fare
     */
    @Override
    public void addFlight(Airport originAirport, Airport destAirport, String fare){
        logger.info("Service addFlight********Aiprot Airport fare*********");
            flightDao.addFlight(originAirport,  destAirport,  fare);

    }
}
