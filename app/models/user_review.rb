class UserReview < ApplicationRecord
  # Direct associations

  belongs_to :restaurant

  belongs_to :user

  # Indirect associations

  # Validations

end
