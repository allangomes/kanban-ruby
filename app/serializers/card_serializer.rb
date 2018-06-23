# app/serializers/card_serializer.rb
class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :position, :board_id, :list_id
end
