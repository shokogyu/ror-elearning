class WordAnswer < ApplicationRecord
  belongs_to :word
  has_one :lesson_word

  validates :content, presence: true,
                      uniqueness: true,
                      length: { maximum: 50 }

end
