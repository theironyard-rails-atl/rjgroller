require 'sinatra'
require 'haml'
require 'pry'
require './lib/github.rb'

get '/' do
  user = params[:user] || "rjgroller"
  binding.pry
  @repos = Github.repos_for(user)
  haml :root
end

