Feature: Workspace
  COMO usuario de Clockify
  QUIERO ver las configuraciones de clockify
  PARA llevar un buen control de mis horas de trabajo y el de mis empleados

  Scenario Outline: Consulta Workspace resultado exitoso
    Given Mi cuenta creada en clockify y mi X-Api-Key geneada
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then Obtengo los datos de mi Workspace
    @Workspace
    Examples:
      | operation | entity    | jsonName     | status |
      | GET       | WORKSPACE | workspace/rq | 200    |

  Scenario Outline: Consulta Workspace resultado erroneo
    Given X-Api-Key invalido
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    @Workspace
    Examples:
      | operation | entity | jsonName     | status |
      | GET       | ERROR  | workspace/rq | 401    |

  @prueba
  Scenario Outline: Consulta Project resultado exitoso
    Given tengo un id_Wspace
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then se valida que el id no sea null
    @Workspace
    Examples:
      | operation | entity   | jsonName   | status |
      | GET       | PROJECTS | project/rq | 200    |

  @prueba
  Scenario Outline: Consulta Project resultado erroneo
    Given tengo un id_Wspace
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then se obtuvo el response esperado en <entity> con el <response>
    @Workspace
    Examples:
      | operation | entity | jsonName       | response       | status |
      | GET       | ERROR  | project/rq_401 | project/rs_401 | 401    |

  @prueba
  Scenario Outline: Consulta Project por Id erroneo
    Given tengo un id_Wspace
    And un id project incorrecto
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then se obtuvo el response esperado en <entity> con el <response>

    @Workspace
    Examples:
      | operation | entity | jsonName         | response       | status |
      | GET       | ERROR  | projectId/rq_404 | project/rs_404 | 400    |

  @prueba
  Scenario Outline: Consulta Project por Id
    Given tengo un id_Wspace
    When I perform a '<operation>' to 'PROJECTS' endpoint with the 'project/rq' and ''
    And se valida que el id no sea null
    And se obtuvo el status code <status>
    And se obtuvo un id project de la respuesta
    And I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then se obtuvo el status code <status>

    @Project
    Examples:
      | operation | entity  | jsonName     | status |
      | GET       | PROJECT | projectId/rq | 200    |

  @prueba
  Scenario Outline: Cambio de nombre de Project
    Given tengo un id_Wspace
    When I perform a 'GET' to 'PROJECTS' endpoint with the 'project/rq' and ''
    And se valida que el id no sea null
    And se obtuvo el status code <status>
    And se obtuvo un id project de la respuesta
    And se obtuvo el nombre '<name>' del project
    And I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then se obtuvo el status code <status>
    And se valida que el nombre '<name>' fue editado


    @Project
    Examples:
      | operation | entity  | name     | jsonName               | status |
      | PUT       | PROJECT | Crowdar1 | projectId/edit_project | 200    |
      | PUT       | PROJECT | Crowdar2 | projectId/edit_project | 200    |



