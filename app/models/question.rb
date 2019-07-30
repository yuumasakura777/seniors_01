class Question < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  has_many :question_answer
  has_many :answers, through: :question_answer
  belongs_to :user
end
