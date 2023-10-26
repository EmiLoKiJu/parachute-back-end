class ParachutesController < ApplicationController
  before_action :set_parachute, only: %i[ show destroy ]
  before_action :authorized

  def index
    @parachute = Parachute.all

    render json: @parachute
  end

  def show
    render json: @parachute
  end

  def create
    @parachute = Parachute.new(parachute_params)

    if @parachute.save
      render json: @parachute, status: :created, location: @parachute
    else
      render json: @parachute.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @parachute.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_parachute
    @parachute = Parachute.find(params[:id])
  end

  def parachute_params
    params.require(:parachute).permit(:name, :city, :rent, :description, :min_duration)
  end
end
