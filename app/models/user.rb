class User < ApplicationRecord
    has_secure_password

    has_many :tweets
    has_many :likes
end
