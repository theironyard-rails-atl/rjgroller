# Homework: Learning about Sinatra
require 'sinatra'
require 'haml'

get '/' do
  haml :main
end

post '/' do
  @word = params[:word].reverse
  haml :main
end
