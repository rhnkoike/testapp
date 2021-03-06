package com.example.sampleapp.rest;

import java.util.HashMap;
import java.util.Map;

import org.testcontainers.containers.PostgreSQLContainer;

import io.quarkus.test.common.QuarkusTestResourceLifecycleManager;

public class TestDatabase implements QuarkusTestResourceLifecycleManager {

	public static final PostgreSQLContainer<?> DATABASE = new PostgreSQLContainer<>("postgres:10.5")
			.withDatabaseName("quarkus_test")
			.withUsername("quarkus_test")
			.withPassword("quarkus_test");

	@Override
	public Map<String, String> start() {
		DATABASE.start();
		Map<String, String> datasourceProperties = new HashMap<>();
		datasourceProperties.put("quarkus.datasource.username", "quarkus_test");
		datasourceProperties.put("quarkus.datasource.password", "quarkus_test");
		datasourceProperties.put("quarkus.datasource.jdbc.url", DATABASE.getJdbcUrl());
		return datasourceProperties;
	}

	@Override
	public void stop() {

	}
}
