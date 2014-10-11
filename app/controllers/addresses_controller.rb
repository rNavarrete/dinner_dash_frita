class AddressesController < ApplicationController

  def create
    @address = Address.create(address_params)
    redirect_to new_order_path(address: @address)    
  end

  private

  def address_params
    params.require(:address).permit(:street_number, :street, :city, :state, :zip)
  end
end
