class SuggestionsController < ApplicationController
  skip_before_action :require_login, only: :index

  def index
    if session[:user_id]
      @user = User.find(session[:user_id]).name
      @user = @user.split[0]
    end
  end

  def favorites

  end

  def favorite

  end

  def unfavorite

  end

  def show

  end
end
