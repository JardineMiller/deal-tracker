require('sinatra')
require('sinatra/reloader')
require('date')

get '/admin/discounts' do #DISCOUNTS - INDEX
  @discounts = Discount.all
  erb (:"/admin/discounts/index")
end

get '/admin/discounts/new' do #DISCOUNTS - NEW
  @discounts = Discount.types
  erb (:"/admin/discounts/new")
end

post '/admin/discounts' do #DISCOUNTS - CREATE
  @discount = Discount.new(params)
  @discount.save
  redirect to '/admin/discounts'
end

get '/admin/discounts/:id/edit' do #DISCOUNTS - EDIT
  @discount = Discount.find(params[:id])
  erb (:"/admin/discounts/edit")
end

put '/admin/discounts/:id' do #DISCOUNTS - UPDATE
  Discount.new(params).update
  redirect to '/admin/discounts'
end

delete '/admin/discounts/:id' do #DISCOUNTS - DELETE
  discount = Discount.find(params[:id])
  discount.delete
  redirect to '/admin/discounts'
end