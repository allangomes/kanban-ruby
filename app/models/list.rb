# frozen_string_literal: true

# List Model
class List < ApplicationRecord
  # model association
  belongs_to :board
  has_many :lists, dependent: :destroy
end
