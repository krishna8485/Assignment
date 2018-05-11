package com.lukkien.Exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class ApplicationBusinessException extends Exception {
    public ApplicationBusinessException(String message, Exception exception) {
        super(message, exception);
    }

}