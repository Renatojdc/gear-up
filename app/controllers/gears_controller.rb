class GearsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @gears = Gear.all
    authorize @gears
  end

  def new
    @gear = Gear.new
    authorize @gear
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

  private

  def gear_params
    params.require(:gear).permit(:sport_type, :gear_type, :description, :address, :price)
  end
end
