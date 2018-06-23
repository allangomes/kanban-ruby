# app/serializers/boards/resources_serializer.rb
class ResourcesSerializer < ActiveModel::Serializer
  attributes :data, :count
  has_many :data
end
