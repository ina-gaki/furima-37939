class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: [:index ,:create]

  def index
    @total_purchase = TotalPurchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @total_purchase = TotalPurchase.new(purchase_params)
    if @total_purchase.valid?
      @total_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:total_purchase).permit(:postal_code, :prefecture_id, :city, :shipping_address, :building, :phone_number, :purchase_id)
    .merge(item_id: @item.id ,user_id: current_user.id ,token: params[:token])
  end

end
