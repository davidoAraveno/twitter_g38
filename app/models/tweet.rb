class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  belongs_to :tweet


  def cant_likes
    self.likes.size
  end



end
