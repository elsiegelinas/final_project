require 'open-uri'
class Restaurant < ApplicationRecord
  before_validation :geocode_address

  def geocode_address
    if self.address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  belongs_to :cuisine,
             :counter_cache => true

  belongs_to :neighborhood,
             :counter_cache => true

  has_many   :restaurant_tags,
             :class_name => "Tagging",
             :dependent => :destroy

  has_many   :user_reviews,
             :dependent => :destroy

  # Indirect associations

  has_many   :tags,
             :through => :restaurant_tags,
             :source => :tag

  has_many   :users,
             :through => :user_reviews,
             :source => :user

  # Validations

end
