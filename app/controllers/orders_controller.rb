class OrdersController < ApplicationController
  require 'mandrill'
  include CurrentCart
  before_action :authenticate_user!

  before_action :set_cart,          only: [:new, :create]
  before_action :set_order,         only: [:show, :edit, :update, :destroy]
  before_action :check_user,        only: [:show, :edit, :update, :destroy]
  before_action :check_cart_empty,  only: [:new]

  # GET /orders
  # GET /orders.json
  def index
    # Admin users see all orders; non-Admins only see their own orders
    if current_user.admin
      @orders = Order.order("updated_at DESC")
    else
      @orders = current_user.orders.order("updated_at DESC")
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create

    # # Remember to change this to your live secret key in production
    # Stripe.api_key = ENV["STRIPE_TEST_API_KEY"]

    # # Get the credit card details submitted by the form
    # token = params[:stripeToken]

    @order = Order.new(order_params)
    @order.add_items_from_cart(@cart)
    @order.user_id = current_user.id

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil

        # Send email through Mandrill
        m = Mandrill::API.new ENV["MANDRILL_APIKEY"]

        message = {
          :subject    => "Hello from the Mandrill API",
          :from_name  => "Alex",
          :text       => "Hi message, how are you?",
          :to         => [{
            :email    => "susie.ye19@gmail.com",
            :name     => "Susie Ye"
          }],
          :html       =>"<html><h1>Hi <strong>message</strong>, how are you?</h1></html>",
          :from_email =>"alex@fliporder.com"
        }
        sending = m.messages.send message
        logger.info "#{sending.inspect}"

        # # Send a notification email to Alex
        # UserMailer.email_alert(@order).deliver

        # # Send an email receipt to user
        # UserMailer.email_receipt(current_user, @order).deliver

        # # Create the charge on Stripe's servers - this will charge the user's card
        # begin
        #   charge = Stripe::Charge.create(
        #     # :amount => (100 * @order.total_price).to_i,
        #     :amount => 0,
        #     :currency => "usd",
        #     :card => token,
        #     :description => "payinguser@example.com"
        #   )
        #   flash[:success] = "Thanks for ordering!"
        # rescue Stripe::CardError => e
        #   flash[:danger] = e.message
        # end

        format.html { redirect_to(root_url) }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to(orders_url)
      flash[:info] = "Sorry, couldn't find the order you were looking for"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :email, :phone, :address, :city, :state)
    end

    def check_cart_empty
      if @cart.items.empty?
        redirect_to(root_url)
        flash[:info] = "Your cart is empty"
      end
    end

    def check_user
      if !current_user.admin
        if current_user.id != @order.user_id
          redirect_to(orders_url)
          flash[:warning] = "You can only view orders placed from your account"
        end
      end
    end
end
