# frozen_string_literal: true

# Board Model
class Board < ApplicationRecord
  # model association
  has_many :lists, dependent: :destroy
  has_many :cards, dependent: :destroy
end
