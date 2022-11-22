package api.config;

import api.model.ErrorResponse;
import services.*;

public enum EntityConfiguration {

    USER {
        @Override
        public Class<?> getEntityService() {
            return UserService.class;
        }

    },
    RESPONSE_HEADERS {
        @Override
        public Class<?> getEntityService() {
            return ResponseHeadersService.class;
        }
    },
    WORKSPACE {
        @Override
        public Class<?> getEntityService() {
            return WorkspaceService.class;
        }
    },
    PROJECT {
        @Override
        public Class<?> getEntityService() {
            return ProjectService.class;
        }
    },
    PROJECTS {
        @Override
        public Class<?> getEntityService() {
            return ProjectsService.class;
        }
    },
    ERRORS {
        @Override
        public Class<?> getEntityService() {
            return ErrorsService.class;
        }
    },
    ERROR {
        @Override
        public Class<?> getEntityService() {
            return ErrorService.class;
        }
    },
    HOURS {
        @Override
        public Class<?> getEntityService() {
            return HoursService.class;
        }
    },
    ADDHOURS {
        @Override
        public Class<?> getEntityService() {
            return AddHoursService.class;
        }
    },
    EDITHOURS{
        @Override
        public Class<?> getEntityService() {
            return EditHoursService.class;
        }
    },
    DELETEHOURS{
        @Override
        public Class<?> getEntityService() {
            return DeleteHoursService.class;
        }
    };


    public abstract Class<?> getEntityService();
}
