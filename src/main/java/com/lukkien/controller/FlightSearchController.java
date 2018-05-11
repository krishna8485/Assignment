package com.lukkien.controller;
import com.lukkien.Business.FlightBusiness;
import com.lukkien.Exception.ApplicationBusinessException;
import com.lukkien.Exception.BadRequestException;
import com.lukkien.Exception.NotFoundException;
import com.lukkien.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.Date;
import java.util.List;

/*
 * This Java source file was generated by the Gradle 'init' task.
 */
@RestController
public class FlightSearchController {

    @Autowired
    FlightBusiness flightBusinessImpl;

    private static final Logger logger = LogManager.getLogger(FlightSearchController.class);


    /**
     *
     * @param addFlightRequest
     * @return
     */
    @RequestMapping(value = "/addFlights", method = RequestMethod.POST)
    public ResponseEntity<String> addFlights(@RequestBody AddFlightRequest addFlightRequest) {
       logger.info("addFlights"+ addFlightRequest.toString());
       flightBusinessImpl.addFlight(addFlightRequest);
       return new ResponseEntity<>("Succesfully Added", HttpStatus.CREATED);
    }

    /**
     *
     * @param origin
     * @param destination
     * @return
     * @throws NotFoundException
     */
    @RequestMapping(value ="/getResults" , method = RequestMethod.GET)
    public @ResponseBody
    ResponseEntity<SearchResultsResponse> getResults(@RequestParam("origin")
                                                 String origin, @RequestParam("destination")
            String destination) throws NotFoundException, BadRequestException {
        logger.info("info flight search executed" + origin +" " +destination);
        List<SearchResult>  searchResults= flightBusinessImpl.findFlights(origin, destination);
        if (searchResults.size() >0 ){
            logger.info("flight results size : flightsResults.size()" );
            SearchResultsResponse searchResultsResponse = new SearchResultsResponse
                    (new Date(), "","", searchResults);
            return new ResponseEntity<>(searchResultsResponse, HttpStatus.OK);
        } else {
            throw new NotFoundException("No Data");
        }

    }

    /**
     *
     * @param queryString
     * @return
     * @throws NotFoundException
     */
    @RequestMapping(value ="/getAirportLists" , method = RequestMethod.GET)
    public @ResponseBody
    ResponseEntity<AiportsResponse> getAirportLists(@RequestParam(name="query", required=true) String queryString) throws NotFoundException,
            ApplicationBusinessException {
        logger.info("info getAirportNames executed" +queryString);
        List<Airport> airportList= null;
            airportList = flightBusinessImpl.findAirports(queryString);
        AiportsResponse jsonResponse = new AiportsResponse(new Date (), "","", airportList);
        if (airportList.size() >0 ){
            logger.info("info getAirportNames are more" );
            return new ResponseEntity<>(jsonResponse, HttpStatus.OK);
        } else {
            throw new NotFoundException("No Data");
        }
    }

}