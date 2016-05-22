require 'yelp'

class Food < ActiveRecord::Base
  BASE_URL = "https://api.yelp.com/"

  #data should be an array of suggestion info
  def self.get_food(data)
    business = data.map do |datum|
      Yelp.client.business(datum["food_id"]).business
    end
    return business
  end
end
