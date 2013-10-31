class RestaurantsController < ApplicationController
  before_action do
    require_login("You need to be logged in (and be an Admin) to see that")
  end
  before_action :require_admin

  before_action :check_admin, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html {
          redirect_to @restaurant
          flash[:success] = "Restaurant was successfully created." }
        format.json { render action: 'show', status: :created, location: @restaurant }
      else
        format.html { render action: 'new' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html {
          redirect_to @restaurant
          flash[:success] = "Restaurant was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html {
        redirect_to restaurants_url
        flash[:success] = "Restaurant removed from listing" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to(root_url)
      flash[:info] = "Sorry, couldn't find the restaurant you were looking for"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :image_url)
    end

    def check_admin
      if !current_user.admin
        redirect_to(root_url)
        flash[:warning] = "Only admin are allowed to modify restaurants"
      end
    end
end
