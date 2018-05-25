class Category < ApplicationRecord

  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy

  validates :title, presence: true,
                    length: {maximum: 50},
                    uniqueness: true

  validates :description, presence: true,
                          length: {maximum: 255}

  def lesson(user)
  	self.lessons.where("user_id = ?", user.id).first
  end
end
