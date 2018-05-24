class Word < ApplicationRecord
  belongs_to :category
  has_many :answers, class_name: "WordAnswer", dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true
  has_many :lesson_words

  validates :category_id, presence: true
  validates :content,     presence: true,
                          length: { maximum: 50 },
                          uniqueness: true

  validate :has_one_correct_answer

  private

  def has_one_correct_answer
    unless answers.select { |a| a.correct? }.count == 1
       errors.add(:answers, "should have one correct answer")
    end
  end

end
