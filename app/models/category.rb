class Category < ApplicationRecord

  has_many :words, dependent: :destroy
  has_many :lessons

  validates :title, presence: true,
                    length: {maximum: 50},
                    uniqueness: true

  validates :description, presence: true,
                          length: {maximum: 255}
end
