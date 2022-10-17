package ar.steps;

import api.model.Project.ProjectResponse;
import ar.validator.ProjectValidator;
import com.crowdar.api.rest.APIManager;
import com.crowdar.core.PageSteps;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import services.ProjectService;

public class ProjectSteps extends PageSteps {
    ProjectValidator validator = new ProjectValidator();
    @Then("se valida que el id no sea null")
    public void seValidaQueElIdNoSeaNull() {
        validator.validate();
    }

    @And("un id_Wspace")
    public void unId_Wspace() {
        ProjectService.ID_W_SPACE.set("634ca6df3efac44cdc272e6f");
    }

    @Given("un id project de la respuesta")
    public void unIdProjectDeLaRespuesta() {
        ProjectResponse[] idProject = (ProjectResponse[])APIManager.getLastResponse().getResponse();
        ProjectService.ID_PROJECT.set(idProject[1].getId());
    }

    @Given("un id project incorrecto")
    public void unIdProjectIncorrecto() {
        ProjectService.ID_PROJECT.set("634ca6df3efac44cdc272e6f");
    }
}
