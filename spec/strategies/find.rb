require 'rails_helper'

class FactoryBot::Factory::Find
  def association(runner)
    runner.run
  end

  def result(evaluation)
    query = get_overrides(evaluation)
    result = build_class(evaluation).where(query).first
    result
  end

  private

  def build_class(evaluation)
    evaluation.instance_variable_get(:@attribute_assigner).instance_variable_get(:@build_class)
  end

  def get_overrides(evaluation = nil)
    return @overrides unless @overrides.nil?
    evaluation.instance_variable_get(:@attribute_assigner).instance_variable_get(:@evaluator).instance_variable_get(:@overrides).clone
  end
end

FactoryBot.register_strategy(:find, FactoryBot::Factory::Find)
