require('sinatra')
require('sinatra/reloader')
require('date')
require('pry-byebug')

require_relative('controllers/admin/discount_controller.rb')
require_relative('controllers/admin/burger_controller.rb')
require_relative('controllers/admin/deal_controller.rb')
require_relative('controllers/admin/restaurant_controller.rb')

require_relative('controllers/deal_controller.rb')
require_relative('controllers/restaurant_controller.rb')
require_relative('controllers/admin_controller.rb')
require_relative('controllers/burger_controller.rb')

require_relative('models/burger.rb')
require_relative('models/deal.rb')
require_relative('models/restaurant.rb')
require_relative('models/discount.rb')

get '/' do
  @deals = Deal.distinct_all
  @today = Date.today
  erb :index
end

get '/results' do
  @search_query = params[:search].capitalize
  @deals = Deal.search(@search_query)
  @burgers = Burger.search(@search_query)
  @restaurants = Restaurant.search(@search_query)
  # binding.pry
  erb :results
end