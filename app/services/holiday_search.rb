class HolidaySearch
  # def holiday
  #   HolidayDate.new(service.upcoming_holidays_url)
  # end

  def service
    UnsplashService.new.upcoming_holidays_url
  end

  def holidaze(num)
    holidaze = service.map do |holi|
      HolidayDate.new(holi)
    end
    holidaze.first(num)
  end
end