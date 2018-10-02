class TmcController < ApplicationController
  def index
    get_params
    @jsonUrl = "https://api.sbif.cl/api-sbifv3/recursos_api/tmc/periodo/#{@startY}/#{@startM}/#{@endY}/#{@endM}?apikey=#{@apikey}&formato=json"
    require "net/http"
    url = @jsonUrl  
    @json = JSON.parse(Net::HTTP.get_response(URI.parse(url)).body)
    #@json = JSON.parse(IO.read("#{Rails.root}/app/assets/images/SBIFTMCDataTest.json"))
    @data = Hash.new
    nums = %w[26 25 33 35 36 21 24 22 34 41 45 44 43]
    nums.each do |n|
      @data.store(n, @json["TMCs"].select { |d| d["Tipo"]==n})
    end
  end

  private
  def get_params
    @startY = params[:startMonth][0..3]
    @startM = params[:startMonth][5..6]
    @endY = params[:endMonth][0..3]
    @endM = params[:endMonth][5..6]
    # swap values if operator missed order 
    if @startY > @endY
      @endY, @startY =  @startY, @endY
      @endM, @startM =  @startM, @endM
    end
    # warning dont print into html.erb
    @apikey = "a2e560226b0acec90f8893ace3d460edb8a087a3"
  end
end
