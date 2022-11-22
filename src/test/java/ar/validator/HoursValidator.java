package ar.validator;

import api.model.Project.ProjectResponse;
import api.model.hours.AddHoursResponse;
import api.model.hours.HoursResponseItem;
import com.crowdar.api.rest.APIManager;
import org.testng.Assert;

public class HoursValidator {
    public void validateId(){
        HoursResponseItem[] response = (HoursResponseItem[]) APIManager.getLastResponse().getResponse();
        for (HoursResponseItem project :response) {
            Assert.assertNotNull(project.getId(),"El id es null");
        }
    }
    public void validateDescription(String description){
        AddHoursResponse response = (AddHoursResponse) APIManager.getLastResponse().getResponse();
        Assert.assertEquals(response.getDescription(),description, "La descripción de la hora no es la esperada");

    }
    public void validateDelete(){
        AddHoursResponse response = (AddHoursResponse) APIManager.getLastResponse().getResponse();
        Assert.assertNull(response.getId(),"El id no es null");

    }

}
