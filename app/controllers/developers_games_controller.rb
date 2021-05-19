class DevelopersGamesController < ApplicationController
  def index
    @developer = Developer.find(params[:id])

    @developer_games = @developer.games
    if params.include?('sort')
      @developer_games.order(:name)
    end
  end

  def new
    @developer = Developer.find(params[:id])
  end

  def create
    @developer = Developer.find(params[:id])
    @developer.games.create(game_params)
    redirect_to "/developers/#{@developer.id}/games"
  end

  private
  def game_params
    params.permit(:name, :year_released, :consoles, :physical_release, :esrb_rating)
  end
end
