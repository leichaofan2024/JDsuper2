class CartsController < ApplicationController

  def cart_clean
    current_cart.clean!
    redirect_to :back, alert:"成功清除购物车！"
  end
  def checkout
    @order = Order.new
  end
end
