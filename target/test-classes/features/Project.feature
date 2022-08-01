#In this feature file, we are first generating
# 1): A valid Token
# 2): Creating new account
# 3): Adding address to that account
# 3): Adding phone information to that account
# 4): Adding car information to that account
@End-2-End
Feature: Generate token, Add new Account, add car info, add address and add phone info.

  Background: Generate a valid token using TokenGeneratorfeature file
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username":"supervisor","password":"tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token
    And print generatedToken

 @Accounts
  Scenario: End-To-End account creation.
    * def take = Java.type('TestData.FakeData')
    * def EmailV = take.getEmail()
    * def FirstNameV = take.getFirstName()
    * def LastNameV = take.getLastName()
    * def dob = take.getDOB()
    * def emplyment = take.getEmplymentStatus()

    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + generatedToken
    And request
      """
      {
      "email": "#(EmailV)",
      "firstName": "#(FirstNameV)",
      "lastName": "#(LastNameV)",
      "title": "Mr.",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "#(emplyment)",
      "dateOfBirth": "#(dob)"
      }
      """
    When method post
    Then status 201
    * def primaryId = response.id
    And print primaryId
    Then assert response.email == EmailV
    Then assert response.firstName == FirstNameV
    And assert response.lastName == LastNameV
    And print response


     #Adding address infor to an account
    * def generate = Java.type('TestData.FakeData')
    * def address = generate.getStreeAddress()
    * def city = generate.getcity()
    * def state = generate.getState()
    * def zipcode = generate.getZipCode()
    Given path "/api/accounts/add-account-address"
    And header Authorization = "Bearer " + generatedToken
    And param primaryPersonId  = primaryId
    And request
      """
      {
      "addressType": "Home",
      "addressLine1": "#(address)",
      "city": "#(city)",
      "state": "#(state)",
      "postalCode": "#(zipcode)",
      "current": true
      }
      """
      When method post
      Then status 201
      And print response
      Then assert response.addressLine1 == address
      Then assert response.city == city
      Then assert response.state == state
      Then assert response.postalCode == zipcode


     #Adding Phone inofo to an account
      * def myphone = Java.type('TestData.FakeData')
      * def PhoneNum = myphone.getPhoneNumber()
      * def phoneExten = myphone.getPhoneExtenstion()
      Given path "/api/accounts/add-account-phone"
      And header Authorization = "Bearer " + generatedToken
      And param primaryPersonId  = primaryId
      And request
      """
     {
    "phoneNumber": "#(PhoneNum)",
    "phoneExtension": "#(phoneExten)",
    "phoneTime": "Morning",
    "phoneType": "Mobil"
     }
      """
      When method post
      Then status 201
      And print response
      Then assert response.phoneNumber == PhoneNum
      Then assert response.phoneExtension == phoneExten
      Then assert response.phoneType == "Mobil"


     #Adding car info to an account
     Given path "/api/accounts/add-account-car"
     And header Authorization = "Bearer " + generatedToken
     And param primaryPersonId  = primaryId
     And request
     """
     {
    "make": "Toyta",
    "model": "Corola",
    "year": "2022",
    "licensePlate": "AH8978"
     }
     """
     When method post
     Then status 201
     And print response
     
    
