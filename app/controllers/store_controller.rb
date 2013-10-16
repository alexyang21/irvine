class StoreController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end
end
