class SubwaysController < ApplicationController
  def new
  end
  def create
    if Subway.blank?
      html = HTTParty.get('http://data.cityofnewyork.us/api/views/drex-xx56/rows.json')
      json = JSON(html.body)
      json['data'].each do |entrance|
        lat = entrance[9][1].to_f
        long = entrance[9][2].to_f
        name = entrance[10]
        line = entrance[12]
        Subway.create(:name => name, :lat => lat, :long => long, :line => line)
      end
    end
    redirect_to root_path
  end
  def index
    @subways = []
  end
  def search
    @subways = Subway.text_search(params[:query])
  end
end
