class OrderItemsController < ApplicationController

  def new
    @order = Order.find(params[:order_id])
    @order_item = OrderItem.new(order_id: params[:order_id])
    @elements = @order.product.elements
  end

  def create
    @order = Order.find(params[:order_id])
    (0..params[:material_count].to_i).each do |i|
      element = params["material_#{i}".to_sym]
      element_id = element.keys.first
      color_id = element.values.first
      @order_item = @order.order_items.create(element_id: element_id, color_id: color_id, product_id: @order.product_id)
      puts element.keys
      puts element.values
    end
    @elements = @order.product.elements
    flash.now[:notice] = "Proces zamawiania został rozpoczęty"
    redirect_to order_path(@order)
  end


end

