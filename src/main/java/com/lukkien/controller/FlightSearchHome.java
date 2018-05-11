package com.lukkien.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FlightSearchHome {
    /**
     *
     * @return
     */
    @RequestMapping("/welcome")
    public ModelAndView homePage() {
        return new ModelAndView("FlightSearch");
    }
}
