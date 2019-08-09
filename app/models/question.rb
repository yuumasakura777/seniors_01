class Question < ApplicationRecord

  validates :title, presence:true
  validates :content, presence:true

  has_many :answers
  belongs_to :user

  scope :recent, ->{order(created_at: :desc)}

end
