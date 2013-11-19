class VendorsController < ApplicationController
  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(params[:vendor])
    @vendor.request = request

    if @vendor.deliver
      flash[:notice] = 'Thanks for your message!'
      redirect_to root_path
    else
      render :new
    end
  end
end
