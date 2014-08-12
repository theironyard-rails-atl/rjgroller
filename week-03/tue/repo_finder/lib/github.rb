require 'httparty'
require 'pry'

class Repo
  def initialize(data)
    @data = data
  end

  keys = %w{name html_url description size created_at updated_at}
  keys.each do |k|
    define_method(k) do |k|
      @data[k]
    end
  end
  binding.pry
end

class Github
  include HTTParty
  base_uri 'https://api.github.com'

  def self.repos_for(username)
    response = get "/users/#{username}/repos", headers: { "User-Agent" => "Repo Finder" }
    response.map { |data| Repo.new data }
  end
end
