require('sinatra')
require('sinatra/reloader')


get '/deals/:id' do
  @deal = Deal.find(params[:id])
  erb (:"/deals/show")
end