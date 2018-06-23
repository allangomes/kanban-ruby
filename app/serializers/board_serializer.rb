# app/serializers/board_serializer.rb
class BoardSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
end
