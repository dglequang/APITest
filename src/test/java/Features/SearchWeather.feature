
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
    And match $.cod == 200
    And match $.coord.lon == cityData.coord.lon
    And match $.coord.lat == cityData.coord.lat
    And match $.weather[0].id == '#number'
    And match $.weather[0].main == '#string'
    And match $.weather[0].description == '#string'
    And match $.base == "stations"
    And match $.main.temp == '#number'
    And match $.main.temp == '#number'
    And match $.timezone == cityData.timezone
    And match $.main.temp == '#number'
    And match $.main.feels_like == '#number'
    And match $.main.temp_min == '#number'
    And match $.main.temp_max == '#number'
    And match $.main.pressure == '#number'
    And match $.main.humidity == '#number'
    And match $.visibility == '#number'
    And match $.wind.speed == '#number'
    And match $.wind.deg == '#number'
    And match $.clouds.all == '#number'
    And match $.dt == '#number'
    And match $.sys.type == '#number'
    And match $.sys.id == '#number'
    And match $.sys.id == '#number'
    And match $.sys.country == cityData.sys.country
    And match $.sys.sunrise == '#number'
    And match $.sys.sunset == '#number'
    And match $.timezone == cityData.timezone
    And match $.id == cityData.id
    And match $.name == cityData.name


    Examples:
      |city     |
      |London   |
      |Seoul    |


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


