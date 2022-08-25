class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def all_renters
    @bookings = current_user.gears_as_owners
    authorize @bookings
  end

  def create
    @booking = Booking.new(booking_params)
    @gear = Gear.find(params[:gear_id])
    @booking.user = current_user
    @booking.gear = @gear
    authorize @booking
    @booking.save
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(confirm_params)
    redirect_to all_renters_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    if current_user == @booking.user
      redirect_to bookings_path, status: :see_other
    else
      redirect_to all_renters_path, status: :see_other
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end

  def confirm_params
    params.require(:booking).permit(:confirmation)
  end
end
