class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_post, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to :root
    else
      render :index
    end
  end

  private

  def set_post
    @item = Item.find(params[:item_id])
  end

  def buy_params
    params.require(:buy_address).permit(:postal_code, :prefecture_id, :municipality, :address, :phone_number, :building_name).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if @item.buy.present? || current_user.id == @item.user.id
  end
end
