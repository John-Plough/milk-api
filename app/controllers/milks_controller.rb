class MilksController < ApplicationController
  def index
    @milks = Milk.all
    render :index
  end

  def create
    @milk = Milk.create(
      name: params[:name],
      color: params[:color]
    )
    render :show
  end

  def show
    @milk = Milk.find_by(id: params[:id])
    render :show
  end

  def update
    @milk = Milk.find_by(id: params[:id])
    @milk.update(
      name: params[:name] || @milk.name,
      color: params[:color] || @milk.color
    )
    render :show
  end

  def destroy
    @milk = Milk.find_by(id: params[:id])
    @milk.destroy
    render json: { message: "that milk was destroyed" }
  end
end
