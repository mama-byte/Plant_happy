
class BookingsController < ApplicationController
  # before_action :set_plant

  # To create a booking I need this to be linked to a plant but to show the bookings I need to be linked to a current_user

  def show
    @booking = Booking.find(params[:id])
    @plant = Plant.find(params[:plant_id])
    @booking.plant_id = @plant.id
  end

  def index
    @bookings = current_user.bookings
  end

 # def new
 #    @booking = Booking.new
 #    # authorize @plant
 #  end

 #  def create
 #    # you have to set the booking to the plant here !
 #    @booking = Booking.new(booking_params)
 #    @booking.user_id = current_user.id
 #    if @booking.save
 #      redirect_to root_path
 #    else
 #      render 'new'
 #    end
 #  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path
  end

  private

  # def set_plant
  #     @plant = Plant.find(params[:plant_id])
  # end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :plant_id)
  end
end
