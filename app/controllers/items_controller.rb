class ItemsController < ApplicationController
  def index
  end

private

  def item_params
    params.require(:item).permit(:image, :name, :info, :categpry_id, :sales_status_id, :shipping_fee_status_id,
                                :schedule__delivery_id, :price).merge(user_id: current_user.id)
  end
end
