class GearsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home show search]
  before_action :set_gear, only: %i[show edit update destroy]

  def home
    @gears = Gear.all
    authorize @gears
  end

  def index
    @gears = policy_scope(Gear)
  end

  def search
    @bookings = Booking.all
    @gears = Gear.search_location(params[:location])
    unless params[:sport] == ""
      if @gears.empty?
        @gears = Gear.search_sport(params[:sport])
      else
        @gears = @gears.search_sport(params[:sport])
      end
    end
    unless params[:gear] == ""
      if @gears.empty?
        @gears = Gear.search_gear(params[:gear])
      else
        @gears = @gears.search_gear(params[:gear])
      end
    end
    authorize @gears
  end

  def new
    @gear = Gear.new
    authorize @gear
  end

  def show
    authorize @gear
    @booking = Booking.new(gear: @gear)
  end

  def create
    gear_owner = current_user
    @gear = Gear.new(gear_params)
    @gear.user = gear_owner
    authorize @gear
    if @gear.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @gear
  end

  def update
    authorize @gear
    @gear.update(gear_params)
    redirect_to gear_path(@gear)
  end

  def destroy
    authorize @gear
    @gear.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_gear
    @gear = Gear.find(params[:id])
  end

  def gear_params
    params.require(:gear).permit(:sport_type, :gear_type, :description, :address, :price, :amount, photos: [])
  end
end
