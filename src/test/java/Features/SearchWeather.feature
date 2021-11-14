
Feature: Call current weather data for one location

  Background:
    * url urlBase

  @feature1
  Scenario Outline: Given a city name, get the weather of that city
    * def cityData = read("classpath:Features/<city>.json")

    # Configure parameter
    Given param q = '<city>'
    And param appid = myAppid

    # Configure Header request
    And header Accept = '*/*'

     # Select method to send request
    When method GET

    # Verify status of response
    Then status 200

    # Verify content of response
    And match $.name == cityData.name
    And match $.timezone == cityData.timezone
    And match $.main.temp == '#number'

    Examples:
      |city     |
      |London   |
      |Vietnam  |


  @feature2
  Scenario: Given a wrong city name, there is an errors when get the weather of that city

    # Configure parameter
    Given param q = 'NotACity'
    And param appid = myAppid

    # Configure Header request
    And header Accept = '*/*'

     # Select method to send request
    When method GET

    # Verify status of response
    Then status 404

    # Verify content of response
    And match $.cod == "404"
    And match $.message == "city not found"


