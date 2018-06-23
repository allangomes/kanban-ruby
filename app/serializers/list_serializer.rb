# app/serializers/list_serializer.rb
class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
end
