class FavoritesController < ApplicationController
  respond_to :html, :js
  def index
    @favorites = Home.get_favorites(current_user)
  end

  def destroy
    home = ViewedHome.where("home_id = ?", params[:id]).first
    home.destroy!
    @favorites = Home.get_favorites(current_user)
  end
end
