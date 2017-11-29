require('sinatra')
require('sinatra/reloader')


get '/burgers/:id' do
  @burger = Burger.find(params[:id])
  erb (:"/burgers/show")
end