package services;

import com.crowdar.api.rest.MethodsService;

public class BaseService extends MethodsService {

    public static final ThreadLocal<String> API_KEY = new ThreadLocal<String>();

    public static final ThreadLocal<String> ID_W_SPACE = new ThreadLocal<String>();
    public static final ThreadLocal<String> ID_PROJECT = new ThreadLocal<String>();
    public static final ThreadLocal<String> ID_USER = new ThreadLocal<String>();
    public static final ThreadLocal<String> DESCRIPTION_HOURS = new ThreadLocal<>();
    public static final ThreadLocal<String> ID_HOURS = new ThreadLocal<>();
}
