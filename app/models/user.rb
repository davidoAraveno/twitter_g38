class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :photo, presence: true, format: {with: URI::regexp(%w(http https))}

    has_many :tweets
    has_many :likes


end
