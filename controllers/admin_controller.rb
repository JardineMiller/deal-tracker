require('sinatra')
require('sinatra/reloader')
require('date')

get '/admin/login' do
  erb (:"admin/login")
end