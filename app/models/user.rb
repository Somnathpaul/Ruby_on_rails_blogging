class User < ApplicationRecord
    # uniqueness: { case_sensitive: false } doesnot allow duplicate data
    
    validates :username, 
    presence: true, 
    length: {minimum: 3, maximum: 25}, 
    uniqueness: { case_sensitive: false }

    validates :email,
    presence: true,
    length: {minimum: 3, maximum: 64}, 
    uniqueness: { case_sensitive: false }
end