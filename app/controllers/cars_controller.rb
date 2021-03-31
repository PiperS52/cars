class CarsController < ApplicationController

  def index 
    render json: Car.all 
  end 

  def create 
    car = Car.new(car_params)

    if car.save 
      render json: car, status: :created 
    else 
      render json: car.errors, status: :unprocessable_entity
    end
  end 

  def show
    render json: Car.find(params[:id])
  end 

  def destroy 
    Car.find(params[:id]).destroy!

    head :no_content 
  rescue ActiveRecord::RecordNotDestroyed
    render json: {}, status: :unprocessable_entity
  end 

  private 

  def car_params 
    params.require(:car).permit(:make, :model, :build_date, :colour_id)
  end 

end
