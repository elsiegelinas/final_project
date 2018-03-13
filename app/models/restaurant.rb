class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :user_reviews,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
