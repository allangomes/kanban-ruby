require 'rails_helper'

class FactoryBot::Factory::FindOrCreate
  def initialize
    @strategy = FactoryBot.strategy_by_name(:find).new
  end

  delegate :association, to: :@strategy

  def result(evaluation)
    found_object = @strategy.result(evaluation)
    if found_object.nil?
      @strategy = FactoryBot.strategy_by_name(:create).new
      @strategy.result(evaluation)
    else
      found_object
    end
  end
end

FactoryBot.register_strategy(:find_or_create, FactoryBot::Factory::FindOrCreate)
