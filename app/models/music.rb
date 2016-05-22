require 'rspotify'

class Music < ActiveRecord::Base
  DEFAULT_PIC = "spotify.jpeg"
  #data should be array
  def self.get_music(sug_array)
    data = sug_array.map do |sug|
      if sug["music_type"] == "artist"
         RSpotify::Artist.find(sug["music_id"])
      elsif sug["music_type"] == "album"
         RSpotify::Album.find(sug["music_id"])
      elsif sug["music_type"] == "track"
         RSpotify::Track.find(sug["music_id"])
         #go to albums images then url
      end
    end
    return data
  end

  def self.find_image(image)

    if image.nil?
      return DEFAULT_PIC
    elsif image[0].nil?
      return DEFAULT_PIC
    else
      image[0]["url"]
    end
  end
end
