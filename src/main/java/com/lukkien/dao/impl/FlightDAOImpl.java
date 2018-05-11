package com.lukkien.dao.impl;

import com.lukkien.Exception.ApplicationServiceException;
import com.lukkien.dao.FlightDAO;
import com.lukkien.model.Airport;
import com.lukkien.model.SearchResult;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;
import springfox.documentation.annotations.Cacheable;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

@Repository("flightDoaImpl")
public class FlightDAOImpl implements FlightDAO{

    private static Map<String, List<SearchResult>>  flightMap= new HashMap<>();

    private static final Logger logger = LogManager.getLogger(FlightDAOImpl.class);

    /**
     *
     * @param originIataCode
     * @param destIataCode
     * @return
     */
    @Override
    public List<SearchResult> findFlights(String originIataCode, String destIataCode)  {
        logger.info("iDAO findFlights");
        List<SearchResult> searchResults= flightMap.get(originIataCode+"-"+destIataCode);
        if(searchResults==null ) {
            searchResults = new ArrayList<SearchResult>();
        }
        return searchResults;
    }

    /**
     *
     * @param airportStr
     * @return
     */
    @Cacheable("airport")
    @Override
    public List<Airport> findAirports(String airportStr ) throws ApplicationServiceException {

        String airportCodesCSV = "/Users/krishnasfamily/Documents/GitHub/LUKKIEN_Assignment/airport-codes.csv";

        String line = "";
        String cvsSplitBy = ",";
        List<Airport> airportList = new ArrayList<Airport>();
        try (BufferedReader br = new BufferedReader(new FileReader(airportCodesCSV))) {
            while ((line = br.readLine()) != null) {
                if(line.toLowerCase().contains(airportStr.toLowerCase())){
                    String[] airport = line.split(cvsSplitBy);
                    airportList.add(new Airport(airport[2], airport[0], airport[1]));
                    logger.info("Airport [code= " + airport[2] + " , name=" + airport[0] + "  " + airport[1]);
                }
            }
        } catch (IOException e) {
            throw new ApplicationServiceException(e, "interrupted I/O operations");
        }
        return airportList;

    }

    /**
     *
     * @param originAirport
     * @param destAirport
     * @param fare
     */
    @Override
    public void addFlight(Airport originAirport, Airport destAirport, String fare) {
        String originIC = originAirport.getIataCode();
        String destIC = destAirport.getIataCode();
        List<SearchResult> searchResults = flightMap.get(originIC+"-"+destIC);
        if (searchResults !=null){
            searchResults.add(new SearchResult(originIC,destIC, fare));
            logger.info("new Flight details added to existing list"+ searchResults.toString());
        } else {
            searchResults = new ArrayList<>();
            searchResults.add(new SearchResult(originIC,destIC, fare));
            flightMap.put(originIC+"-"+destIC, searchResults);
            logger.info("new Flight details added"+ searchResults.toString());
        }

    }
}