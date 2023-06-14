class HolidayDate
  attr_reader :names_3, :dates_3

  def initialize(data)
    @names_3 = data[:name]
    @dates_3 = data[:date]
    # @date_1 = data[0][:date]
    # @date_2 = data[1][:date]
    # @date_3 = data[2][:date]
    # @name_1 = data[0][:name]
    # @name_2 = data[1][:name]
    # @name_3 = data[2][:name]
  end
end
