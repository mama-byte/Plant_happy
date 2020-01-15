
class BookingsController < ApplicationController
  # before_action :set_booking # only: [:show, :edit, :update, :destroy]


  def index
    @bookings = current_user.bookings
    @bookings = policy_scope(Booking)
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
    if not_plant_owner?
      if @booking.save
        redirect_to profile_path
      else
        render 'new'
      end
    else
      flash[:alert] = "You Cant book this Plant You Own it!! Time to take a Look at another plant!"
      redirect_to root_path
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to profile_path
  end

  private

  def not_plant_owner?
    @plant = Plant.find(params[:plant_id])
    if @plant.user_id != @booking.user_id
      true
    else
      false
    end
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :plant_id)
  end
end
