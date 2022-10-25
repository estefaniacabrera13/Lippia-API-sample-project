package services;

import api.model.ErrorResponse;
import api.model.workspaces.WorkspacesResponse;
import com.crowdar.api.rest.Response;
import com.crowdar.core.PropertyManager;

import java.util.HashMap;
import java.util.Map;

public class WorkspaceService extends BaseService {

    public static Response get(String jsonName) {
        return get(jsonName, WorkspacesResponse[].class,setParams());
    }

    private static Map<String, String> setParams() {
        Map<String, String> params = new HashMap<String, String>();
        params.put("api-key", PropertyManager.getProperty("api-key"));
        return params;
    }

}
