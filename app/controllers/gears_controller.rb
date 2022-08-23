class GearsController < ApplicationController
  before_action :set_gear, only: %i[show edit update destroy]

  def home
    @gears = Gear.all
  end

  def new
    @gear = Gear.new
  end

  def show
  end

  def create
    gear_owner = current_user
    @gear = Gear.new(gear_params)
    @gear.user = gear_owner
    if @gear.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @gear
  end

  def update
    @gear = Gear.update(gear_params)
    redirect_to gear_path
  end

  def destroy
    @gear.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_gear
    @gear = Gear.find(params[:id])
  end

  def gear_params
    params.require(:gear).permit(:sport_type, :gear_type, :description, :address, :price)
  end
end
