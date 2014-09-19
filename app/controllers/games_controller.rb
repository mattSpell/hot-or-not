require 'uri'
class GamesController < ApplicationController
  respond_to :html, :js
  def index
    @home = Home.get_next_home(current_user)
    @homes_list = get_homes_list
  end

  def hot
    @home = Home.update_home(current_user, true, params[:home_id])
    get_homes_list
  end

  def not
    @home = Home.update_home(current_user, false, params[:home_id])
    get_homes_list
  end

  private

  def scrape_homes
    @home_scrape = HomeScraper.
      new('http://www.zillow.com/homes/for_sale/Nashville-TN/6118_rid/days_sort/36.562049,-86.222763,35.813916,-87.347488_rect/9_zm/0_mmm/')
    @home_imgs = @home_scrape.get_items('img')
    @home_imgs.each do |home_url|
      URI.extract(home_url)
      home_url
    end
  end

  def get_homes_list
    @homes_list = Home.get_unseen_homes(current_user)
  end

  # def home_params
  #   params.require(:home).permit(:id)
  # end

end
