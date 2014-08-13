require 'httparty'
require 'pry'

class Repo
  def initialize(data)
    @data = data
  end

  def name
    @data["name"]
  end

  def html_url
    @data["html_url"]
  end

  def description
    @data["description"]
  end

  def size
    @data["size"]
  end

  def created_at
    @data["created_at"]
  end

  def updated_at
    @data["updated_at"]
  end
end

class Github

  include HTTParty
  base_uri 'https://api.github.com'

  def self.repos_for(username)
    response = get "/users/#{username}/repos", headers: { "User-Agent" => "Repo Finder" }
    response.map { |data| Repo.new(data) }
  end
end
