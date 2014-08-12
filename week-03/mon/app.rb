# Homework: Learning about Sinatra
require 'sinatra'
require 'haml'
require './shift.rb'

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

get '/shifty' do
  haml :shifty
end

post '/shifty' do
  @catch = params[:word].chomp.upcase
  if params[:action] == "Left"
    @word = Shift.new(@catch).left
    @word
  else
    @word = Shift.new(@catch).right
    @word
  end
  haml :shifty
end

