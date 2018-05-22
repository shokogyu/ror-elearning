class Word < ApplicationRecord
  belongs_to :category
  has_many :answers, class_name: "WordAnswer"
  accepts_nested_attributes_for :answers, allow_destroy: true

  validates :category_id, presence: true
  validates :content,     presence: true,
                          length: { maximum: 50 },
                          uniqueness: true

end
