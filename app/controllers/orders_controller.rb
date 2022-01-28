class OrdersController < ApplicationController
  def index
    @order = Order.new
  end
  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def order_params
    params.require(:order).permit(:price, :name, :image, :shipping_cost_id).merge(item: current_item.id, user_id: current_user.id)
  end
end
