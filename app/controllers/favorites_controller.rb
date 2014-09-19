class FavoritesController < ApplicationController
  def index
    @favorites = Home.get_favorites(current_user)
  end
end
