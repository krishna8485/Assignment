package com.lukkien.dao.impl;

import com.lukkien.dao.FlightDAO;
import com.lukkien.model.FlightResultsResponse;
import com.lukkien.model.Airport;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;
import springfox.documentation.annotations.Cacheable;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Repository("flightDoaImpl")
public class FlightDAOImpl implements FlightDAO{

    private static final Logger logger = LogManager.getLogger(FlightDAOImpl.class);

    @Override
    public List<FlightResultsResponse> findFlights(Airport arrival, Airport destination) {
        return null;
    }

    @Cacheable("airport")
    @Override
    public List<Airport> findAirports(String airportStr ) {

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
            logger.error("Exception", e);
        }
        return airportList;

    }
}