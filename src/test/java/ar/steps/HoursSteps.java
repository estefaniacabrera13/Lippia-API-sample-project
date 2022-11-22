package ar.steps;

import api.model.hours.AddHoursResponse;
import api.model.hours.HoursResponseItem;
import ar.validator.HoursValidator;
import com.crowdar.api.rest.APIManager;
import com.crowdar.core.PageSteps;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import services.AddHoursService;
import services.DeleteHoursService;
import services.EditHoursService;
import services.ProjectService;

import java.util.Arrays;

public class HoursSteps extends PageSteps {
    HoursValidator validator = new HoursValidator();
    @And("tengo un user id")
    public void tengoUnUserId() {
        ProjectService.ID_USER.set("6371972846d859292cc65a7c");
    }

    @Then("Valido que existen horas registradas en mi Workspace")
    public void obtengoLasHorasRegistradasDeMiWorkspace() {
        validator.validateId();
    }

    @Then("Valido que tengo una entrada de horas con el nombre '(.*)'")
    public void validoQueCreóUnaEntradaDeHorasConElNombreDescription(String description) {
        validator.validateDescription(description);
    }

    @And("tengo un nombre para las horas '(.*)'")
    public void tengoUnNombreParaLasHorasDescription(String description) {
        AddHoursService.DESCRIPTION_HOURS.set(description);

    }

    @And("se obtuvo un id hours de la respuesta")
    public void seObtuvoUnIdHoursDeLaRespuesta() {
        HoursResponseItem[] idHours = (HoursResponseItem[]) APIManager.getLastResponse().getResponse();
        EditHoursService.ID_HOURS.set(idHours[1].getId());
    }

    @Given("tengo la descripción de las horas '(.*)'")
    public void tengoLaDescripciónDeLasHorasDescription(String description) {
        EditHoursService.DESCRIPTION_HOURS.set(description);
    }

    @And("obtengo el id de la entrada de horas")
    public void obtengoElIdDeLaEntradaDeHoras() {
        AddHoursResponse idHours = (AddHoursResponse) APIManager.getLastResponse().getResponse();
        DeleteHoursService.ID_HOURS.set(idHours.getId());
    }

    @And("Valido que no tengo una entrada de horas con el id")
    public void validoQueNoTengoUnaEntradaDeHorasConElId() {
        validator.validateDelete();
    }
}
