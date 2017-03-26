class ProductsController < ApplicationController

  def index
    @products = Product.all
    if params[:favorite] == "yes"
      @products = current_user.products
    end
  end
  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "成功加入购物车"
      redirect_to :back
    else
      flash[:warning] = "购物车已有此类商品，请勿重复添加！"
      redirect_to products_path
    end
  end
  def add_to_favorite
    @product = Product.find(params[:id])
    @product.users << current_user
    @product.save
    redirect_to :back, notice: "成功加入收藏！"
  end
  def quit_favorite
    @product = Product.find(params[:id])
    @product.users.delete(current_user)
    @product.save
    redirect_to :back, alert: "已取消收藏!"
  end
end
