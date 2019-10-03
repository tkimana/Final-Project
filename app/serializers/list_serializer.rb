class ListSerializer < ActiveModel::Serializer
    attributes :title, :id
    has_many :cards  
  end