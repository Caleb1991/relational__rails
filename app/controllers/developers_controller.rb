class DevelopersController < ApplicationController
  def index
    @developers = Developer.order_by_created
  end

  def show
    @developer = Developer.find(params[:id])
  end

  def new
  end

  def create
    Developer.create(developer_params)

    redirect_to '/developers'
  end

  def edit
    @developer = Developer.find(params[:id])
  end

  def update
    developer = Developer.find(params[:id])
    developer.update(developer_params)

    redirect_to "/developers/#{developer.id}"
  end

  def destroy
    developer = Developer.find(params[:id])
    developer.destroy
    redirect_to '/developers'
  end

  private
  def developer_params
    params.permit(:name, :year_founded, :still_active, :city, :number_of_staff)
  end
end
