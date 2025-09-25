package com.utils;

import org.hibernate.annotations.IdGeneratorType;
import org.hibernate.generator.BeforeExecutionGenerator;
import org.hibernate.generator.EventType;

import com.github.f4b6a3.uuid.UuidCreator;

@IdGeneratorType(UUIDv7Generator.class)
public class UUIDv7Generator implements BeforeExecutionGenerator {

    @Override
    public Object generate(Object entity, Object currentValue, EventType eventType) {
        return UuidCreator.getTimeOrderedEpoch(); // UUID v7
    }
}
