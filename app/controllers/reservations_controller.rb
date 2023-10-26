class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show destroy ]
  before_action :authorized

  def index
    @reservation = Reservation.all

    render json: @reservation
  end

  def show
    render json: @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = @user

    if @reservation.save
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:date_and_time, :user_id, :parachute_id, :duration)
  end
end
