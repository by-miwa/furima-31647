class RecordsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @record_street = RecordStreet.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || !@item.record.nil?
  end

  def create
    @item = Item.find(params[:item_id])
    @record_street = RecordStreet.new(record_street_params)
    if @record_street.valid?
      pay_item
      @record_street.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  def record_street_params
    params.require(:record_street).permit(:postal, :prefecture_id, :city, :address, :apartment, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: record_street_params[:token],
      currency: 'jpy'
    )
  end
end
