class WordAnswer < ApplicationRecord
  belongs_to :word

  validates :content, presence: true,
                      uniqueness: true,
                      length: { maximum: 50 }

  validates :correct,  acceptance: true

  private

  def gg

    
  end




end
