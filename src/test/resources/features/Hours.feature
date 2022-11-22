@Smoke @Hours
Feature: Hours

  Background:
    Given tengo un id_Wspace
  @ValidateHours
  Scenario Outline: Consultar las horas registradas.
    And tengo un user id
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then se obtuvo el status code <status>
    And Valido que existen horas registradas en mi Workspace

    Examples:
      | operation | entity | jsonName | status |
      | GET       | HOURS  | hours/rq | 200    |
  @AddHours
  Scenario Outline: Agregar horas a un proyecto.
    And tengo un nombre para las horas '<description>'
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then se obtuvo el status code <status>
    And Valido que tengo una entrada de horas con el nombre '<description>'

    Examples:
      | operation | entity   | jsonName          | status | description |
      | POST      | ADDHOURS | hours/addHours_rq | 201    | Carga Horas |

    @EditoProject
  Scenario Outline: Cambio de nombre de Project
    And tengo un user id
    When I perform a 'GET' to 'HOURS' endpoint with the 'hours/rq' and ''
    And Valido que existen horas registradas en mi Workspace
    And se obtuvo el status code <status>
    And se obtuvo un id hours de la respuesta
    And tengo la descripción de las horas '<description>'
    And I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then se obtuvo el status code <status>
    And Valido que tengo una entrada de horas con el nombre '<description>'

    Examples:
      | operation | entity    | description | jsonName         | status |
      | PUT       | EDITHOURS | Crowdar1    | hours/edit_hours | 200    |
      | PUT       | EDITHOURS | Crowdar2    | hours/edit_hours | 200    |

  @DeleteHours
  Scenario Outline: Eliminar hora registrada.
    And tengo un nombre para las horas '<description>'
    When I perform a 'POST' to 'ADDHOURS' endpoint with the 'hours/addHours_rq' and ''
    And se obtuvo el status code 201
    And Valido que tengo una entrada de horas con el nombre '<description>'
    And obtengo el id de la entrada de horas
    And I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then se obtuvo el status code <status>

    Examples:
      | operation | entity      | description | jsonName           | status |
      | DELETE    | DELETEHOURS | Crowdar1    | hours/delete_hours | 204    |