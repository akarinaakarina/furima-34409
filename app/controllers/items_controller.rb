class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: :edit
  
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to :item
    else
      render :edit
    end
  end

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  #   redirect_to :root
  # end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :delivery_style_id, :prefecture_id,
                                 :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in? && current_user.id == Item.find(params[:id]).user.id
      redirect_to action: :index
    end
  end 
end
