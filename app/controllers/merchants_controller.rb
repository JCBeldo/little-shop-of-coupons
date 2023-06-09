class MerchantsController < ApplicationController
  def show
    @merchant = Merchant.find(params[:id])
    # @merchant_small = MerchantSearch.new.merchant_image.merchant_small_url
  end
end