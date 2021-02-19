class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes

  validates :content, presence: true

  def cant_likes
    self.likes.size
  end
end
