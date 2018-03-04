package org.jabrena.profiling.demo;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@SpringBootApplication
public class DemoApplication {


	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

	@GetMapping("/demo")
	public ResponseEntity<?> greeting() {

		List<String> evilList = new ArrayList<>();

		evilList.add(RandomStringUtils.randomAlphabetic(100));

		final ResponseDemo result = new ResponseDemo("Hello World");
		final HttpStatus status = HttpStatus.OK;

		return new ResponseEntity<>(result, status);
	}

	private class ResponseDemo {

		final String message;

		public ResponseDemo(String message) {
			this.message = message;
		}

		public String getMessage() {
			return message;
		}
	}
}
