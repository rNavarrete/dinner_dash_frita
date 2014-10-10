class ChargesController < ApplicationController

  def new
    @user = User.new
  end

  def create
  # Amount in cents
  @amount = stripe_total(subtotal)

  customer = Stripe::Customer.create(
    :email => 'jupiterjazz8@gmail.com',
    :card  => params[:stripeToken]
    )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
