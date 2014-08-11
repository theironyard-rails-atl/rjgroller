# Homework: Learning about Sinatra
require 'sinatra'
require 'haml'

get '/main' do
  haml :main
end

get '/backwards' do
  haml :backwards
end

post '/backwards' do
  @word = params[:word].chomp.reverse
  haml :backwards
end

get '/screaming' do
  haml :screaming
end

post '/screaming' do
  @word = params[:word].chomp.upcase
  haml :screaming
end
