package services;

import api.model.Project.ProjectResponse;
import com.crowdar.api.rest.Response;
import com.crowdar.core.PropertyManager;

import java.util.HashMap;
import java.util.Map;

public class ProjectService extends BaseService {

    public static final ThreadLocal<String> NAME_PROJECT = new ThreadLocal<>();
    public static Response get(String jsonName) {
        return get(jsonName, ProjectResponse.class,setParams());
    }
    public static Response put(String jsonName) {
        return put(jsonName, ProjectResponse.class,setParamsPut(setParams()));
    }
    private static Map<String,String> setParams(){
        Map<String,String> params = new HashMap<>();
        params.put("api-key", PropertyManager.getProperty("api-key"));
        params.put("wSpace",ID_W_SPACE.get());
        params.put("id_project", ID_PROJECT.get());
        return params;
    }

    private static Map<String,String> setParamsPut(Map<String, String> params ){
        params.put("name",NAME_PROJECT.get());
        return params;
    }
}
