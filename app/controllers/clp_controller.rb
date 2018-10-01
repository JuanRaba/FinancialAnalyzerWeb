class ClpController < ApplicationController
  def index
  end
  def ufsCharts
    get_params
    @apikey = 'formato=json not working, fix it'
    @jsonUrl = "https://api.sbif.cl/api-sbifv3/recursos_api/uf/periodo/#{@startY}/#{@startM}/#{@endY}/#{@endM}?apikey=#{@apikey}&formato=xml"
  end
  def dolarCharts
    get_params
    @apikey = 'formato=json not working, fix it'
    @jsonUrl = "https://api.sbif.cl/api-sbifv3/recursos_api/dolar/periodo/#{@startY}/#{@startM}/dias_i/01/#{@endY}/#{@endM}/dias_f/30?apikey=#{@apikey}&formato=json"
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
    # warning we are exposing our apikey to the world
    @apikey = "a2e560226b0acec90f8893ace3d460edb8a087a3"
    # maybe we can use gem JSON and JSON.load(open("https://api.github.com"))
  end
end
