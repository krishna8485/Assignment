package com.lukkien.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.Objects;

@ApiModel
public class AddFlightRequest {

    Airport originAirport;
    Airport destAirport;
    String fare;

    @ApiModelProperty(required = true, dataType = "com.lukkien.model.Airport")
    public Airport getOriginAirport() {
        return originAirport;
    }

    public void setOriginAirport(Airport originAirport) {
        this.originAirport = originAirport;
    }

    @ApiModelProperty(required = true, dataType = "com.lukkien.model.Airport")
    public Airport getDestAirport() {
        return destAirport;
    }

    public void setDestAirport(Airport destAirport) {
        this.destAirport = destAirport;
    }

    @ApiModelProperty(required = true, dataType = "java.lang.String", example = "1234")
    public String getFare() {
        return fare;
    }

    public void setFare(String fare) {
        this.fare = fare;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AddFlightRequest that = (AddFlightRequest) o;
        return Objects.equals(originAirport, that.originAirport) &&
                Objects.equals(destAirport, that.destAirport) &&
                Objects.equals(fare, that.fare);
    }

    @Override
    public int hashCode() {

        return Objects.hash(originAirport, destAirport, fare);
    }

    @Override
    public String toString() {
        return "AddFlightRequest{" +
                "originAirport=" + originAirport +
                ", destAirport=" + destAirport +
                ", fare='" + fare + '\'' +
                '}';
    }
}
