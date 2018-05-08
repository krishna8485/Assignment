package com.lukkien.dao.impl;

import com.lukkien.dao.FlightDAO;
import com.lukkien.dto.FlightResultsDto;
import com.lukkien.model.Airport;
import org.springframework.stereotype.Repository;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("flightDoaImpl")
public class FlightDAOImpl implements FlightDAO{

    @Override
    public List<FlightResultsDto> findFlights(Airport arrival, Airport destination) {
        return null;
    }

    @Override
    public List<Airport> findAirports(String airportStr ) {

        String airportCodesCSV = "/Users/krishnasfamily/Documents/GitHub/LUKKIEN_Assignment/airport-codes.csv";

        String line = "";
        String cvsSplitBy = ",";
        Map<String, Airport> airportMap = new HashMap<>();
        try (BufferedReader br = new BufferedReader(new FileReader(airportCodesCSV))) {
            while ((line = br.readLine()) != null) {

                if(line.toLowerCase().contains(airportStr.toLowerCase())){
                    //System.out.println(airportStr);
                   // System.out.println(line);
                    String[] airport = line.split(cvsSplitBy);
                   /*// if (airport.length ==13) {
                    if(airport[1].contains("airport")) {
                        System.out.println("**********" + line);
                        airportMap.put(airport[11], new Airport(airport[11], airport[2], airport[8], airport[7], airport[6]));
                        System.out.println("Airport [code= " + airport[2] + " , name=" + airport[9] + "  " + airport[11]);
                        //}}
                    }*/

                    airportMap.put(airport[2], new Airport(airport[2], airport[0], airport[1]));
                    System.out.println("Airport [code= " + airport[2] + " , name=" + airport[0] + "  " + airport[1]);

                }

            }

        } catch (IOException e) {
            System.out.println("DAO Flight*****************2.1");
            //Log.
        }
        List<Airport> airports= new ArrayList<Airport>(airportMap.values());
        System.out.println("DAO Flight*****************   " + airports.size());
        return airports;

    }
}