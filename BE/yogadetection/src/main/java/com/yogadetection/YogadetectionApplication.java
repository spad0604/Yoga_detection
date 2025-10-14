package com.yogadetection;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class YogadetectionApplication {
	public static void main(String[] args) {
		SpringApplication.run(YogadetectionApplication.class, args);
	}

}
