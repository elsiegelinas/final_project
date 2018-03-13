class Tag < ApplicationRecord
  # Direct associations

  has_many   :restaurant_tags,
             :class_name => "Tagging",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
