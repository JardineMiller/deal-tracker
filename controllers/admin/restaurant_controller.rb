require('sinatra')
require('sinatra/reloader')
require('date')

get '/admin/restaurants' do #RESTAURANT - INDEX
  @restaurants = Restaurant.all
  erb (:"/admin/restaurants/index")
end

get '/admin/restaurants/new' do #RESTAURANT - NEW
  erb (:"/admin/restaurants/new")
end

post '/admin/restaurants' do #RESTAURANT - CREATE
  @restaurant = Restaurant.new(params)
  @restaurant.save
  redirect to '/admin/restaurants'
end

get '/admin/restaurants/:id/edit' do #RESTAURANT - EDIT
  @restaurant = Restaurant.find(params[:id])
  erb (:"/admin/restaurants/edit")
end

put '/admin/restaurants/:id' do #RESTAURANT - UPDATE
  Restaurant.new(params).update
  redirect to '/admin/restaurants'
end

delete '/admin/restaurants/:id' do #RESTAURANT - DELETE
  restaurant = Restaurant.find(params[:id])
  restaurant.delete
  redirect to '/admin/restaurants'
end