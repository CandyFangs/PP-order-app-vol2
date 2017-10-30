class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @elements = @order.product.elements
  end

  def new
    @order = Order.new(product_id: params[:product_id])
    @product = Product.find(params[:product_id])
  end

  def create
    @order = Order.new(product_id: order_params[:product_id])
    @product = Product.find(order_params[:product_id])
    if @order.save!
      flash.now[:notice] = "Proces zamawiania został rozpoczęty"
      redirect_to new_order_order_item_path(@order)
    else
      flash[:error] = "Nie udało się zapisać"
      render :new
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(user: order_params[:user])
      flash[:notice] = "Wysłano adres email"
      redirect_to thanks_path
    else
      flash[:error] = "Nie udało się wysłać"
      render :edit
    end
  end
    
  private 

  def order_params
    params.require(:order).permit(:user, :product_id)
  end
end