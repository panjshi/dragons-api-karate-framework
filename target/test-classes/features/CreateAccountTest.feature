#Scenario: 10
#Endpoint = /api/accounts/add-primary-account.
#This Endpoint is to create new account and data will store in primary_person table.
#Status Code = 201
#Notes:
#duplicate email not accepted
#For Gender and maritalStatus You have to use the Predefined values.
#Once you create Account validate database and take screenshot.
#FirstName and LastName should be your name.
#In Request body we don't need id and isNew field (you can remove them).
Feature: Create Account Test

  Background: API Test Setup
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def generatedToken = result.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"
    
  Scenario: Create Account
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + generatedToken
    And request
      """
      {
      
      "email": "ashafff12@gmail.com",
      "firstName": "Ashraf",
      "lastName": "Broot",
      "title": "Mr",
      "gender": "MALE",
      "maritalStatus": "SINGLE",
      "employmentStatus": "Software Developer",
      "dateOfBirth": "2000-21-20",
      }
      """
    When method post
    Then status 201
    And print response
