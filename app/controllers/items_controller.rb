class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :soldout_edit, only: [:edit]

  def index
    @item = Item.all.order(created_at: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
     if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
    end
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :price,
                                 :shipping_fee_status_id, :prefecture_id, :schedule_delivery_id, :sales_status_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def soldout_edit
   if @item.order.blank? && @item.user_id == current_user.id
       render :edit
   else
      redirect_to root_path
    end
  end

end
