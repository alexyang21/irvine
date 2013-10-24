class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :check_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @menus = @restaurant.menus
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def check_restaurant
      @restaurant = Restaurant.find_by name: (params[:restaurant_name])
      if @restaurant.nil?
        redirect_to root_url
        flash[:warning] = "Restaurant does not exist"
      end
    end
end
