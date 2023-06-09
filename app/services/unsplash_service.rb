# class UnsplashService
#   def logo_url
#     get_url("https://api.unsplash.com/photos/MRjjcDIk3Gw?client_id=Un0YxxAZVKw0udaKi8OZgX4PkfMxqU9wDSvvADb4n88")
#   end

#   def item_url(image)
#     get_url("https://api.unsplash.com/photos/random?client_id=nJm3PMI0ChpgEr9xIkC_gqCPpvJF3J8mshaK517tRPI&query=#{image}")
#   end

#   def merchant_url
#     get_url("https://api.unsplash.com/photos/random?client_id=5LdyjwQLiAuLrMg_CQSXRjgo3hk9DvIE40lLpY4_nvA")
#   end

#   def get_url(url)
#     response = HTTParty.get(url)
#     JSON.parse(response.body, symbolize_names: true)
#   end
# end