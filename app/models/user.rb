class User < ApplicationRecord
  # Direct associations

  has_many   :taggings,
             :dependent => :nullify

  has_many   :user_reviews,
             :dependent => :destroy

  # Indirect associations

  has_many   :restaurants,
             :through => :user_reviews,
             :source => :restaurant

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
