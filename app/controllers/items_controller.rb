class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_item, only:[:show, :edit, :update, :destroy]
  
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
  end
  def edit
    unless current_user.id == @item.user_id
        redirect_to action: :index
    end
  end
  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end
  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :region_id, :ship_length_id, :shipping_cost_id, :state_id, :image).merge(user_id: current_user.id)
  end

  def get_item
    @item = Item.find(params[:id])
  end
end
