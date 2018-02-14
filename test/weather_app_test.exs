defmodule WeatherAppTest do
  use ExUnit.Case, async: true

  @api "api.openweathermap.org/data/2.5/weather?q="
  
  test "should return a encoded endpoint when take a alocation" do
    appid = WeatherApp.Weather.get_appid()
    endpiont = WeatherApp.Weather.get_endpoint("Sao Paulo")
    
    assert "#{@api}Sao%20Paulo&appid=#{appid}" == endpiont
  end

  test "should return Celsius when take Kelvin" do 
    kelvin_example = 296.48
    celsius_example = 23.3
    temperature = WeatherApp.Weather.kelvin_to_celsius(kelvin_example)

    assert celsius_example == temperature
  end

  test "should return temperature when take a valid location" do
    temperature = WeatherApp.Weather.temperature_of("Sao Paulo")

    assert String.contains?(temperature, "Sao Paulo") == true
  end

  test "should return not found when take an invalid location" do
    result = WeatherApp.Weather.temperature_of("00000")
    assert result == "00000: not found"
  end
end
