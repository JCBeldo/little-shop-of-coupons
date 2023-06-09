class ApplicationController < ActionController::Base
  # helper_method :logo
  # helper_method :show_logo_likes

  def logo
    # @logo_thumb = LogoSearch.new.logo_image.logo_thumb_url
  end

  def show_logo_likes
    # @number_likes = LogoSearch.new.logo_image.logo_likes
  end

  def welcome
  end
end
