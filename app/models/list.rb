class List < ApplicationRecord
    # acts_as_list
    has_many :cards
    belongs_to :user
    accepts_nested_attributes_for :cards
   
end
