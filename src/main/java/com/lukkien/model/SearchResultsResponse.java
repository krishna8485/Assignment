package com.lukkien.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.Date;
import java.util.List;
import java.util.Objects;

@ApiModel
public class SearchResultsResponse{

    public SearchResultsResponse(Date timestamp, String message, String details, List<SearchResult> data) {
        this.timestamp = timestamp;
        this.message = message;
        this.details = details;
        this.data = data;
    }

    private Date timestamp;
    private String message;


    private String details;
    private List<SearchResult> data;

    @ApiModelProperty(required = true, dataType = "java.util.Date")
    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    @ApiModelProperty(required = true, dataType = "java.lang.String")
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @ApiModelProperty(required = true, dataType = "java.lang.String")
    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    @ApiModelProperty(required = true, dataType = "java.util.List<SearchResult>")
    public List<SearchResult> getData() {
        return data;
    }

    public void setData(List<SearchResult> data) {
        this.data = data;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SearchResultsResponse that = (SearchResultsResponse) o;
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
        return "SearchResultsResponse{" +
                "timestamp=" + timestamp +
                ", message='" + message + '\'' +
                ", details='" + details + '\'' +
                ", data=" + data +
                '}';
    }

}
