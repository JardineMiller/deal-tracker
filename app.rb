require('sinatra')
require('sinatra/reloader')
require('date')

require_relative('controllers/burger_controller.rb')
require_relative('controllers/deal_controller.rb')
require_relative('controllers/restaurant_controller.rb')
require_relative('controllers/admin_controller.rb')

require_relative('models/burger.rb')
require_relative('models/deal.rb')
require_relative('models/restaurant.rb')
require_relative('models/discount.rb')

get '/' do
  @deals = Deal.distinct_all
  @today = Date.today
  erb :index
end