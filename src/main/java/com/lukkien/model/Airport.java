package com.lukkien.model;

import com.fasterxml.jackson.annotation.JsonValue;

import java.io.Serializable;
import java.util.Objects;

public class Airport implements Serializable {

    private final String iataCode;

    private Airport(String iataCode) {
        this.iataCode = iataCode;
    }

    @JsonValue
    public String getIataCode() {
        return iataCode;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Airport airport = (Airport) o;
        return Objects.equals(iataCode, airport.iataCode);
    }

    @Override
    public int hashCode() {
        return Objects.hash(iataCode);
    }

    @Override
    public String toString() {
        return iataCode;
    }
}
