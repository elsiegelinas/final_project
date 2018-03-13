class Restaurant < ApplicationRecord
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

  # Validations

end
