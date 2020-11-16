class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:title, :text, :category_id, :status_id, :delivery_id, :area_id, :days_id, :price).merge(user_id: current_user.id)
  end
end