require('sinatra')
require('sinatra/reloader')
require('date')
require('pry-byebug')

get '/admin/deals' do #DEALS - INDEX
  @deals = Deal.distinct_all
  erb (:"/admin/deals/index")
end

get '/admin/deals_by_restaurant' do #DEALS - INDEX
  @deals = Deal.by_restaurant
  erb (:"/admin/deals/index")
end

get '/admin/deals/new' do #DEALS - NEW
  @discounts = Discount.all
  @burgers = Burger.all
  erb (:"/admin/deals/new")
end

get '/admin/deals/add_burger' do
  @deals = Deal.distinct_all
  @burgers = Burger.all
  erb (:"/admin/deals/add_burger")
end

post '/admin/deals' do #DEALS - CREATE
  @deal = Deal.new(params)
  @deal.save
  redirect to '/admin/deals'
end

get '/admin/deals/:id/edit' do #DEALS - EDIT
  @deal = Deal.find(params[:id])
  @deals = Deal.distinct_all
  @discounts = Discount.all
  @burgers = Burger.all
  @days = Deal.days
  erb (:"/admin/deals/edit")
end

delete '/admin/deals/:id/delete-burger/:burger_id' do #DEALS - DELETE BURGER
  deal = Deal.find(params[:id])
  burger = Burger.find(params[:burger_id])
  deal.delete_burger(burger.id)
  redirect to "/admin/deals"
end


put '/admin/deals/:id' do #DEALS - UPDATE
  Deal.new(params).update
  redirect to '/admin/deals'
end

delete '/admin/deals/:id' do #DEALS - DELETE
  deal = Deal.find(params[:id])
  deal.delete_deal
  redirect to '/admin/deals'
end