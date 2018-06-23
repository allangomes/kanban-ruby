# 
class Resources
  include ActiveModel::Serialization

  attr_accessor :data
  attr_reader :count
  def initialize(data)
    @data = data
    @count = data.size
  end



end
