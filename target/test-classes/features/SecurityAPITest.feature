Feature: API Test Security Section

  
  Scenario: Create token with valid username and password.
    #perpare request
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request  {"username": "supervisor","password": "tek_supervisor"}
    #Send request
    When method post
    #Validating response
    Then status 200
    And print response

  Scenario: Validate Token with Invalid username
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "WrongUser","password": "tek_supervisor"}
    When method post
    Then status 400
    And print response
    And assert response.errorMessage == "User not found"

  Scenario: Validate Token with Invalid password
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "Wrongpassword"}
    When method post
    Then status 400
    And print response
    And assert response.errorMessage == "Password Not Matched"
    
   
    