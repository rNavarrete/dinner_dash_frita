class AddressPresenter
  attr_reader :address

  def initialize(address)
    @address = address
  end

  def delivery_address
    if @address
      "#{@address.street_number}" + " " + "#{address.street}"
    else
      "Pick Up Order"
    end
  end
end
