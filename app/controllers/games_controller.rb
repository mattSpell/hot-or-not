require 'uri'
class GamesController < ApplicationController
  def index
    @home = Home.get_next_home(current_user)
  end

  def hot
    @home = Home.update_home(current_user, true, params[:home_id])
    respond_to do |format|
      format.js
      format.html
    end
  end

  def not
    @home = Home.update_home(current_user, false, params[:home_id])
    respond_to do |format|
      format.js
      format.html
    end
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

  # private
  # def home_params
  #   params.require(:home).permit(:id)
  # end

end
