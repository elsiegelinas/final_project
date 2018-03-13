class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :restaurant_tags,
             :class_name => "Tagging",
             :dependent => :destroy

  has_many   :user_reviews,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
