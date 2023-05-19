Feature: get account

  Background: API Setup steps
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Get Account API Call wth existing account
    Given path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    #daf Step is to define new variable in Karate Framework
    * def generatedToken = response.token
    Given path "/api/accounts/get-account"
    And param primaryPersonId = 7068
    And header Authorization = "Bearer " + generatedToken
    When method get
    Then status 200
    And print response
