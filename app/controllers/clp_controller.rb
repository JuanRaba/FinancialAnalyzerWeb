class ClpController < ApplicationController
  def index
  end
  def ufsCharts
    @start = params[:startMonth][0..3]
    @end = params[:endMonth][0..3]
    # swap values if operator missed order 
    @end, @start =  @start, @end if @start > @end
  end
  def dolarCharts
    @startY = params[:startMonth][0..3]
    @startM = params[:startMonth][5..6]
    @endY = params[:endMonth][0..3]
    @endM = params[:endMonth][5..6]
    # swap values if operator missed order 
    if @startY > @endY
      @endY, @startY =  @startY, @endY
      @endM, @startM =  @startM, @endM
    end
  end
end
