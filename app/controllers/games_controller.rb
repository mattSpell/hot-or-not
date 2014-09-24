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
    @home_scrape = HomeScraper.new('http://www.homefinder.com/TN/Nashville/').find_homes
  end

  def get_homes_list
    @homes_list = Home.get_unseen_homes(current_user)
  end

end
