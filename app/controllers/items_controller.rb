class ItemsController < ApplicationController
  before_action :authenticate_user! , only: [:new]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:description,:category_id,:item_status_id,:cost_id,:prefecture_id,:send_days_id,:price)
  end

end
