class ClpController < ApplicationController
  def index
  end
  def ufsCharts
    get_params
    @jsonUrl = "https://api.sbif.cl/api-sbifv3/recursos_api/uf/periodo/#{@startY}/#{@startM}/#{@endY}/#{@endM}?apikey=#{@apikey}&formato=xml"
    require "net/http"
    url = @jsonUrl  
    @json = JSON.parse(Net::HTTP.get_response(URI.parse(url)).body)
  end
  def dolarCharts
    get_params
    @jsonUrl = "https://api.sbif.cl/api-sbifv3/recursos_api/dolar/periodo/#{@startY}/#{@startM}/dias_i/01/#{@endY}/#{@endM}/dias_f/30?apikey=#{@apikey}&formato=json"
    require "net/http"
    url = @jsonUrl  
    @json = JSON.parse(Net::HTTP.get_response(URI.parse(url)).body)
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
