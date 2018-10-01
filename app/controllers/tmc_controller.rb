class TmcController < ApplicationController
  def index
    @json = JSON.parse(IO.read("#{Rails.root}/app/assets/images/SBIFTMCDataTest.json"))
    @data = Hash.new
    nums = %w[26 25 33 35 36 21 24 22 34 41 45 44 43]
    nums.each do |n|
      @data.store(n, @json["TMCs"].select { |d| d["Tipo"]==n})
    end
  end
end
