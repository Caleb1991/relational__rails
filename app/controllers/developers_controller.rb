class DevelopersController < ApplicationController
  def index
    @developers = Developer.all.order('created_at').reverse_order
  end

  def show
    @developer = Developer.find(params[:id])
  end
end
