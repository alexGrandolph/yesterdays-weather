class User < ApplicationRecord 
  validates_presence_of :username, :email
  validates_uniqueness_of :email
  validates_presence_of :password_digest, required: true
  has_secure_password

  has_many :locations

  def send_daily_sms(current_user)

    location = current_user.locations.first.name
    yesterday = Date.yesterday.strftime("%Y/%m/%d")
    date = yesterday.gsub("/","-")
    # binding.pry
    conn = Faraday.new(url: "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/") do |c|
    end 
    response = conn.get("timeline/#{location}/#{date}?unitGroup=us&key=#{ENV['VISUAL_CROSSING']}")
    data = JSON.parse(response.body, symbolize_names: true)
    @weather = Weather.new(data)
    message = {
      "Yesterdays Max Temperature": @weather.max_temp,
      "Yesterdays Min Temperature": @weather.min_temp, 
      "Yesterdays Average Temperature": @weather.average_temp,
      "Yesterdays Average Felt Like": @weather.felt_like 
    }

    twilio = TwilioClient.new
    twilio.send_text(current_user, message)
    # binding.pry
  end 

  def some_method

  end 
end