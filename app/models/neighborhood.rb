class Neighborhood < ApplicationRecord
  # Direct associations

  has_many   :restaurants,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
