class CartsController < ApplicationController

  def cart_clean
    current_cart.cart_items.destroy_all
    redirect_to :back, alert:"成功清除购物车！"
  end
end
