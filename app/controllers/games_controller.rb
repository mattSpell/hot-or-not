class GamesController < ApplicationController
  def index
    @home_scrape = HomeScraper.new('http://www.zillow.com/homes/for_sale/Nashville-TN/6118_rid/days_sort/36.562049,-86.222763,35.813916,-87.347488_rect/9_zm/0_mmm/')
    @homes = @home_scrape.get_items('img')
  end
end
