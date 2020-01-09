class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
    @booking = Booking.find(params[:booking_id])
    @booking.destroy
    redirect_to booking_path(@booking.plant)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
