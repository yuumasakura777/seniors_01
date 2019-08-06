class Post < ApplicationRecord

  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'


  validates :content, presence:true, length: {maximum: 100}

  #最新の投稿順に表示
  scope :recent, ->{order(created_at: :desc)}
end
