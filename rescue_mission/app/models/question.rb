class Question < ApplicationRecord
  has_many :answer_questions
  has_many :answers, through: :answer_questions
  validates :title, presence: true, length: {minimum: 20}
  validates :description, presence: true, length: {minimum: 50}
end
