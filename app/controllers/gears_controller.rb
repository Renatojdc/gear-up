class GearsController < ApplicationController
  def home
    @gears = Gear.all
  end

  def new
    @gear = Gear.new
  end

  def create
    gear_owner = User.find(params[:user_id])
    @gear = Gear.new
    @gear.user = gear_owner
    @gear.save
  end
end
