class StoreController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find_by name: (params[:restaurant_name])
    @menus = @restaurant.menus
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = @restaurant.menus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:name, :description, :price)
    end
end
