class UserSerializer < ActiveModel::Serializer
    attributes   :name, :email
    has_many :cards, through: :lists
    has_many :lists
end