class Tagging < ApplicationRecord
  # Direct associations

  belongs_to :restaurant

  belongs_to :user,
             :required => false

  # Indirect associations

  # Validations

end
