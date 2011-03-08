package utils;

import java.lang.reflect.Type;

import models.Commune;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

public class CommuneSerializer implements JsonSerializer<Commune> {

	public JsonElement serialize(Commune commune, Type type, JsonSerializationContext jsonSerializationContext) {
		JsonObject obj = new JsonObject();
		obj.addProperty("id", commune.code);
		obj.addProperty("value", commune.libelleEnrichi + " (" + commune.code + ")");
		return obj;
	}
}
