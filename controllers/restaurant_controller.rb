require('sinatra')
require('sinatra/reloader')


get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb (:"/restaurants/show")
end