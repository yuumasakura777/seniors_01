class Talk < ApplicationRecord
  has_many :matchers
  has_many :users, through: :matchers, source: :user
end
