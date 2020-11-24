class RecordsController < ApplicationController
  def index
    @record_street = RecordStreet.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @record_street = RecordStreet.new(record_street_params)
    if @record_street.valid?
      @record_street.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  def record_street_params
    params.require(:record_street).permit(:postal, :prefecture_id, :city, :address, :apartment, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
   end

end
