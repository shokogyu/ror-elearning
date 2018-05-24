class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :lesson_words, dependent: :destroy

  #validates :lesson,  uniquness: { scope: [:user_id, :category_id]  }
end
