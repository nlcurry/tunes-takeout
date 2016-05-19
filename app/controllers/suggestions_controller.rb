class SuggestionsController < ApplicationController
  skip_before_action :require_login, only: :index

  def index

  end

  def favorites

  end

  def favorite

  end

  def unfavorite

  end
end
