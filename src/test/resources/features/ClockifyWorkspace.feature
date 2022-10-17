Feature: Workspace
  COMO usuario de Clockify
  QUIERO ver las configuraciones de mi Worckspace
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


  Scenario Outline: Consulta Project resultado exitoso
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and 'api-key:NGZkMWNmZWItZjdmZS00NjczLWJlOGItNjhkYzBmYTI1MTc1,wSpace:634ca6df3efac44cdc272e6f'
    And se obtuvo el status code <status>
    Then se valida que el id no sea null
    @Workspace
    Examples:
      | operation | entity  | jsonName   | status |
      | GET       | PROJECT | project/rq | 200    |


  Scenario Outline: Consulta Project resultado exitoso
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and 'api-key:MTZkZDk3ZDAtOTFlMi00ZGU1LWJlY2EtOWQ1YWNhNGUxNjBm,wSpace:6112892b5149fb6d8a519272'
    And se obtuvo el status code <status>
    Then se obtuvo el response esperado en <entity> con el <response>
    @Workspace
    Examples:
      | operation | entity | jsonName       | response       | status |
      | GET       | ERROR  | project/rq_401 | project/rs_401 | 401    |
  @prueba
  Scenario Outline: Consulta Project por Id
    #Given Mi cuenta creada en clockify y mi X-Api-Key geneada
    And un id_Wspace
    When I perform a '<operation>' to 'PROJECTS' endpoint with the 'project/rq' and ''
    Then se valida que el id no sea null
    And se obtuvo el status code <status>
    Given un id project de la respuesta
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>

    @Project
    Examples:
      | operation | entity  | jsonName     | status |
      | GET       | PROJECT | projectId/rq | 200    |


  Scenario Outline: Consulta Project por Id
    #Given Mi cuenta creada en clockify y mi X-Api-Key geneada
    And un id_Wspace
    When I perform a '<operation>' to 'PROJECTS' endpoint with the 'project/rq' and ''
    Then se valida que el id no sea null
    And se obtuvo el status code <status>
    Given un id project incorrecto
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then se obtuvo el response esperado en <entity> con el <response>

    @Project
    Examples:
      | operation | entity  | jsonName     | response       | status |
      | GET       | PROJECT | projectId/rq | project/rs_404 | 400    |
