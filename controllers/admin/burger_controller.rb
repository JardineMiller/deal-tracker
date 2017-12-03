require('sinatra')
require('sinatra/reloader')
require('date')

get '/admin/burgers' do   #BURGER - INDEX
  @burgers = Burger.all
  erb (:"/admin/burgers/index")
end

get '/admin/burgers_by_restaurant' do   #BURGER - INDEX
  @burgers = Burger.by_restaurant
  erb (:"/admin/burgers/index")
end

get '/admin/burgers_by_price' do   #BURGER - INDEX
  @burgers = Burger.by_price
  erb (:"/admin/burgers/index")
end

get '/admin/burgers/new' do #BURGER - NEW
  @restaurants = Restaurant.all
  erb (:"/admin/burgers/new")
end

post '/admin/burgers' do #BURGER - CREATE
  @burger = Burger.new(params)
  @burger.save
  redirect to '/admin/burgers'
end

get '/admin/burgers/:id/edit' do #BURGER - EDIT
  @burger = Burger.find(params[:id])
  @restaurants = Restaurant.all
  erb (:"/admin/burgers/edit")
end

put '/admin/burgers/:id' do #BURGER - UPDATE
  Burger.new(params).update
  redirect to '/admin/burgers'
end

delete '/admin/burgers/:id' do #BURGER - DELETE
  burger = Burger.find(params[:id])
  burger.delete
  redirect to '/admin/burgers'
end