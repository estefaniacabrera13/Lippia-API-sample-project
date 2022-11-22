package services;
import api.model.hours.AddHoursResponse;
import com.crowdar.api.rest.Response;
import com.crowdar.core.PropertyManager;
import java.util.HashMap;
import java.util.Map;

public class AddHoursService extends BaseService {

    public static Response get(String jsonName) {
        return get(jsonName, AddHoursResponse.class,setParams());
    }
    public static Response post(String jsonName) {
        return post(jsonName, AddHoursResponse.class,setParamsPut(setParams()));
    }
    private static Map<String, String> setParams() {
        Map<String, String> params = new HashMap<String, String>();
        params.put("base.api.url", PropertyManager.getProperty("base.api.url"));
        params.put("api-key", PropertyManager.getProperty("api-key"));
        params.put("workspaceId",ID_W_SPACE.get());
        return params;
    }
    private static Map<String,String> setParamsPut(Map<String, String> params ){
        params.put("description", DESCRIPTION_HOURS.get());
        return params;
    }

}
