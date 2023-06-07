class Merchants::ItemsController < ApplicationController
  
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @item = Item.find(params[:id])
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
    @item = Item.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:merchant_id])
    @item = Item.find(params[:id])
    @item.update(item_params)

    redirect_to merchant_item_path(@merchant, @item) if item_params[:name].present?
    redirect_to merchant_items_path(@merchant) if item_params[:status].present?
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
    @item = Item.new
  end

  private

  def item_params
    params.permit(:name, :description, :status, :unit_price)
  end
end