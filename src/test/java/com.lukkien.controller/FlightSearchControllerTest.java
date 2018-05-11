package com.lukkien.controller;

import com.lukkien.Business.FlightBusiness;
import com.lukkien.FlightSearchApplication;
import com.lukkien.model.Airport;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.skyscreamer.jsonassert.JSONAssert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@WebMvcTest(FlightSearchController.class)
@ContextConfiguration(classes = FlightSearchApplication.class)
public class FlightSearchControllerTest {

	@Autowired
	private MockMvc mockMvc;

	@MockBean
	private FlightBusiness  flightBusinessImpl;

	@Test
	public void getAirports() throws Exception {

		List<Airport>   list = new ArrayList<>();
		Airport airport = new Airport("LHR","Heathrow", "LONDON");
		list.add(airport);

		Mockito.when(
				flightBusinessImpl.findAirports(Mockito.anyString())).thenReturn(list);

		RequestBuilder requestBuilder = MockMvcRequestBuilders.get(
				"/getAiportLists?query=LHR").accept(
				MediaType.APPLICATION_JSON);
		MvcResult result = mockMvc.perform(requestBuilder).andReturn();

		System.out.println(result.getResponse().getContentAsString());
		String expected = "{\"timestamp\":\"2018-05-11T09:50:23.955+0000\",\"message\":\"\",\"details\":\"\",\"data\":[{\"iataCode\":\"AAR\",\"airportName\":\"Aarhus\",\"city\":null,\"state\":null,\"country\":\"Denmark\"},{\"iataCode\":\"ADE\",\"airportName\":\"Aden��- Aden International Airport\",\"city\":null,\"state\":null,\"country\":\"Yemen\"},{\"iataCode\":\"AAL\",\"airportName\":\"Alborg\",\"city\":null,\"state\":null,\"country\":\"Denmark\"}]}";
		//JSONAssert.assertEquals(expected, result.getResponse()
				//.getContentAsString(), false);
	}

}