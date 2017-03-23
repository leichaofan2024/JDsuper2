class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_is_admin
    if !current_user.admin?
      redirect_to root_path, alert: "你小子不是管理员！"
    end
  end
  def total_price
    sum = 0
    cart.cart_items.each do |cart_item|
      if cart_item.product.price.present?
        sum += cart_item.quantity*cart_item.product.price
      end
    end
    sum
  end
  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end


  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    return cart
  end
end
