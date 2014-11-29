class User < ActiveRecord::Base
  has_many :picks
  has_many :games, through: :picks
end
