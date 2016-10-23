require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("forecast/coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================

    require "open-uri"
    url_darksky = "https://api.forecast.io/forecast/45aacf1f37783a36f76bdcee81ae254f/#{@lat+","+@lng}"
    parsed_data_darksky = JSON.parse(open(url_darksky).read)

    @current_temperature = parsed_data_darksky["currently"]["temperature"]

    @current_summary =  parsed_data_darksky["currently"]["summary"]

    @summary_of_next_sixty_minutes = parsed_data_darksky["minutely"]["summary"]

    @summary_of_next_several_hours = parsed_data_darksky["hourly"]["summary"]

    @summary_of_next_several_days = parsed_data_darksky["daily"]["summary"]

    render("forecast/coords_to_weather.html.erb")
  end
end
