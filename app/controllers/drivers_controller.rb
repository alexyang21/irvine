class DriversController < ApplicationController
  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(params[:driver])
    @driver.request = request

    if @driver.deliver
      flash[:notice] = 'Thanks for your message!'
      redirect_to root_path
    else
      render :new
    end
  end
end
