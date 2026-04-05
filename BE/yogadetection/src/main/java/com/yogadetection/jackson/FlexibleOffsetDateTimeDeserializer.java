package com.yogadetection.jackson;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.ZoneId;

/**
 * Accepts ISO-8601 timestamps with or without timezone.
 * Examples:
 * - 2026-04-05T18:08:56.789013+07:00
 * - 2026-04-05T11:05:56.090007Z
 * - 2026-04-05T18:08:56.789013 (timezone omitted)
 */
public class FlexibleOffsetDateTimeDeserializer extends JsonDeserializer<OffsetDateTime> {

    @Override
    public OffsetDateTime deserialize(JsonParser parser, DeserializationContext context) throws IOException {
        String value = parser.getValueAsString();
        if (value == null) {
            return null;
        }

        String trimmed = value.trim();
        if (trimmed.isEmpty()) {
            return null;
        }

        try {
            return OffsetDateTime.parse(trimmed);
        } catch (Exception ignored) {
            // fallthrough
        }

        // No timezone provided: interpret as local time in server default zone
        LocalDateTime localDateTime = LocalDateTime.parse(trimmed);
        return localDateTime.atZone(ZoneId.systemDefault()).toOffsetDateTime();
    }
}
