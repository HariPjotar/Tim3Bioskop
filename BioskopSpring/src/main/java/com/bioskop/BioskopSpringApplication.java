package com.bioskop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan("model")
public class BioskopSpringApplication {

	public static void main(String[] args) {
		SpringApplication.run(BioskopSpringApplication.class, args);
	}

}
