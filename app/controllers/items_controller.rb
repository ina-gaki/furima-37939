class ItemsController < ApplicationController
  before_action :authenticate_user! , only: [:new ,:edit ,:destroy]
  before_action :set_item, only: [:edit ,:show ,:update ,:destroy]
  before_action :move_to_index, only: :edit


  def index
    @items = Item.all.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
    end
    redirect_to root_path
  end
  

  private

  def item_params
    params.require(:item).permit(:name,:description,:category_id,:item_status_id,:cost_id,:prefecture_id,:send_days_id,:price,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if @item.purchase.present? ||current_user.id != @item.user_id
      redirect_to action: :index
    end
  end

end
