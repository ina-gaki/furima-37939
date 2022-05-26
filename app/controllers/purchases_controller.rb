class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: [:index ,:new ,:create]

  def index
  end

  def new
  end

  def create
    @purchase = Purchase.create(purchase_params)
    ShippingAddress.create(address_params)
    redirect_to root_path
  end

  private

  def purchase_params
    params.merge(item_id: @item.id ,user_id: current_user.id)
  end

  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :shipping_address, :building, :phone_number, :purchase_id)
  end
end
