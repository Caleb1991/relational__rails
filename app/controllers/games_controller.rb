class GamesController < ApplicationController
  def index
    @games = Game.only_show_physical_releases
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    game = Game.find(params[:id])
    game.update(game_params)
    redirect_to "/games/#{game.id}"
  end

  def destroy
    game = Game.find(params[:id])
    game.delete
    redirect_to '/games'
  end

  private
  def game_params
    params.permit(:name, :year_released, :consoles, :physical_release, :esrb_rating)
  end
end
