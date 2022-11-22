package services;

import api.model.hours.HoursResponseItem;
import com.crowdar.api.rest.Response;
import com.crowdar.core.PropertyManager;

import java.util.HashMap;
import java.util.Map;

public class HoursService extends BaseService {

    public static Response get(String jsonName) {
        return get(jsonName, HoursResponseItem[].class,setParams());
    }

    private static Map<String, String> setParams() {
        Map<String, String> params = new HashMap<String, String>();
        params.put("base.api.url", PropertyManager.getProperty("base.api.url"));
        params.put("api-key", PropertyManager.getProperty("api-key"));
        params.put("workspaceId",ID_W_SPACE.get());
        params.put("userId", ID_USER.get());
        return params;
    }

}
