package com.cmcc.es.app;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = { "cc.movein.common", "com.cmcc.es.app" })
// @ComponentScan(basePackages = { "cc.movein.common", "com.cmcc.es.app",
// "cc.movein.common.utils.RedisConfig" })
@MapperScan(basePackages = { "com.cmcc.es.app.mapper", "com.example.app.mapper" })

public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
}