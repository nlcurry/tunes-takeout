require_relative "../../lib/TunesTakeoutWrapper"

class SuggestionsController < ApplicationController
  skip_before_action :require_login, only: :index

  def index
    if current_user
      @user = User.find(session[:user_id])
    end

    if params[:query] != nil
    #for search results
      @query = params[:query]
      @suggestions = TunesTakeoutWrapper.search(@query)["suggestions"]
      @food = Food.get_food(@suggestions)
      @music = Music.get_music(@suggestions)
      render :index

    else
      #for top suggestions
      @suggestion_ids = TunesTakeoutWrapper.top_suggestions
      @suggestions = @suggestion_ids.map {|id| TunesTakeoutWrapper.retrieve(id)["suggestion"]}
      @food = Food.get_food(@suggestions)
      @music = Music.get_music(@suggestions)
    end
  end

  def myfavorites
    @my_favorites = TunesTakeoutWrapper.favorites(current_user.uid)["suggestions"]
    @suggestions = @my_favorites.map {|id| TunesTakeoutWrapper.retrieve(id)["suggestion"]}
    @food = Food.get_food(@suggestions)
    @music = Music.get_music(@suggestions)
  end

  def favorite

  end

  def unfavorite

  end

  def show

  end


end
