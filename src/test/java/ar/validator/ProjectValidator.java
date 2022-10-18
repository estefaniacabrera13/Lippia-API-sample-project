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
    public void validateName(String name){
        ProjectResponse response = (ProjectResponse) APIManager.getLastResponse().getResponse();
        Assert.assertEquals(response.getName(),name, "El nombre del proyecto no es el esperado");

    }

}
