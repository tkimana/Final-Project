class User < ApplicationRecord
    # before_save :email_downcase
    # VALID_EMAIL_REGEX= \/A[\w+\-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    # valides :email, presence: true, length: {maxmum: 244}, 
                    #  format:{with:  VALID_EMAIL_REGEX },
                    #  uniqueness: {case_sensitive: false}
    # valides :password, presence: true, length: {minimum:7}
    has_secure_password
    validates :email, presence: true, uniqueness: true, length: {maximum: 233}
    has_many :lists
    has_many :cards, through: :lists
 
  
end
