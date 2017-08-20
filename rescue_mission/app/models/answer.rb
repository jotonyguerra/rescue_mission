class Answer < ApplicationRecord
  # belongs_to :question
  has_many :answer_questions
  has_many :questions, through: :answer_questions
  validates :answer, presence: true, length: {minimum: 50}
end
