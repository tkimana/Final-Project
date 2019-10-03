class CardSerializer < ActiveModel::Serializer
    attributes :text, :id, :list_id
    belongs_to :list
  end