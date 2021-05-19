class DevelopersGamesController < ApplicationController
  def index
    @developer = Developer.find(params[:id])

    if params[:user_number].nil? == false
      @developer_games = @developer.released_after(params[:user_number])
    elsif params[:sort] == 'true'
      @developer_games = @developer.order_by_name
    else
      @developer_games = @developer.games
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
