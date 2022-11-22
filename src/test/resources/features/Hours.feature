@Smoke @Hours
Feature: Hours

  Scenario Outline: Consultar las horas registradas.
    Given tengo un id_Wspace
    And tengo un user id
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then Valido que existen horas registradas en mi Workspace
    Examples:
      | operation | entity | jsonName | status |
      | GET       | HOURS  | hours/rq | 200    |

  Scenario Outline: Agregar horas a un proyecto.
    Given tengo un id_Wspace
    And tengo un nombre para las horas '<description>'
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then Valido que tengo una entrada de horas con el nombre '<description>'
    Examples:
      | operation | entity   | jsonName          | status | description |
      | POST      | ADDHOURS | hours/addHours_rq | 201    | Carga Horas |

  Scenario Outline: Cambio de nombre de Project
    Given tengo un id_Wspace
    And tengo un user id
    When I perform a 'GET' to 'HOURS' endpoint with the 'hours/rq' and ''
    And Valido que existen horas registradas en mi Workspace
    Then se obtuvo el status code <status>
    And se obtuvo un id hours de la respuesta
    Given tengo la descripción de las horas '<description>'
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then se obtuvo el status code <status>
    And Valido que tengo una entrada de horas con el nombre '<description>'

    Examples:
      | operation | entity    | description | jsonName         | status |
      | PUT       | EDITHOURS | Crowdar1    | hours/edit_hours | 200    |
      | PUT       | EDITHOURS | Crowdar2    | hours/edit_hours | 200    |

  @Hours
  Scenario Outline: Eliminar hora registrada.
    Given tengo un id_Wspace
    And tengo un nombre para las horas '<description>'
    When I perform a 'POST' to 'ADDHOURS' endpoint with the 'hours/addHours_rq' and ''
    And se obtuvo el status code 201
    Then Valido que tengo una entrada de horas con el nombre '<description>'
    And obtengo el id de la entrada de horas
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then se obtuvo el status code <status>
    #And Valido que no tengo una entrada de horas con el id

    Examples:
      | operation | entity      | description | jsonName           | status |
      | DELETE    | DELETEHOURS | Crowdar1    | hours/delete_hours | 204    |