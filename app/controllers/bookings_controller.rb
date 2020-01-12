
class BookingsController < ApplicationController
  # before_action :set_booking # only: [:show, :edit, :update, :destroy]

  # To create a booking I need this to be linked to a plant but to show the bookings I need to be linked to a current_user

  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    # @plant = Plant.find(params[:plant_id])
    # @booking.plant_id = @plant.id
  end

  def new
    @booking = Booking.new
    @booking.plant_id = params[:plant_id]
    authorize @booking
  end

  def create
    # you have to set the booking to the plant here !
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.plant_id = params[:plant_id]
    authorize @booking
    if @booking.save
      redirect_to user_path
    else
      render 'new'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to user_path
  end

  private

  # def set_booking
  #   @booking = Booking.find(params[:id])
  #   authorize @booking
  # end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :plant_id)
  end
end
