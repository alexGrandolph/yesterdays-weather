class Weather
  attr_reader :max_temp, :min_temp, :average_temp, :felt_like

  def initialize(data)

    @max_temp = data[:days][0][:tempmax]
    @min_temp = data[:days][0][:tempmin]
    @average_temp = data[:days][0][:temp]

    @felt_like = data[:days][0][:feelslike]
  end 


end 