class Answer < ApplicationRecord
  has_many :question_answer
  has_many :question, through: :question_answer
end
