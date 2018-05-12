package com.lukkien.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.Objects;

@ApiModel
public class Airport implements Serializable {

    private  String iataCode;
    private  String airportName;
    private  String country;

    public Airport() {}


    public  Airport(String iataCode, String airportName, String country) {
        this.iataCode = iataCode;
        this.airportName = airportName;
        this.country = country;
    }

    @ApiModelProperty(required = true, dataType = "java.lang.String", example ="Denmark")
    public String getCountry() {
        return country;
    }

    @ApiModelProperty(required = true, dataType = "java.lang.String", example="AAL")
    public String getIataCode() {
        return iataCode;
    }

    @ApiModelProperty(required = true, dataType = "java.lang.String", example="Alborg")
    public String getAirportName() {
        return airportName;
    }


    public void setIataCode(String iataCode) {
        this.iataCode = iataCode;
    }

    public void setAirportName(String airportName) {
        this.airportName = airportName;
    }


    public void setCountry(String country) {
        this.country = country;
    }


    @Override
    public String toString() {
        return "Airport{" +
                "iataCode='" + iataCode + '\'' +
                ", airportName='" + airportName + '\'' +
                ", country='" + country + '\'' +
                '}';
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Airport airport = (Airport) o;
        return Objects.equals(iataCode, airport.iataCode) &&
                Objects.equals(airportName, airport.airportName) &&
                /*Objects.equals(city, airport.city) &&
                Objects.equals(state, airport.state) &&*/
                Objects.equals(country, airport.country);
    }

    @Override
    public int hashCode() {

        return Objects.hash(iataCode, airportName,country);
    }
}
