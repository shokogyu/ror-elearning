class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :lesson_words

  #validates :lesson,  uniquness: { scope: [:user_id, :category_id]  }
end
