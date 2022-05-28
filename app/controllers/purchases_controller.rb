class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index, only: :index


  def index

  end

  def create
    @total_purchase = TotalPurchase.new(purchase_params)
    if @total_purchase.valid?
      pay_item
      @total_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:total_purchase).permit(:postal_code, :prefecture_id, :city, :shipping_address, :building, :phone_number)
    .merge(item_id: @item.id ,user_id: current_user.id ,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'               
      )
  end

  def move_to_index
    @total_purchase = TotalPurchase.new
    if @item.purchase.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
