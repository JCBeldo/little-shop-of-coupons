class Merchants::CouponsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end
  
  def show

  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    coupon = merchant.coupons.new(coupon_params)
    if coupon.save
      redirect_to merchant_coupons_path(merchant)
    else
      flash[:alert] = "ERROR: Code Not Unique"
    end
  end

    private
    def coupon_params
      params.permit(:name, :unique_code, :disc_amount, :disc_type, :status)
    end
end