package services;

import api.model.hours.AddHoursResponse;
import com.crowdar.api.rest.Response;
import com.crowdar.core.PropertyManager;

import java.util.HashMap;
import java.util.Map;

public class DeleteHoursService extends BaseService {

    public static Response delete(String jsonName) {
        return delete(jsonName, AddHoursResponse.class, setParams());
    }
    private static Map<String, String> setParams() {
        Map<String, String> params = new HashMap<String, String>();
        params.put("base.api.url", PropertyManager.getProperty("base.api.url"));
        params.put("api-key", PropertyManager.getProperty("api-key"));
        params.put("workspaceId",ID_W_SPACE.get());
        params.put("idHours" ,ID_HOURS.get());
        return params;
    }
}
