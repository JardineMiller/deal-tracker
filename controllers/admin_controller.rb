require('sinatra')
require('sinatra/reloader')
require('date')

get '/admin' do
  erb (:"/admin/index")
end

get '/admin/login' do
  erb (:"admin/login")
end



get '/admin/burgers' do   #BURGER - INDEX
  @burgers = Burger.all
  erb (:"/admin/burgers/index")
end

get '/admin/burgers/new' do #BURGER - NEW
  @restaurants = Restaurant.all
  @burgers = Burger.all_types
  erb (:"/admin/burgers/new")
end

post '/admin/burgers' do #BURGER - CREATE
  @burger = Burger.new(params)
  @burger.save
  redirect to '/admin/burgers'
end

get '/admin/burgers/:id/edit' do #BURGER - EDIT
  @burger = Burger.find(params[:id])
  @burgers = Burger.all_types
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



get '/admin/restaurants' do #RESTAURANT - INDEX
  @restaurants = Restaurant.all
  erb (:"/admin/restaurants/index")
end

get '/admin/restaurants/new' do #RESTAURANT - NEW
  erb (:"/admin/restaurants/new")
end



get '/admin/deals' do #DEALS - INDEX
  @deals = Deal.distinct_all
  erb (:"/admin/deals/index")
end

get '/admin/deals/new' do #DEALS - NEW
  erb (:"/admin/deals/new")
end

