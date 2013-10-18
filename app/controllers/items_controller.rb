class ItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_filter :check_item_from_same_restaurant, only: [:create]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    menu = Menu.find(params[:menu_id])
    @item = @cart.add_menu(menu.id)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item.cart }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html {
          redirect_to @item
          flash[:success] = "Item was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    if @item.quantity > 1
      @item.update_attributes(quantity: (@item.quantity - 1))
    else
      @item.destroy
    end

    respond_to do |format|
      if @cart.items.empty?
        format.html {
          redirect_to(root_url)
          flash[:info] = "Cart is now empty" }
        format.xml  { head :ok }
      else
        format.html { redirect_to(cart_url(session[:cart_id])) }
        format.xml  { head :ok }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:menu_id)
    end

    def check_item_from_same_restaurant
      menu = Menu.find(params[:menu_id])
      @cart.items.each do |item|
        if item.menu.restaurant != menu.restaurant
          item.destroy
        end
      end
    end
end
