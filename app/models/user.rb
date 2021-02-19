class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :photo, presence: true

    has_many :tweets
    has_many :likes


end
