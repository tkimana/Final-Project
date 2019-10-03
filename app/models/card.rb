class Card < ApplicationRecord
   
    belongs_to :list
    has_one :user, through: :lists

    validates :text, presence: true
end
