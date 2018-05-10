package com.lukkien.model;

import java.util.Date;
import java.util.List;
import java.util.Objects;

public class AiportsResponse {


    private Date timestamp;
    private String message;

    public AiportsResponse(Date timestamp, String message, String details, List<Airport> data) {
        this.timestamp = timestamp;
        this.message = message;
        this.details = details;
        this.data = data;
    }

    private String details;
    private List<Airport> data;


    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public List<Airport> getData() {
        return data;
    }

    public void setData(List<Airport> data) {
        this.data = data;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AiportsResponse that = (AiportsResponse) o;
        return Objects.equals(timestamp, that.timestamp) &&
                Objects.equals(message, that.message) &&
                Objects.equals(details, that.details) &&
                Objects.equals(data, that.data);
    }

    @Override
    public int hashCode() {

        return Objects.hash(timestamp, message, details, data);
    }

    @Override
    public String toString() {
        return "AiportsResponse{" +
                "timestamp=" + timestamp +
                ", message='" + message + '\'' +
                ", details='" + details + '\'' +
                ", data=" + data +
                '}';
    }
}
