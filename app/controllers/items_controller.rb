class ItemsController < ApplicationController
  def index
  end
  def new
    if user_signed_in?
      render new_item_path  
    else
      redirect_to new_user_session_path
      @item = Itme.new
    end
  end
  def create
    @item = Itme.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :region_id, :ship_length_id, :shipping_cost_id, :state_id)
  end
end
