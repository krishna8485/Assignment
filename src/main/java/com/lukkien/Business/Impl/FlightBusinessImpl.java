package com.lukkien.Business.Impl;

import com.lukkien.Exception.ApplicationBusinessException;
import com.lukkien.Exception.ApplicationServiceException;
import com.lukkien.Exception.BadRequestException;
import com.lukkien.Exception.NotFoundException;
import com.lukkien.model.AddFlightRequest;
import com.lukkien.model.Airport;
import com.lukkien.model.SearchResult;
import com.lukkien.service.FlightService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class FlightBusinessImpl implements com.lukkien.Business.FlightBusiness {

    @Autowired
    FlightService flightServiceImpl;

    private static final Logger logger = LogManager.getLogger(FlightBusinessImpl.class);

    /**
     *
     * @param originIataCode
     * @param destIataCode
     * @return
     * @throws NotFoundException
     * @throws BadRequestException
     */
    @Override
    public List<SearchResult> findFlights(String originIataCode, String destIataCode) throws BadRequestException {

        originIataCode = checkData(originIataCode);
        destIataCode = checkData(destIataCode);
        logger.info("IATA CODE : " + originIataCode +" : " +destIataCode);
        List<SearchResult> flightsResults = null;
        flightsResults = flightServiceImpl.findFlights(originIataCode, destIataCode);
        if (flightsResults!=null) {
            logger.info("flightResultsDTo " + flightsResults.toString());
        } else {
            flightsResults = new ArrayList<>();
        }
        return flightsResults;
    }

    /**
     *
     * @param queryString
     * @return
     */
    @Override
    public List<Airport> findAirports(String queryString) throws ApplicationBusinessException {
        try {
            return flightServiceImpl.findAirports(queryString);
        } catch (ApplicationServiceException e) {
            throw new ApplicationBusinessException(e.getMessage(), e);
        }

    }

    /**
     *
     * @param addFlightRequest
     */
    @Override
    public void addFlight(AddFlightRequest addFlightRequest) {
        flightServiceImpl.addFlight(addFlightRequest.getOriginAirport(), addFlightRequest.getDestAirport(), addFlightRequest.getFare());
  }

    /**
     *
     * @param strValidate
     * @throws BadRequestException
     */
    private String checkData(String strValidate) throws BadRequestException {
        logger.info("info flight search executed   " +strValidate);
        if (strValidate != null) {
            logger.info("strValidate  " +strValidate);
            String [] origins= strValidate.split(",");
            logger.info(" origins " +origins.length);
            if (origins.length >2) {
                logger.info(" origins " +origins[2]);
                return origins[2];
            } else {
                throw new BadRequestException("Bad Request");
            }
        } else {
            throw new BadRequestException("Bad Request");
        }
    }


}
