class Merchants::CouponsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    # @coupon = 
  end
  
  def show
    @coupon = Coupon.find(params[:id])
    @merchant = Merchant.find(params[:merchant_id])
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
      redirect_to new_merchant_coupon_path(merchant)
    end
  end

  def update
    merchant = Merchant.find(params[:merchant_id])
    coupon = Coupon.find(params[:id])
    # require 'pry'; binding.pry
    coupon.update!(coupon_params)
    redirect_to merchant_coupon_path(merchant, coupon)
  end

    private
    def coupon_params
      params.permit(:name, :unique_code, :disc_amount, :disc_type, :status)
    end
end