class ParachutesController < ApplicationController
  before_action :set_parachute, only: %i[show destroy]
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

  def update
    @parachute = Parachute.find(params[:id])
    if @parachute.update(parachute_params)
      render json: @parachute
    else
      render json: @parachute.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Parachute not found' }, status: :not_found
  end

  def destroy
    @parachute.destroy
    render json: { message: 'Parachute destroyed successfully' }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Parachute not found' }, status: :not_found
  end

  def destroyAll
    Parachute.where.not(id: [1, 2, 3, 4]).destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('parachutes')
    render json: { message: 'Parachutes destroyed successfully' }, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_parachute
    @parachute = Parachute.find(params[:id])
  end

  def parachute_params
    params.require(:parachute).permit(:name, :city, :rent, :description, :min_duration, :photo_link)
  end
end
