package com.yogadetection;

import com.corundumstudio.socketio.SocketIOServer;
import com.yogadetection.config.SocketServer;
import lombok.AllArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@ServletComponentScan
@SpringBootApplication
@EnableScheduling
@AllArgsConstructor
public class YogadetectionApplication implements CommandLineRunner {

	private final SocketServer socketServer;

	public static void main(String[] args) {
		SpringApplication.run(YogadetectionApplication.class, args);
	}

	@Override
	public void run(String... args) {
		socketServer.start();
	}
}
