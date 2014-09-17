require 'uri'
class GamesController < ApplicationController
  def index
    # @home = Home.get_next_home(current_user)
    @home = Home.first
  end

  def scrape_homes
    @home_scrape = HomeScraper.
      new('http://www.zillow.com/homes/for_sale/Nashville-TN/6118_rid/days_sort/36.562049,-86.222763,35.813916,-87.347488_rect/9_zm/0_mmm/')
    @home_imgs = @home_scrape.get_items('img')
    @home_imgs.each do |home_url|
      URI.extract(home_url)
      home_url
    end
  end

end
