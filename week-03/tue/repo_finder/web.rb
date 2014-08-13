require 'sinatra'
require 'haml'
require 'pry'
require './lib/github.rb'

get '/' do
  user = params[:user] || "rjgroller"
  @repos = Github.repos_for(user)
  haml :root
end

