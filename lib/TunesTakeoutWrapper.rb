require 'HTTParty'

class TunesTakeoutWrapper
  BASE_URL = "https://tunes-takeout-api.herokuapp.com"

  #find a defined list of suggestion based on query
  def self.search(query, limit=10, seed=query)
    data = HTTParty.get(BASE_URL + "/v1/suggestions/search?query=#{query}&limit=#{limit}&seed=#{query}").parsed_response
  end

  #find a defined list of top suggestions
  def self.top_suggestions(limit=20)
    data = HTTParty.get(BASE_URL + "/v1/suggestions/top?limit=#{limit}").parsed_response["suggestions"]
  end

  #find suggestion attributes based on suggestion ID
  def self.retrieve(suggestion_id)
    HTTParty.get(BASE_URL + "v1/suggestions/#{suggestion_id}").parsed_response
  end

  def self.favorites(uid)
    data = HTTParty.get(BASE_URL + "/v1/users/#{uid}/favorites").parsed_response
  end

end