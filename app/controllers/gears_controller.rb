class GearsController < ApplicationController
  def home
    @gears = Gear.all
  end
end
