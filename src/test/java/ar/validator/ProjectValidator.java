package ar.validator;

import api.model.Project.ProjectResponse;
import com.crowdar.api.rest.APIManager;
import org.testng.Assert;

public class ProjectValidator {
    public void validate(){
        ProjectResponse[] response = (ProjectResponse[]) APIManager.getLastResponse().getResponse();
        for (ProjectResponse project :response) {
            Assert.assertNotNull(project.getId(),"El id es null");
        }
    }

}
