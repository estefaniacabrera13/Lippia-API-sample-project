@Project
Feature: Projects

  Background:
    Given tengo un id_Wspace

Scenario Outline: Consulta Project resultado exitoso
When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
Then se obtuvo el status code <status>
And se valida que el id no sea null

Examples:
| operation | entity   | jsonName   | status |
| GET       | PROJECTS | project/rq | 200    |

 @ProjectError
Scenario Outline: Consulta Project resultado erroneo
When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
Then se obtuvo el status code <status>
And se obtuvo el response esperado en <entity> con el <response>

Examples:
| operation | entity | jsonName       | response       | status |
| GET       | ERRORS | project/rq_401 | project/rs_401 | 401    |

 @ProjectError
Scenario Outline: Consulta Project por Id erroneo
And un id project incorrecto
When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
Then se obtuvo el status code <status>
And se obtuvo el response esperado en <entity> con el <response>

Examples:
| operation | entity | jsonName         | response       | status |
| GET       | ERROR  | projectId/rq_404 | project/rs_404 | 400    |

Scenario Outline: Consulta Project por Id
When I perform a '<operation>' to 'PROJECTS' endpoint with the 'project/rq' and ''
And se valida que el id no sea null
Then se obtuvo el status code <status>
Given se obtuvo un id project de la respuesta
When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
Then se obtuvo el status code <status>

Examples:
| operation | entity  | jsonName     | status |
| GET       | PROJECT | projectId/rq | 200    |

 @ProjectEdit
Scenario Outline: Cambio de nombre de Project
When I perform a 'GET' to 'PROJECTS' endpoint with the 'project/rq' and ''
And se valida que el id no sea null
Then se obtuvo el status code <status>
And se obtuvo un id project de la respuesta
Given se obtuvo el nombre '<name>' del project
When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
Then se obtuvo el status code <status>
And se valida que el nombre '<name>' fue editado

Examples:
| operation | entity  | name     | jsonName               | status |
| PUT       | PROJECT | Crowdar1 | projectId/edit_project | 200    |
| PUT       | PROJECT | Crowdar2 | projectId/edit_project | 200    |



