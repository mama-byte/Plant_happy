class BookingsController < ApplicationController
 #NOT FINESHED NEEDS TO BE CHECKED
  def show
    @booking = Booking.find(:id)
    @palnt = plant.find(:id)
  end

  def create
    @booking = Booking.new(booking_params[:id])
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'new'
    end
  end

  def destroy
    @booking = Booking.find(params[:booking_id])
    @booking.destroy
    redirect_to booking_path(@booking.plant_id)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
