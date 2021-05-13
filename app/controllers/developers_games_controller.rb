class DevelopersGamesController < ApplicationController
  def index
    @developer = Developer.find(params[:id])

    @developer_games = @developer.games
  end
end
