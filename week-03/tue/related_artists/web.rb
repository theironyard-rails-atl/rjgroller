require 'sinatra'
require 'haml'
require 'pry'
require './lib/spotify.rb'

get '/' do
  @artist = params[:artist_name] || "lostprophets" 
  @related_artists = SpotifyAPI.related_artists(@artist)
    haml :root
end

