class CartsController < ApplicationController

  def cart_clean
    current_cart.cart_items.destroy_all
    redirect_to :back
  end
end
